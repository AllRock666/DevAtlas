import 'package:http/http.dart' as http;
import 'package:drift/drift.dart' as drift;
import '../storage/database.dart';
import '../pipeline/adapters/learncpp_adapter.dart';
import '../pipeline/generic_block_parser.dart';
import '../pipeline/resource_engine.dart';
class LearnCppSource {
  final AppDatabase _db;
  final LearnCppAdapter _adapter;

  LearnCppSource(this._db, ResourceEngine engine) : _adapter = LearnCppAdapter(GenericBlockParser(engine));

  Future<String> ingestUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final report = ParsingReport(sourceUrl: url, parserVersion: _adapter.sourceName, parseTime: DateTime.now());
      final renderedDoc = await _adapter.extractDocument(response.body, url, report);
      
      await _db.into(_db.knowledgeCards).insertOnConflictUpdate(
        KnowledgeCardsCompanion.insert(
          id: renderedDoc.cardId,
          title: renderedDoc.title,
          sourceUrl: drift.Value(url),
          sourceName: const drift.Value('LearnCpp'),
          retrievedAt: drift.Value(DateTime.now().toIso8601String()),
          originalHtml: drift.Value(response.body),
          explanation: 'Extracted from LearnCpp',
          tags: 'LearnCpp',
          difficulty: 'Unrated',
        )
      );
      return renderedDoc.cardId;
    } else {
      throw Exception('Failed to load article (Status: ${response.statusCode})');
    }
  }
}
