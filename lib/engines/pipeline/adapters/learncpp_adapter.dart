import 'package:html/parser.dart' as html_parser;
import '../generic_block_parser.dart';
import '../../study_page_builder/rendered_document.dart';
import '../url_normalizer.dart';

import 'content_adapter.dart';

class LearnCppAdapter implements ContentAdapter {
  final GenericBlockParser _parser;
  
  LearnCppAdapter(this._parser);

  @override
  String get sourceName => 'LearnCpp';

  @override
  Future<RenderedStudyDocument> extractDocument(String htmlContent, String url, ParsingReport report) async {
    final document = html_parser.parse(htmlContent);
    final titleNode = document.querySelector('h1.entry-title');
    final contentNode = document.querySelector('div.entry-content');
    
    final title = titleNode?.text.trim() ?? 'Unknown Title';
    final documentId = url.hashCode.toString(); // Stable document identifier
    
    final canonicalNode = document.querySelector('link[rel="canonical"]');
    final canonicalUrl = canonicalNode?.attributes['href'];
    final discoveredLinks = UrlNormalizer.extractLinks(document, url);
    
    List<StudyBlock> blocks = [];
    if (contentNode != null) {
      blocks = await _parser.parseHtmlToBlocks(contentNode.outerHtml, documentId, report);
    } else {
      report.warnings.add('Could not find div.entry-content');
    }
    
    return RenderedStudyDocument(
      cardId: documentId,
      title: title,
      conceptName: title,
      blocks: blocks,
      discoveredLinks: discoveredLinks,
      canonicalUrl: canonicalUrl,
    );
  }
}
