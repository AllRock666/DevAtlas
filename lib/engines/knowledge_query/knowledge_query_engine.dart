import 'package:drift/drift.dart' as drift;
import 'models/knowledge_query_response.dart';
import '../storage/database.dart';

import '../study_page_builder/rendered_document.dart';

enum QueryIntent { definition, complexity, comparison, pattern, concept }

class QueryAnalyzer {
  QueryIntent analyze(String query) {
    final lower = query.toLowerCase();
    if (lower.startsWith('what is') || lower.startsWith('define')) return QueryIntent.definition;
    if (lower.contains('compare') || lower.contains('vs') || lower.contains('difference')) return QueryIntent.comparison;
    if (lower.contains('o(') || lower.contains('complexity') || lower.contains('time') || lower.contains('space')) return QueryIntent.complexity;
    if (lower.contains('pattern') || lower.contains('which problems')) return QueryIntent.pattern;
    return QueryIntent.concept;
  }
}

abstract class KnowledgeQueryEngine {
  Future<KnowledgeQueryResponse> query(String input, SearchFilters filters);
  Future<List<String>> getSuggestions(String partial);
}

class RuleBasedKnowledgeQueryEngine implements KnowledgeQueryEngine {
  final AppDatabase _db;
  final QueryAnalyzer _analyzer = QueryAnalyzer();

  RuleBasedKnowledgeQueryEngine(this._db);

  @override
  Future<List<String>> getSuggestions(String partial) async {
    if (partial.isEmpty) return [];
    final lower = partial.toLowerCase();
    final results = await (_db.select(_db.extractedConcepts)
      ..where((t) => t.name.lower().like('%$lower%'))
      ..limit(5)).get();
    return results.map((e) => e.name).toSet().toList();
  }

  @override
  Future<KnowledgeQueryResponse> query(String rawInput, SearchFilters filters) async {
    final input = rawInput.trim();
    final intent = _analyzer.analyze(input);
    final blocks = <StudyBlock>[];
    final actions = <KnowledgeNavigationAction>[];

    String cleanConcept = input.replaceAll(RegExp(r'what is|define|compare|vs|difference|complexity of', caseSensitive: false), '').trim();
    if (cleanConcept.isEmpty) cleanConcept = input;

    // Retrieve matching concepts globally (Try exact match first)
    var matchedConcepts = await (_db.select(_db.extractedConcepts)
      ..where((t) => t.name.equals(input) | t.name.equals(cleanConcept))).get();

    if (matchedConcepts.isEmpty) {
      matchedConcepts = await (_db.select(_db.extractedConcepts)
        ..where((t) => t.name.lower().like('%${cleanConcept.toLowerCase()}%'))).get();
    }

    if (matchedConcepts.isEmpty) {
      // Fallback: search KnowledgeCards by exact title or like
      final matchedCards = await (_db.select(_db.knowledgeCards)
        ..where((t) => t.title.equals(input) | t.title.equals(cleanConcept) | t.title.lower().like('%${cleanConcept.toLowerCase()}%'))).get();

      if (matchedCards.isNotEmpty) {
        blocks.add(StudyParagraphBlock(id: 'found_arts', text: 'Found ${matchedCards.length} matching articles for "$input":'));
        for (var card in matchedCards) {
          actions.add(KnowledgeNavigationAction(
            label: 'Read Article: ${card.title}', 
            type: KnowledgeNavigationType.viewStudyPage, 
            targetId: card.id
          ));
        }
        print('Returning fallback KnowledgeQueryResponse with ${blocks.length} blocks and ${actions.length} actions.');
        return KnowledgeQueryResponse(query: input, intentDetected: 'search', primaryConcept: input, genericBlocks: blocks, navigationActions: actions);
      }

      blocks.add(StudyParagraphBlock(id: 'err', text: 'No local knowledge found for "$input". You can search the web and import it directly into your DevAtlas library below.'));
      return KnowledgeQueryResponse(query: input, intentDetected: 'web_search', primaryConcept: '', genericBlocks: blocks, navigationActions: actions);
    }

    final topConcept = matchedConcepts.first;
    final allCardIds = matchedConcepts.map((c) => c.cardId).toSet().toList();

    // Helper to fetch global elements
    Future<SemanticElement?> getBestElement(String elementType) async {
      final query = _db.select(_db.semanticElements)
        ..where((t) => t.cardId.isIn(allCardIds) & t.elementType.equals(elementType))
        ..orderBy([(t) => drift.OrderingTerm(expression: t.confidence, mode: drift.OrderingMode.desc)])
        ..limit(1);
      final res = await query.get();
      return res.isNotEmpty ? res.first : null;
    }

    // 1. Concept Overview
    blocks.add(StudyTitleBlock(id: 't1', title: topConcept.name));
    final defEl = await getBestElement('Definition');
    if (defEl != null) {
      blocks.add(StudyParagraphBlock(id: 'def', text: defEl.contentSummary));
    }

    // 2. Why Does It Exist? (Purpose)
    final purposeEl = await getBestElement('Purpose');
    if (purposeEl != null) {
      blocks.add(StudySectionBlock(id: 's2', heading: 'Why Does It Exist?'));
      blocks.add(StudyParagraphBlock(id: 'p_pur', text: purposeEl.contentSummary));
    }

    // 3. When Should I Use It?
    final tipEl = await getBestElement('Tip');
    if (tipEl != null) {
      blocks.add(StudySectionBlock(id: 's3', heading: 'When Should I Use It?'));
      blocks.add(CalloutBlock(id: 'p_tip', text: tipEl.contentSummary, calloutType: 'tip'));
    }

    // 4. When Should I Avoid It?
    final avoidEl = await getBestElement('Tradeoff');
    if (avoidEl != null) {
      blocks.add(StudySectionBlock(id: 's4', heading: 'When Should I Avoid It?'));
      blocks.add(CalloutBlock(id: 'p_trd', text: avoidEl.contentSummary, calloutType: 'warning'));
    }

    // 5. Complexity
    final compEl = await getBestElement('Complexity Analysis');
    if (compEl != null) {
      blocks.add(StudySectionBlock(id: 's5', heading: 'Complexity'));
      blocks.add(StudyParagraphBlock(id: 'p_comp', text: compEl.contentSummary));
      blocks.add(StudyParagraphBlock(id: 'attr_comp', text: 'Source: ${compEl.cardId}'));
    }

    // 6. Code Examples
    final codeEl = await getBestElement('Code Example');
    if (codeEl != null) {
      blocks.add(StudySectionBlock(id: 's6', heading: 'Code Example'));
      blocks.add(CodeBlock(id: 'c_code', code: codeEl.contentSummary, language: topConcept.language ?? 'cpp'));
      blocks.add(StudyParagraphBlock(id: 'attr_code', text: 'Source: ${codeEl.cardId}'));
    }

    // 7. Common Mistakes
    final warnEl = await getBestElement('Warning');
    if (warnEl != null) {
      blocks.add(StudySectionBlock(id: 's7', heading: 'Common Mistakes'));
      blocks.add(CalloutBlock(id: 'p_warn', text: warnEl.contentSummary, calloutType: 'warning'));
    }

    // 8. Pattern Recognition
    final patEl = await getBestElement('Pattern Recognition');
    if (patEl != null) {
      blocks.add(StudySectionBlock(id: 's8', heading: 'Pattern Recognition'));
      blocks.add(StudyParagraphBlock(id: 'p_pat', text: patEl.contentSummary));
    }

    // 9. Problem Roadmap
    blocks.add(StudySectionBlock(id: 's9', heading: 'Problem Roadmap'));
    final linkedProblems = await (_db.select(_db.problemConceptLinks).join([
      drift.innerJoin(_db.problems, _db.problems.id.equalsExp(_db.problemConceptLinks.problemId))
    ])..where(_db.problemConceptLinks.conceptName.equals(topConcept.name))).get();

    if (linkedProblems.isNotEmpty) {
      for (var row in linkedProblems) {
        final problem = row.readTable(_db.problems);
        blocks.add(StudyParagraphBlock(id: 'prob_${problem.id}', text: '• [${problem.difficulty}] ${problem.title} (${problem.platform})'));
      }
    } else {
      blocks.add(CalloutBlock(id: 'm_prob', text: 'No Problems Available for this Concept', calloutType: 'warning'));
    }

    // 10. Smart Recommendations
    blocks.add(StudySectionBlock(id: 's10', heading: 'Smart Recommendations'));
    final learningStatus = await (_db.select(_db.learningProgress)..where((t) => t.cardId.equals(topConcept.cardId))).getSingleOrNull();
    
    // Check if user is on an active roadmap
    final activeRoadmap = await (_db.select(_db.userRoadmapProgress)..orderBy([(t) => drift.OrderingTerm(expression: t.lastAccessedAt, mode: drift.OrderingMode.desc)])).getSingleOrNull();
    
    if (activeRoadmap != null && learningStatus?.status == 'mastered') {
       final modules = await (_db.select(_db.roadmapModules)..where((t) => t.roadmapId.equals(activeRoadmap.roadmapId))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex)])).get();
       bool foundCurrent = false;
       String? nextConcept;
       for (var mod in modules) {
         final nodes = await (_db.select(_db.roadmapNodes)..where((t) => t.moduleId.equals(mod.id))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex)])).get();
         for (var node in nodes) {
           if (foundCurrent) {
             nextConcept = node.conceptName;
             break;
           }
           if (node.conceptName == topConcept.name) foundCurrent = true;
         }
         if (nextConcept != null) break;
       }
       if (nextConcept != null) {
          blocks.add(CalloutBlock(id: 'rec_road', text: 'Roadmap Milestone Complete! Next up: $nextConcept', calloutType: 'tip'));
          actions.add(KnowledgeNavigationAction(
            label: 'Start $nextConcept', 
            type: KnowledgeNavigationType.viewRelatedConcept, 
            targetId: nextConcept
          ));
       }
    } else if (learningStatus?.status == 'mastered' && linkedProblems.isNotEmpty) {
       blocks.add(CalloutBlock(id: 'rec_prob', text: 'You have mastered the concept! Next step: Practice the associated problems above.', calloutType: 'tip'));
    } else if (learningStatus?.status == 'not_started') {
       blocks.add(CalloutBlock(id: 'rec_learn', text: 'Start by reading through the Definition and Why it Exists.', calloutType: 'tip'));
    } else {
       blocks.add(CalloutBlock(id: 'rec_gen', text: 'Continue learning to unlock more problem recommendations.', calloutType: 'tip'));
    }

    // Navigation Actions
    actions.add(KnowledgeNavigationAction(
      label: 'View Primary Source', 
      type: KnowledgeNavigationType.viewStudyPage, 
      targetId: topConcept.cardId
    ));

    final relations = await (_db.select(_db.conceptRelationships)..where((t) => t.cardId.isIn(allCardIds))).get();
    final uniqueRels = relations.map((r) => r.targetConceptName).toSet().toList();
    for (var target in uniqueRels.take(3)) {
      actions.add(KnowledgeNavigationAction(
        label: 'Explore $target', 
        type: KnowledgeNavigationType.viewRelatedConcept, 
        targetId: target
      ));
    }

    return KnowledgeQueryResponse(
      query: input,
      intentDetected: intent.name,
      primaryConcept: topConcept.name,
      genericBlocks: blocks,
      navigationActions: actions,
    );
  }
}
