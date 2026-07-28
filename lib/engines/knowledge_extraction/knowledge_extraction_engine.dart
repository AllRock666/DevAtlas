import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../study_page_builder/rendered_document.dart';
import 'models/knowledge_artifact.dart';

class KnowledgeExtractionEngine {
  KnowledgeArtifact extract(RenderedStudyDocument document) {
    final title = document.title.replaceAll(RegExp(r'^(Tutorial: |Chapter \d+: |Lesson: )'), '').trim();
    
    // Concept Detection
    final primaryConcept = title;
    String category = 'General';
    String language = 'Unknown';
    
    // Infer language from code blocks
    int cppCount = 0;
    for (var block in document.blocks) {
      if (block is CodeBlock && block.language == 'cpp') cppCount++;
    }
    if (cppCount > 0) {
      language = 'C++';
      category = 'Programming';
    }

    final elements = <SemanticElement>[];
    final relationships = <ConceptRelationship>[];

    // Simple dictionary for relationship heuristic
    final knownConcepts = ['Pointer', 'Memory', 'Stack', 'Queue', 'Array', 'Linked List', 'Variable', 'Function'];
    
    for (int i = 0; i < document.blocks.length; i++) {
      final block = document.blocks[i];

      // 1. Definition Heuristic
      if (block is StudyParagraphBlock) {
        final text = block.text;
        if (RegExp(r'^(A|An|The)\s+.*\s+is\s+(a|an)\s+').hasMatch(text) || 
            (i == 0)) { // Often first paragraph is a definition
          elements.add(SemanticElement(
            id: _genId('def', block.id),
            confidence: i == 0 ? 0.6 : 0.8,
            provenance: Provenance(sourceBlockId: block.id, parserVersion: '1.2.0', extractionRule: 'regex_definition_v1'),
            elementType: 'Definition',
            contentSummary: text.length > 100 ? '${text.substring(0, 97)}...' : text,
          ));
        }

        // Relationship heuristic: check if known concepts are mentioned in paragraph
        for (final concept in knownConcepts) {
          if (concept.toLowerCase() != primaryConcept.toLowerCase() && 
              text.toLowerCase().contains(concept.toLowerCase())) {
            
            // Avoid duplicates
            if (!relationships.any((r) => r.targetConceptName == concept)) {
              relationships.add(ConceptRelationship(
                id: _genId('rel', '$primaryConcept-$concept'),
                confidence: 0.7,
                provenance: Provenance(sourceBlockId: block.id, parserVersion: '1.2.0', extractionRule: 'keyword_match_v1'),
                targetConceptName: concept,
                relationshipType: 'related_to',
              ));
            }
          }
        }
      }

      // 2. Code Example Metadata
      if (block is CodeBlock) {
        final lineCount = block.code.split('\\n').length;
        elements.add(SemanticElement(
          id: _genId('code', block.id),
          confidence: 0.95,
          provenance: Provenance(sourceBlockId: block.id, parserVersion: '1.2.0', extractionRule: 'code_block_v1'),
          elementType: 'Code Example',
          contentSummary: '${block.language} snippet (${lineCount} lines)',
        ));
      }

      // 3. Complexity Heuristic
      if (block is StudySectionBlock && 
         (block.heading.toLowerCase().contains('complexity') || block.heading.toLowerCase().contains('performance'))) {
        
        // Peek at next block
        if (i + 1 < document.blocks.length && document.blocks[i+1] is TableBlock) {
          final table = document.blocks[i+1] as TableBlock;
          elements.add(SemanticElement(
            id: _genId('complexity', table.id),
            confidence: 0.9,
            provenance: Provenance(sourceBlockId: table.id, parserVersion: '1.2.0', extractionRule: 'complexity_table_v1'),
            elementType: 'Complexity Analysis',
            contentSummary: 'Complexity table with ${table.rows.length} rows',
          ));
        }
      }

      // 4. Callout/Warning Heuristic
      if (block is CalloutBlock) {
        elements.add(SemanticElement(
          id: _genId('callout', block.id),
          confidence: 0.98,
          provenance: Provenance(sourceBlockId: block.id, parserVersion: '1.2.0', extractionRule: 'callout_v1'),
          elementType: block.calloutType == 'warning' ? 'Warning' : (block.calloutType == 'tip' ? 'Tip' : 'Note'),
          contentSummary: block.text.length > 100 ? '${block.text.substring(0, 97)}...' : block.text,
        ));
      }
    }

    return KnowledgeArtifact(
      cardId: document.cardId,
      primaryConcept: primaryConcept,
      category: category,
      language: language,
      elements: elements,
      relationships: relationships,
    );
  }

  String _genId(String prefix, String raw) {
    return '$prefix-${md5.convert(utf8.encode(raw)).toString()}';
  }
}
