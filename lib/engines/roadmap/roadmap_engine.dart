import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:drift/drift.dart' as drift;
import '../storage/database.dart';

class RoadmapNodeState {
  final RoadmapNode node;
  final String status; // 'locked', 'available', 'in_progress', 'understood', 'practiced', 'mastered'
  
  RoadmapNodeState(this.node, this.status);
}

class RoadmapModuleState {
  final RoadmapModule module;
  final List<RoadmapNodeState> nodes;
  
  RoadmapModuleState(this.module, this.nodes);
}

class RoadmapEngine {
  final AppDatabase _db;
  
  RoadmapEngine(this._db);
  
  Future<void> seedRoadmaps() async {
    try {
      final existing = await (_db.select(_db.roadmaps)..where((t) => t.id.equals('roadmap_cpp'))).getSingleOrNull();
      if (existing != null) return; // Already seeded

      final jsonString = await rootBundle.loadString('assets/data/curated_roadmaps.json');
      final List<dynamic> parsed = jsonDecode(jsonString);

      for (var rMap in parsed) {
        await _db.into(_db.roadmaps).insertOnConflictUpdate(RoadmapsCompanion.insert(
          id: rMap['id'],
          title: rMap['title'],
          description: drift.Value(rMap['description']),
          category: drift.Value(rMap['category']),
          roadmapType: drift.Value(rMap['roadmapType']),
        ));

        final modules = rMap['modules'] as List<dynamic>;
        for (var mod in modules) {
          await _db.into(_db.roadmapModules).insertOnConflictUpdate(RoadmapModulesCompanion.insert(
            id: mod['id'],
            roadmapId: rMap['id'],
            title: mod['title'],
            orderIndex: mod['orderIndex'],
            moduleType: drift.Value(mod['moduleType']),
          ));

          final nodes = mod['nodes'] as List<dynamic>;
          for (var node in nodes) {
            await _db.into(_db.roadmapNodes).insertOnConflictUpdate(RoadmapNodesCompanion.insert(
              id: node['id'],
              moduleId: mod['id'],
              conceptName: node['conceptName'],
              orderIndex: node['orderIndex'],
            ));
          }
        }
      }
    } catch (e) {
      print('Failed to seed roadmaps: $e');
    }
  }
  
  Future<List<Roadmap>> getAllRoadmaps() {
    return _db.select(_db.roadmaps).get();
  }
  
  Future<List<RoadmapModuleState>> getRoadmapState(String roadmapId) async {
    final modules = await (_db.select(_db.roadmapModules)..where((t) => t.roadmapId.equals(roadmapId))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex)])).get();
    
    final results = <RoadmapModuleState>[];
    
    for (var mod in modules) {
      final nodes = await (_db.select(_db.roadmapNodes)..where((t) => t.moduleId.equals(mod.id))..orderBy([(t) => drift.OrderingTerm(expression: t.orderIndex)])).get();
      
      final nodeStates = <RoadmapNodeState>[];
      for (var node in nodes) {
        String status = 'available';
        if (node.linkedCardId != null) {
          final prog = await (_db.select(_db.learningProgress)..where((t) => t.cardId.equals(node.linkedCardId!))).getSingleOrNull();
          if (prog != null) {
            status = prog.status;
            if (status == 'not_started') status = 'available';
            if (status == 'reading') status = 'in_progress';
          }
        }
        
        nodeStates.add(RoadmapNodeState(node, status));
      }
      results.add(RoadmapModuleState(mod, nodeStates));
    }
    
    return results;
  }
  
  Future<void> startRoadmap(String roadmapId) async {
    await _db.into(_db.userRoadmapProgress).insertOnConflictUpdate(
      UserRoadmapProgressCompanion.insert(
        roadmapId: roadmapId,
        lastAccessedAt: drift.Value(DateTime.now()),
      )
    );
  }
  
  Future<void> deleteRoadmap(String roadmapId) async {
    // Delete nodes belonging to modules of this roadmap
    final modules = await (_db.select(_db.roadmapModules)..where((t) => t.roadmapId.equals(roadmapId))).get();
    for (var mod in modules) {
      await (_db.delete(_db.roadmapNodes)..where((t) => t.moduleId.equals(mod.id))).go();
    }
    // Delete modules
    await (_db.delete(_db.roadmapModules)..where((t) => t.roadmapId.equals(roadmapId))).go();
    // Delete progress
    await (_db.delete(_db.userRoadmapProgress)..where((t) => t.roadmapId.equals(roadmapId))).go();
    // Delete roadmap
    await (_db.delete(_db.roadmaps)..where((t) => t.id.equals(roadmapId))).go();
  }

  Future<void> updateRoadmapTitle(String roadmapId, String newTitle) async {
    final roadmap = await (_db.select(_db.roadmaps)..where((t) => t.id.equals(roadmapId))).getSingleOrNull();
    if (roadmap != null) {
      await _db.update(_db.roadmaps).replace(
        roadmap.copyWith(title: newTitle)
      );
    }
  }

  Future<String?> resolveLocalNodeLink(String nodeId, String conceptName) async {
    final cleanConcept = conceptName.trim();
    if (cleanConcept.isEmpty) return null;

    // Check extracted concepts for a match
    final concepts = await (_db.select(_db.extractedConcepts)
      ..where((t) => t.name.equals(cleanConcept) | t.name.lower().equals(cleanConcept.toLowerCase()))
      ..limit(1)
    ).get();

    if (concepts.isNotEmpty) {
      final cardId = concepts.first.cardId;
      await (_db.update(_db.roadmapNodes)..where((t) => t.id.equals(nodeId)))
          .write(RoadmapNodesCompanion(linkedCardId: drift.Value(cardId)));
      return cardId;
    }

    // Check knowledge cards directly by title
    final cards = await (_db.select(_db.knowledgeCards)
      ..where((t) => t.title.equals(cleanConcept) | t.title.lower().equals(cleanConcept.toLowerCase()))
      ..limit(1)
    ).get();

    if (cards.isNotEmpty) {
      final cardId = cards.first.id;
      await (_db.update(_db.roadmapNodes)..where((t) => t.id.equals(nodeId)))
          .write(RoadmapNodesCompanion(linkedCardId: drift.Value(cardId)));
      return cardId;
    }

    return null;
  }
}
