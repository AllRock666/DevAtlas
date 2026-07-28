import 'package:drift/drift.dart';
import 'tables.dart';

import 'connection_interface.dart'
    if (dart.library.ffi) 'connection_native.dart'
    if (dart.library.html) 'connection_web.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  RawDocuments,
  NormalizedDocuments,
  KnowledgeCards,
  GraphLinks,
  ProblemPatterns,
  LearningProgress,
  ExtractedConcepts,
  ConceptRelationships,
  SemanticElements,
  Problems,
  ProblemConceptLinks,
  ProblemProgress,
  Roadmaps,
  RoadmapModules,
  RoadmapNodes,
  UserRoadmapProgress,
  GlobalWorkspace,
  ConceptNotes,
  BlockAnnotations,
  Collections,
  CollectionItems,
  ImportQueueItems,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        try {
          await customStatement('''
            CREATE VIRTUAL TABLE IF NOT EXISTS knowledge_cards_search USING fts5(
              title, explanation, tags, cardId UNINDEXED
            );
          ''');
        } catch (_) {}
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(importQueueItems);
        }
        if (from < 3) {
          await m.addColumn(roadmaps, roadmaps.roadmapType);
          await m.addColumn(roadmapModules, roadmapModules.moduleType);
          await m.addColumn(roadmapNodes, roadmapNodes.linkedCardId);
        }
      },
    );
  }
}
