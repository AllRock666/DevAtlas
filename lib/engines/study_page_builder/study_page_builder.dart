import 'dart:convert';
import 'rendered_document.dart';
import '../storage/database.dart';

import '../../di/injection.dart' as di;

abstract class StudyPageBuilder {
  Future<RenderedStudyDocument> buildPage(String cardId);
}

class DbStudyPageBuilder implements StudyPageBuilder {
  final AppDatabase _db = di.getIt<AppDatabase>();

  @override
  Future<RenderedStudyDocument> buildPage(String cardId) async {
    print('DbStudyPageBuilder: Requesting cardId = $cardId');
    final card = await (_db.select(_db.knowledgeCards)..where((t) => t.id.equals(cardId))).getSingleOrNull();
    print('DbStudyPageBuilder: found card? ${card != null}');
    
    if (card != null) {
      if (card.blocksJson != null && card.blocksJson!.isNotEmpty) {
        print('DbStudyPageBuilder: blocksJson is not empty, length: ${card.blocksJson!.length}');
        // Full offline read - zero parsing overhead
        final List<dynamic> jsonList = jsonDecode(card.blocksJson!);
        final blocks = jsonList.map((json) => StudyBlock.fromJson(json)).toList();
        return RenderedStudyDocument(
          cardId: card.id,
          title: card.title,
          conceptName: card.title,
          blocks: blocks,
        );
      } else {
        print('DbStudyPageBuilder: blocksJson is NULL or EMPTY');
      }
    }

    print('DbStudyPageBuilder: Returning mock Not Found');
    return RenderedStudyDocument(
      cardId: 'mock',
      title: 'Not Found',
      conceptName: 'Not Found',
      blocks: [const StudyParagraphBlock(id: 'err', text: 'Article not found or not properly imported.')],
    );
  }
}
