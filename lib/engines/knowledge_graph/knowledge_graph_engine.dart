import '../../engines/storage/database.dart';

abstract class KnowledgeGraphEngine {
  /// Retrieves concepts that are generally related.
  Future<List<KnowledgeCard>> getRelatedConcepts(String cardId);
  
  /// Retrieves concepts that should be studied before this one.
  Future<List<KnowledgeCard>> getPrerequisites(String cardId);
  
  /// Retrieves concepts that rely on this one.
  Future<List<KnowledgeCard>> getDependents(String cardId);
  
  /// Links two cards together with a specific relationship (e.g. 'prerequisite', 'related').
  Future<void> linkCards(String sourceId, String targetId, String relationshipType);
}
