import 'package:drift/drift.dart';

class RawDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceUri => text()(); // The URL or file path
  TextColumn get rawContent => text()(); // The unprocessed HTML, Markdown, etc.
  DateTimeColumn get fetchedAt => dateTime().withDefault(currentDateAndTime)();
}

class NormalizedDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rawDocumentId => integer().references(RawDocuments, #id)();
  TextColumn get title => text()();
  TextColumn get content => text()(); // Cleaned markdown content
  DateTimeColumn get normalizedAt => dateTime().withDefault(currentDateAndTime)();
}

class KnowledgeCards extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  
  // Generic parser & metadata fields
  TextColumn get sourceUrl => text().nullable()();
  TextColumn get sourceName => text().nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get publishedDate => text().nullable()();
  TextColumn get retrievedAt => text().nullable()();
  TextColumn get parserVersion => text().nullable()();
  TextColumn get originalHtml => text().nullable()();
  TextColumn get blocksJson => text().nullable()();

  // New pipeline metadata fields
  TextColumn get knowledgeArtifactJson => text().nullable()();
  TextColumn get importStatus => text().withDefault(const Constant('completed'))();
  IntColumn get schemaVersion => integer().withDefault(const Constant(1))();
  IntColumn get contentVersion => integer().withDefault(const Constant(1))();
  TextColumn get parsingReport => text().nullable()();

  // MVP legacy fields (kept for mock compatibility)
  TextColumn get explanation => text()();
  TextColumn get tags => text()(); // comma separated
  TextColumn get difficulty => text()();
  TextColumn get timeComplexity => text().nullable()();
  TextColumn get spaceComplexity => text().nullable()();
  TextColumn get sources => text().nullable()(); // serialized JSON array
  TextColumn get revisionNotes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class GraphLinks extends Table {
  @ReferenceName('outgoingLinks')
  TextColumn get sourceCardId => text().references(KnowledgeCards, #id)();
  
  @ReferenceName('incomingLinks')
  TextColumn get targetCardId => text().references(KnowledgeCards, #id)();
  
  TextColumn get relationshipType => text()(); // e.g., 'prerequisite', 'related', 'pattern'

  @override
  Set<Column> get primaryKey => {sourceCardId, targetCardId, relationshipType};
}

class ProblemPatterns extends Table {
  TextColumn get id => text()();
  TextColumn get cardId => text().references(KnowledgeCards, #id)();
  TextColumn get name => text()();
  TextColumn get explanation => text()();
  TextColumn get recognitionTips => text().nullable()();
  TextColumn get commonMistakes => text().nullable()();
  TextColumn get problemsJson => text()(); // JSON list of problems (LeetCode links, etc.)
  TextColumn get difficulty => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LearningProgress extends Table {
  TextColumn get cardId => text().references(KnowledgeCards, #id)();
  TextColumn get status => text().withDefault(const Constant('not_started'))(); // not_started, reading, understood, practiced, mastered
  IntColumn get confidenceLevel => integer().withDefault(const Constant(0))(); // 0 to 10
  DateTimeColumn get lastRevisedAt => dateTime().nullable()();
  DateTimeColumn get nextRevisionAt => dateTime().nullable()();
  DateTimeColumn get lastOpenedAt => dateTime().nullable()();
  RealColumn get readingPosition => real().withDefault(const Constant(0.0))();

  @override
  Set<Column> get primaryKey => {cardId};
}

class Problems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get platform => text().nullable()(); // e.g., LeetCode, HackerRank
  TextColumn get difficulty => text().nullable()(); // Easy, Medium, Hard
  TextColumn get sourceUrl => text().nullable()();
  IntColumn get estimatedTimeMinutes => integer().nullable()();
  RealColumn get frequency => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProblemConceptLinks extends Table {
  TextColumn get problemId => text().references(Problems, #id)();
  TextColumn get conceptName => text()(); // Links to ExtractedConcepts.name conceptually

  @override
  Set<Column> get primaryKey => {problemId, conceptName};
}

class ProblemProgress extends Table {
  TextColumn get problemId => text().references(Problems, #id)();
  TextColumn get status => text().withDefault(const Constant('not_attempted'))(); // not_attempted, attempted, solved_with_hint, solved, reviewed, mastered
  IntColumn get confidenceLevel => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAttemptedAt => dateTime().nullable()();
  DateTimeColumn get nextRevisionAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {problemId};
}

class Roadmaps extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get roadmapType => text().withDefault(const Constant('curated'))(); // curated, dynamic, imported

  @override
  Set<Column> get primaryKey => {id};
}

class RoadmapModules extends Table {
  TextColumn get id => text()();
  TextColumn get roadmapId => text().references(Roadmaps, #id)();
  TextColumn get title => text()();
  IntColumn get orderIndex => integer()();
  TextColumn get moduleType => text().withDefault(const Constant('core'))(); // core, additional_reading, imported, chapter, custom

  @override
  Set<Column> get primaryKey => {id};
}

class RoadmapNodes extends Table {
  TextColumn get id => text()();
  TextColumn get moduleId => text().references(RoadmapModules, #id)();
  TextColumn get conceptName => text()(); // Links back to ExtractedConcepts logically
  TextColumn get linkedCardId => text().nullable().references(KnowledgeCards, #id)(); // explicitly links to an imported document
  IntColumn get orderIndex => integer()();
  BoolColumn get isCheckpoint => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class UserRoadmapProgress extends Table {
  TextColumn get roadmapId => text().references(Roadmaps, #id)();
  TextColumn get activeNodeId => text().nullable()(); // The node they are currently on
  DateTimeColumn get lastAccessedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {roadmapId};
}

class ExtractedConcepts extends Table {
  TextColumn get id => text()();
  TextColumn get cardId => text().references(KnowledgeCards, #id)();
  TextColumn get name => text()(); // Primary concept name
  TextColumn get conceptType => text().withDefault(const Constant('concept'))(); // e.g. data_structure, algorithm, pattern, language_feature
  TextColumn get category => text().nullable()();
  TextColumn get language => text().nullable()();
  RealColumn get confidence => real()();

  @override
  Set<Column> get primaryKey => {id};
}

class ConceptRelationships extends Table {
  TextColumn get id => text()();
  TextColumn get cardId => text().references(KnowledgeCards, #id)();
  TextColumn get targetConceptName => text()();
  TextColumn get relationshipType => text()();
  RealColumn get confidence => real()();
  TextColumn get ruleUsed => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class SemanticElements extends Table {
  TextColumn get id => text()();
  TextColumn get cardId => text().references(KnowledgeCards, #id)();
  TextColumn get blockId => text()();
  TextColumn get elementType => text()();
  TextColumn get contentSummary => text()();
  RealColumn get confidence => real()();
  TextColumn get ruleUsed => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class GlobalWorkspace extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get content => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class ConceptNotes extends Table {
  TextColumn get conceptName => text()();
  TextColumn get content => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {conceptName};
}

class BlockAnnotations extends Table {
  TextColumn get blockId => text()();
  TextColumn get noteText => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {blockId};
}

class Collections extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class CollectionItems extends Table {
  TextColumn get collectionId => text().references(Collections, #id)();
  TextColumn get conceptName => text()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {collectionId, conceptName};
}

class ImportQueueItems extends Table {
  TextColumn get id => text()();
  TextColumn get url => text()();
  TextColumn get batchName => text().nullable()();
  TextColumn get importMode => text().withDefault(const Constant('page'))(); // page, section, site
  IntColumn get depth => integer().withDefault(const Constant(0))();
  TextColumn get parentId => text().nullable()();
  TextColumn get crawlSessionId => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('queued'))();
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  TextColumn get error => text().nullable()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
