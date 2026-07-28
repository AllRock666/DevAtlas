abstract class ExtractorEngine {
  Future<String> extractRawDocument(String rawPayload);
}

abstract class CleanerEngine {
  Future<String> cleanDocument(String extractedDocument);
}

abstract class NormalizerEngine {
  Future<Map<String, dynamic>> normalize(String cleanedDocument);
}

abstract class KnowledgeBuilderEngine {
  // Receives normalized JSON and produces a KnowledgeCard entity ready for Indexing/Storage
  Future<dynamic> buildCard(Map<String, dynamic> normalizedData);
}
