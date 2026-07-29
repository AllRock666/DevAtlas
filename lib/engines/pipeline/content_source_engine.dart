import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import '../storage/database.dart';
import 'parser_registry.dart';
import 'generic_block_parser.dart';
import '../knowledge_extraction/knowledge_extraction_engine.dart';
import '../study_page_builder/rendered_document.dart';
import '../knowledge_extraction/models/knowledge_artifact.dart';


class ContentSourceEngine {
  final AppDatabase _db;
  final ParserRegistry _parserRegistry;
  final KnowledgeExtractionEngine _extractionEngine;

  ContentSourceEngine(this._db, this._parserRegistry, this._extractionEngine);

  Future<RenderedStudyDocument> ingestFromUrl(String url) async {
    final adapter = _parserRegistry.getAdapterForUrl(url);
    
    final proxyUrl = Uri.parse('https://corsproxy.io/?url=${Uri.encodeComponent(url)}');
    final response = await http.get(proxyUrl).timeout(const Duration(seconds: 10));
    
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch content from $url');
    }
    
    final htmlContent = response.body;
    final report = ParsingReport(sourceUrl: url, parserVersion: adapter.sourceName, parseTime: DateTime.now());
    
    final document = await adapter.extractDocument(htmlContent, url, report);
    
    final artifact = _extractionEngine.extract(document);
    
    await _db.into(_db.knowledgeCards).insertOnConflictUpdate(
      KnowledgeCardsCompanion.insert(
        id: document.cardId,
        title: document.title,
        sourceUrl: drift.Value(url),
        sourceName: drift.Value(adapter.sourceName),
        retrievedAt: drift.Value(DateTime.now().toIso8601String()),
        blocksJson: drift.Value(jsonEncode(document.blocks.map((b) => (b as dynamic).toJson()).toList())),
        knowledgeArtifactJson: drift.Value(jsonEncode(artifact.toJson())),
        explanation: const drift.Value('Extracted from source'),
        tags: const drift.Value(''),
        difficulty: const drift.Value('Beginner'),
      )
    );
    
    await _db.into(_db.extractedConcepts).insertOnConflictUpdate(
      ExtractedConceptsCompanion.insert(
        id: '${artifact.cardId}_concept',
        name: artifact.primaryConcept,
        conceptType: drift.Value(artifact.category),
        cardId: artifact.cardId,
        confidence: 1.0,
      )
    );
    
    for (var rel in artifact.relationships) {
       await _db.into(_db.conceptRelationships).insertOnConflictUpdate(
         ConceptRelationshipsCompanion.insert(
           id: 'rel_${const Uuid().v4()}',
           cardId: artifact.cardId,
           targetConceptName: rel.targetConceptName,
           relationshipType: rel.relationshipType,
           confidence: rel.confidence,
           ruleUsed: 'extracted',
         )
       );
    }
    
    await _autoAssignToRoadmap(artifact, document, adapter.sourceName);
    
    return document;
  }
  
  Future<void> _autoAssignToRoadmap(KnowledgeArtifact artifact, RenderedStudyDocument document, String sourceName) async {
    // 1. Determine Target Curated Roadmap
    String? targetCuratedRoadmapId;
    final lang = artifact.language?.toLowerCase() ?? '';
    final cat = artifact.category.toLowerCase();
    
    if (lang == 'c++' || lang == 'cpp') {
      targetCuratedRoadmapId = 'roadmap_cpp';
    } else if (cat == 'framework' || lang == 'dart' || cat == 'flutter') {
      targetCuratedRoadmapId = 'roadmap_flutter';
    } else if (cat == 'artificial intelligence' || cat == 'ai') {
      targetCuratedRoadmapId = 'roadmap_ai';
    }

    if (targetCuratedRoadmapId != null) {
      // Find the best matching node in the curated roadmap
      final allNodes = await (_db.select(_db.roadmapNodes).join([
        drift.innerJoin(_db.roadmapModules, _db.roadmapModules.id.equalsExp(_db.roadmapNodes.moduleId))
      ])..where(_db.roadmapModules.roadmapId.equals(targetCuratedRoadmapId) & _db.roadmapNodes.linkedCardId.isNull())).get();

      RoadmapNode? bestMatch;
      double highestScore = 0.0;

      for (var row in allNodes) {
        final node = row.readTable(_db.roadmapNodes);

        double score = 0.0;
        final nodeName = node.conceptName.toLowerCase();
        final artName = artifact.primaryConcept.toLowerCase();
        
        // Exact match
        if (nodeName == artName) score += 1.0;
        
        // Contains match (Synonym/Alias heuristic)
        if (nodeName.contains(artName) || artName.contains(nodeName)) score += 0.5;

        // Knowledge Graph match
        for (var rel in artifact.relationships) {
          if (rel.targetConceptName.toLowerCase() == nodeName) {
            score += 0.6;
          }
        }

        if (score > highestScore && score >= 0.5) { // Threshold
          highestScore = score;
          bestMatch = node;
        }
      }

      if (bestMatch != null) {
        // Unlock curated node
        await _db.update(_db.roadmapNodes).replace(
          bestMatch.copyWith(linkedCardId: drift.Value(artifact.cardId))
        );
        return; // Successfully assigned to curated core
      } else {
        // Did not match core node, append to Additional Reading
        final addlModId = 'mod_addl_$targetCuratedRoadmapId';
        
        // Ensure module exists
        final mod = await (_db.select(_db.roadmapModules)..where((t) => t.id.equals(addlModId))).getSingleOrNull();
        if (mod == null) {
          await _db.into(_db.roadmapModules).insertOnConflictUpdate(
            RoadmapModulesCompanion.insert(
              id: addlModId,
              roadmapId: targetCuratedRoadmapId,
              title: 'Additional Reading',
              orderIndex: 9999,
              moduleType: const drift.Value('additional_reading'),
            )
          );
        }

        // Get max order index for this module
        final nodes = await (_db.select(_db.roadmapNodes)..where((t) => t.moduleId.equals(addlModId))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex, mode: drift.OrderingMode.desc)])).get();
        final nextIdx = nodes.isEmpty ? 1 : nodes.first.orderIndex + 1;

        await _db.into(_db.roadmapNodes).insertOnConflictUpdate(
          RoadmapNodesCompanion.insert(
            id: 'node_addl_${const Uuid().v4()}',
            moduleId: addlModId,
            conceptName: artifact.primaryConcept,
            linkedCardId: drift.Value(artifact.cardId),
            orderIndex: nextIdx,
          )
        );
        return;
      }
    }

    // 2. Dynamic Roadmap Assignment
    final safeCategory = artifact.category.toLowerCase().replaceAll(' ', '_').replaceAll(RegExp(r'[^a-z0-9_]'), '');
    final sourcePrefix = sourceName.toLowerCase().replaceAll(' ', '_').replaceAll(RegExp(r'[^a-z0-9_]'), '');
    final dynamicRoadmapId = 'dyn_$safeCategory';
    
    // Ensure Dynamic Roadmap exists
    final rmod = await (_db.select(_db.roadmaps)..where((t) => t.id.equals(dynamicRoadmapId))).getSingleOrNull();
    if (rmod == null) {
      await _db.into(_db.roadmaps).insertOnConflictUpdate(
        RoadmapsCompanion.insert(
          id: dynamicRoadmapId,
          title: artifact.category,
          category: const drift.Value('Dynamic Learning Path'),
          roadmapType: const drift.Value('dynamic'),
        )
      );
    }

    // Module based on Source Name (Preserve Hierarchy)
    final modId = 'mod_dyn_${sourcePrefix}_${safeCategory}';
    final mod = await (_db.select(_db.roadmapModules)..where((t) => t.id.equals(modId))).getSingleOrNull();
    if (mod == null) {
      await _db.into(_db.roadmapModules).insertOnConflictUpdate(
        RoadmapModulesCompanion.insert(
          id: modId,
          roadmapId: dynamicRoadmapId,
          title: sourceName,
          orderIndex: 1, // Need logic for proper dynamic order
          moduleType: const drift.Value('chapter'),
        )
      );
    }

    // Insert node
    final nodes = await (_db.select(_db.roadmapNodes)..where((t) => t.moduleId.equals(modId))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex, mode: drift.OrderingMode.desc)])).get();
    final nextIdx = nodes.isEmpty ? 1 : nodes.first.orderIndex + 1;

    await _db.into(_db.roadmapNodes).insertOnConflictUpdate(
      RoadmapNodesCompanion.insert(
        id: 'node_dyn_${const Uuid().v4()}',
        moduleId: modId,
        conceptName: artifact.primaryConcept,
        linkedCardId: drift.Value(artifact.cardId),
        orderIndex: nextIdx,
      )
    );
  }
}
