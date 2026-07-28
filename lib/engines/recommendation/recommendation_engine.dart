import '../../engines/storage/database.dart';

abstract class RecommendationEngine {
  /// Recommends topics the user should study next based on their progress and prerequisites.
  Future<List<KnowledgeCard>> recommendNextTopics();
  
  /// Recommends topics where the user has a low confidence level.
  Future<List<KnowledgeCard>> recommendWeakTopics();
  
  /// Recommends topics due for spaced repetition revision.
  Future<List<KnowledgeCard>> recommendForRevision();
}
