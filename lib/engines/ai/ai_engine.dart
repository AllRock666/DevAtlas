abstract class AIRepository {
  /// Send a specific query with the given context.
  Future<String> askQuestion(String prompt, String context);
  
  /// Generates flashcards based on the provided context.
  Future<String> generateFlashcards(String context);
  
  /// Simplifies a complex concept using the context.
  Future<String> simplifyConcept(String context);
}

abstract class AIContextBuilder {
  /// Gathers surrounding context (Knowledge Cards, notes, problems, relationships) 
  /// for a specific concept to send to the AIRepository. This ensures the AI gets highly 
  /// targeted prompts without overflowing the context window.
  Future<String> buildContextForCard(String cardId);
}
