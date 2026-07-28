import '../../engines/storage/database.dart';

abstract class ProblemEngine {
  /// Retrieves all problem patterns associated with a specific Knowledge Card.
  Future<List<ProblemPattern>> getPatternsForCard(String cardId);
  
  /// Saves a new pattern to the database.
  Future<void> savePattern(ProblemPattern pattern);
  
  /// Intentionally hides solutions by default. Reveals hints sequentially.
  Future<String> revealHint(String patternId, int hintIndex);
}
