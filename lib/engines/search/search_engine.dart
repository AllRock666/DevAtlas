abstract class SearchEngine {
  Future<List<String>> searchFts(String query);
  Future<List<String>> searchGraph(String rootCardId, int depth);
}
