import '../../engines/storage/database.dart';

abstract class LearningEngine {
  /// Marks a card as currently being studied.
  Future<void> markCardAsStudying(String cardId);
  
  /// Marks a card as mastered.
  Future<void> markCardAsMastered(String cardId);
  
  /// Updates the user's confidence level (0-10). Used by spaced repetition.
  Future<void> updateConfidence(String cardId, int confidenceLevel);
  
  /// Retrieves learning progress for a specific card.
  /// Retrieves learning progress for a specific card.
  Future<LearningProgressData?> getProgress(String cardId);
  
  /// Retrieves all learning progress history.
  Future<List<LearningProgressData>> getAllProgress();
}
