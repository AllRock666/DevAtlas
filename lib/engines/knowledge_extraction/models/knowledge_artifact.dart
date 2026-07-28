class Provenance {
  final String sourceBlockId;
  final String parserVersion;
  final String extractionRule;

  const Provenance({
    required this.sourceBlockId,
    required this.parserVersion,
    required this.extractionRule,
  });

  Map<String, dynamic> toJson() => {
    'sourceBlockId': sourceBlockId,
    'parserVersion': parserVersion,
    'extractionRule': extractionRule,
  };

  factory Provenance.fromJson(Map<String, dynamic> json) => Provenance(
    sourceBlockId: json['sourceBlockId'] ?? '',
    parserVersion: json['parserVersion'] ?? '',
    extractionRule: json['extractionRule'] ?? '',
  );
}

class ExtractedEntity {
  final String id;
  final double confidence;
  final Provenance provenance;

  const ExtractedEntity({
    required this.id,
    required this.confidence,
    required this.provenance,
  });
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'confidence': confidence,
    'provenance': provenance.toJson(),
  };
}

class SemanticElement extends ExtractedEntity {
  final String elementType; 
  final String contentSummary;

  const SemanticElement({
    required super.id,
    required super.confidence,
    required super.provenance,
    required this.elementType,
    required this.contentSummary,
  });

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({
    'elementType': elementType,
    'contentSummary': contentSummary,
  });

  factory SemanticElement.fromJson(Map<String, dynamic> json) => SemanticElement(
    id: json['id'] ?? '',
    confidence: (json['confidence'] ?? 0.0) as double,
    provenance: Provenance.fromJson(json['provenance'] ?? {}),
    elementType: json['elementType'] ?? '',
    contentSummary: json['contentSummary'] ?? '',
  );
}

class ConceptRelationship extends ExtractedEntity {
  final String targetConceptName;
  final String relationshipType;

  const ConceptRelationship({
    required super.id,
    required super.confidence,
    required super.provenance,
    required this.targetConceptName,
    required this.relationshipType,
  });

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({
    'targetConceptName': targetConceptName,
    'relationshipType': relationshipType,
  });

  factory ConceptRelationship.fromJson(Map<String, dynamic> json) => ConceptRelationship(
    id: json['id'] ?? '',
    confidence: (json['confidence'] ?? 0.0) as double,
    provenance: Provenance.fromJson(json['provenance'] ?? {}),
    targetConceptName: json['targetConceptName'] ?? '',
    relationshipType: json['relationshipType'] ?? '',
  );
}

class KnowledgeArtifact {
  final String cardId;
  final String primaryConcept;
  final String category;
  final String language;
  final List<SemanticElement> elements;
  final List<ConceptRelationship> relationships;

  const KnowledgeArtifact({
    required this.cardId,
    required this.primaryConcept,
    required this.category,
    required this.language,
    required this.elements,
    required this.relationships,
  });

  Map<String, dynamic> toJson() => {
    'cardId': cardId,
    'primaryConcept': primaryConcept,
    'category': category,
    'language': language,
    'elements': elements.map((e) => e.toJson()).toList(),
    'relationships': relationships.map((r) => r.toJson()).toList(),
  };

  factory KnowledgeArtifact.fromJson(Map<String, dynamic> json) => KnowledgeArtifact(
    cardId: json['cardId'] ?? '',
    primaryConcept: json['primaryConcept'] ?? '',
    category: json['category'] ?? '',
    language: json['language'] ?? '',
    elements: (json['elements'] as List<dynamic>?)
        ?.map((e) => SemanticElement.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
    relationships: (json['relationships'] as List<dynamic>?)
        ?.map((e) => ConceptRelationship.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
  );
}
