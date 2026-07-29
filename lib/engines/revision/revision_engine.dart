import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import '../storage/database.dart';

import '../knowledge_extraction/models/knowledge_artifact.dart';
import '../../di/injection.dart' as di;

enum ActivityType {
  quickRevision,
  activeRecall,
  codeRecall,
  problemRecall,
  relationshipRecall
}

class RevisionActivity {
  final ActivityType type;
  final String conceptName;
  final String? question;
  final String? answer;
  final Map<String, dynamic>? metadata;
  
  RevisionActivity({
    required this.type,
    required this.conceptName,
    this.question,
    this.answer,
    this.metadata,
  });
}

class DailyRevisionQueue {
  final List<RevisionActivity> activities;
  final List<String> conceptsToReview;
  final List<String> problemsToRevisit;
  
  DailyRevisionQueue(this.activities, this.conceptsToReview, this.problemsToRevisit);
}

class RevisionEngine {
  final AppDatabase _db;
  
  RevisionEngine(this._db);

  Future<DailyRevisionQueue> generateDailyQueue() async {
    final now = DateTime.now();
    
    // 1. Fetch due concepts
    final dueConcepts = await (_db.select(_db.learningProgress)..where((t) => t.nextRevisionAt.isSmallerOrEqualValue(now) | t.status.equals('understood'))).get();
    
    // 2. Fetch due problems
    final dueProblems = await (_db.select(_db.problemProgress)..where((t) => t.nextRevisionAt.isSmallerOrEqualValue(now) | t.status.equals('solved_with_hint'))).get();
    
    List<RevisionActivity> activities = [];
    List<String> conceptNames = [];
    List<String> problemIds = [];
    
    // Generate Concept Activities
    for (var prog in dueConcepts) {
      final card = await (_db.select(_db.knowledgeCards)..where((t) => t.id.equals(prog.cardId))).getSingleOrNull();
      if (card != null && card.knowledgeArtifactJson != null) {
        final artifactMap = jsonDecode(card.knowledgeArtifactJson!);
        final artifact = KnowledgeArtifact.fromJson(artifactMap);
        
        conceptNames.add(artifact.primaryConcept);
        
        // Add Quick Revision
        activities.add(RevisionActivity(
          type: ActivityType.quickRevision,
          conceptName: artifact.primaryConcept,
          metadata: { 'summary': artifact.elements.where((e) => e.elementType == 'summary' || e.elementType == 'definition').map((e) => e.contentSummary).join('\n') },
        ));
        
        // Add Active Recall for Time Complexity
        if (artifact.elements.any((e) => e.elementType == 'complexity')) {
           final cx = artifact.elements.firstWhere((e) => e.elementType == 'complexity').contentSummary;
           activities.add(RevisionActivity(
             type: ActivityType.activeRecall,
             conceptName: artifact.primaryConcept,
             question: 'What is the time/space complexity of ${artifact.primaryConcept}?',
             answer: cx,
           ));
        }
        
        // Add Code Recall (Cloze deletion)
        final codeBlocks = artifact.elements.where((e) => e.elementType == 'code_example');
        if (codeBlocks.isNotEmpty) {
           final code = codeBlocks.first.contentSummary; // The raw code
           // Blank out loops and basic keywords
           final cloze = code.replaceAll(RegExp(r'\b(for|while|if|else|return|new)\b'), '___');
           activities.add(RevisionActivity(
             type: ActivityType.codeRecall,
             conceptName: artifact.primaryConcept,
             question: cloze,
             answer: code,
           ));
        }
      }
    }
    
    // Relationship Recall
    for (var concept in conceptNames) {
       final rels = await (_db.select(_db.conceptRelationships)..where((t) => t.targetConceptName.equals(concept))).get();
       if (rels.isNotEmpty) {
          final sourceCard = await (_db.select(_db.extractedConcepts)..where((t) => t.cardId.equals(rels.first.cardId))).getSingleOrNull();
          if (sourceCard != null) {
            activities.add(RevisionActivity(
              type: ActivityType.relationshipRecall,
              conceptName: concept,
              question: 'What concept is related to $concept?',
              answer: sourceCard.name, 
            ));
          }
       }
    }
    
    for (var prob in dueProblems) {
       problemIds.add(prob.problemId);
    }
    
    // Shuffle activities to interleave them
    activities.shuffle();
    
    return DailyRevisionQueue(activities, conceptNames, problemIds);
  }
  
  // SM-2 inspired scheduling
  Future<void> logActivityResult(String conceptName, int quality) async {
    // quality: 0-5 (0=blackout, 5=perfect)
    // Find concept card id
    final conceptRow = await (_db.select(_db.extractedConcepts)..where((t) => t.name.equals(conceptName))).getSingleOrNull();
    if (conceptRow == null) return;
    
    final prog = await (_db.select(_db.learningProgress)..where((t) => t.cardId.equals(conceptRow.cardId))).getSingleOrNull();
    
    int currentConfidence = prog?.confidenceLevel ?? 0;
    int newConfidence = currentConfidence;
    
    if (quality >= 4) { newConfidence += 1; }
    if (quality < 3) { newConfidence = 0; } // Reset
    
    if (newConfidence > 5) { newConfidence = 5; }
    
    // Calculate interval in days based on confidence
    int intervalDays = 1;
    if (newConfidence == 1) { intervalDays = 1; }
    else if (newConfidence == 2) { intervalDays = 3; }
    else if (newConfidence == 3) { intervalDays = 7; }
    else if (newConfidence == 4) { intervalDays = 14; }
    else if (newConfidence == 5) { intervalDays = 30; }
    
    await _db.into(_db.learningProgress).insertOnConflictUpdate(
      LearningProgressCompanion.insert(
        cardId: conceptRow.cardId,
        status: drift.Value(newConfidence >= 4 ? 'mastered' : 'practiced'),
        confidenceLevel: drift.Value(newConfidence),
        lastRevisedAt: drift.Value(DateTime.now()),
        nextRevisionAt: drift.Value(DateTime.now().add(Duration(days: intervalDays))),
      )
    );
  }
}
