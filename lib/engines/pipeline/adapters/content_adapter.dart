import '../generic_block_parser.dart';
import '../../study_page_builder/rendered_document.dart';

abstract class ContentAdapter {
  String get sourceName;
  Future<RenderedStudyDocument> extractDocument(String htmlContent, String url, ParsingReport report);
}
