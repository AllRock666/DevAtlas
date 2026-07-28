import '../../study_page_builder/rendered_document.dart';

enum KnowledgeNavigationType {
  viewStudyPage,
  viewRelatedConcept,
  viewOriginalSource,
}

class KnowledgeNavigationAction {
  final String label;
  final KnowledgeNavigationType type;
  final String targetId; // cardId, concept name, or URL

  const KnowledgeNavigationAction({
    required this.label,
    required this.type,
    required this.targetId,
  });
}

class KnowledgeQueryResponse {
  final String query;
  final String intentDetected;
  final String primaryConcept;
  final List<StudyBlock> genericBlocks;
  final List<KnowledgeNavigationAction> navigationActions;
  
  const KnowledgeQueryResponse({
    required this.query,
    required this.intentDetected,
    this.primaryConcept = '',
    required this.genericBlocks,
    required this.navigationActions,
  });
}

class SearchFilters {
  final String? category;
  final String? language;
  const SearchFilters({this.category, this.language});
}
