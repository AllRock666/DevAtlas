abstract class IndexEngine {
  Future<void> indexKnowledgeCard(String cardId, String title, String explanation, String tags);
  Future<void> rebuildIndexes();
}
