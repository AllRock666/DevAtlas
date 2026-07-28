import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart' as drift;
import '../storage/database.dart';
import '../pipeline/parser_registry.dart';
import '../pipeline/generic_block_parser.dart';

import '../knowledge_extraction/knowledge_extraction_engine.dart';

enum IngestionProgressState { fetching, extracting, parsing, extractingKnowledge, saving, completed, failed }

class IngestionProgress {
  final IngestionProgressState state;
  final String message;
  final String? cardId;
  IngestionProgress(this.state, this.message, {this.cardId});
}

class ContentSourceEngine {
  final AppDatabase _db;
  final ParserRegistry _registry;
  final KnowledgeExtractionEngine _knowledgeEngine = KnowledgeExtractionEngine();

  ContentSourceEngine(this._db, this._registry);

  Stream<IngestionProgress> ingestUrl(String url) async* {
    try {
      yield IngestionProgress(IngestionProgressState.fetching, 'Fetching HTML...');
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load article (HTTP ${response.statusCode})');
      }

      yield IngestionProgress(IngestionProgressState.extracting, 'Extracting content layer...');
      final adapter = _registry.getAdapterForUrl(url);
      
      yield IngestionProgress(IngestionProgressState.parsing, 'Parsing DOM and caching resources...');
      final report = ParsingReport(sourceUrl: url, parserVersion: '1.2.0', parseTime: DateTime.now());
      
      final renderedDoc = await adapter.extractDocument(response.body, url, report);
      
      yield IngestionProgress(IngestionProgressState.extractingKnowledge, 'Building Knowledge Graph...');
      final knowledgeArtifact = _knowledgeEngine.extract(renderedDoc);

      yield IngestionProgress(IngestionProgressState.saving, 'Saving blocks and metadata to offline library...');
      
      await _db.transaction(() async {
        final serializedBlocks = jsonEncode(renderedDoc.blocks.map((b) => b.toJson()).toList());
        final artifactJson = jsonEncode(knowledgeArtifact.toJson());

        await _db.into(_db.knowledgeCards).insertOnConflictUpdate(
          KnowledgeCardsCompanion.insert(
            id: renderedDoc.cardId,
            title: renderedDoc.title,
            sourceUrl: drift.Value(url),
            sourceName: drift.Value(adapter.sourceName),
            retrievedAt: drift.Value(DateTime.now().toIso8601String()),
            originalHtml: drift.Value(response.body),
            blocksJson: drift.Value(serializedBlocks),
            knowledgeArtifactJson: drift.Value(artifactJson),
            importStatus: const drift.Value('completed'),
            schemaVersion: const drift.Value(2),
            contentVersion: const drift.Value(1),
            parserVersion: drift.Value(report.parserVersion),
            parsingReport: drift.Value(jsonEncode(report.toJson())),
            explanation: knowledgeArtifact.primaryConcept,
            tags: knowledgeArtifact.category,
            difficulty: 'Unrated',
          )
        );

        // Populate relational indexes for fast searching
        await _db.into(_db.extractedConcepts).insertOnConflictUpdate(
          ExtractedConceptsCompanion.insert(
            id: '${renderedDoc.cardId}-primary',
            cardId: renderedDoc.cardId,
            name: knowledgeArtifact.primaryConcept,
            conceptType: const drift.Value('concept'),
            category: drift.Value(knowledgeArtifact.category),
            language: drift.Value(knowledgeArtifact.language),
            confidence: 0.9,
          )
        );

        for (var el in knowledgeArtifact.elements) {
          await _db.into(_db.semanticElements).insertOnConflictUpdate(
            SemanticElementsCompanion.insert(
              id: el.id,
              cardId: renderedDoc.cardId,
              blockId: el.provenance.sourceBlockId,
              elementType: el.elementType,
              contentSummary: el.contentSummary,
              confidence: el.confidence,
              ruleUsed: el.provenance.extractionRule,
            )
          );
        }

        for (var rel in knowledgeArtifact.relationships) {
          await _db.into(_db.conceptRelationships).insertOnConflictUpdate(
            ConceptRelationshipsCompanion.insert(
              id: rel.id,
              cardId: renderedDoc.cardId,
              targetConceptName: rel.targetConceptName,
              relationshipType: rel.relationshipType,
              confidence: rel.confidence,
              ruleUsed: rel.provenance.extractionRule,
            )
          );
        }
      });

      yield IngestionProgress(IngestionProgressState.completed, 'Ready to read!', cardId: renderedDoc.cardId);
    } catch (e) {
      yield IngestionProgress(IngestionProgressState.failed, 'Error: $e');
    }
  }

  Future<void> ingestFromUrl(String url) async {
    await for (final progress in ingestUrl(url)) {
      if (progress.state == IngestionProgressState.failed) {
        throw Exception(progress.message);
      }
    }
  }
}
