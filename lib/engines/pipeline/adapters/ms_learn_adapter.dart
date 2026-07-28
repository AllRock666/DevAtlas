import 'package:html/parser.dart' as html_parser;
import '../generic_block_parser.dart';
import '../../study_page_builder/rendered_document.dart';
import '../url_normalizer.dart';
import 'content_adapter.dart';

class MsLearnAdapter implements ContentAdapter {
  final GenericBlockParser _parser;
  
  MsLearnAdapter(this._parser);

  @override
  String get sourceName => 'Microsoft Learn';

  @override
  Future<RenderedStudyDocument> extractDocument(String htmlContent, String url, ParsingReport report) async {
    final document = html_parser.parse(htmlContent);
    final titleNode = document.querySelector('h1');
    final contentNode = document.querySelector('main') ?? document.querySelector('div.content');
    
    final title = titleNode?.text.trim() ?? 'Microsoft Learn Article';
    final documentId = url.hashCode.toString();
    
    final canonicalNode = document.querySelector('link[rel="canonical"]');
    final canonicalUrl = canonicalNode?.attributes['href'];
    final discoveredLinks = UrlNormalizer.extractLinks(document, url);

    List<StudyBlock> blocks = [];
    if (contentNode != null) {
      blocks = await _parser.parseHtmlToBlocks(contentNode.outerHtml, documentId, report);
    } else {
      report.warnings.add('Could not find main or #main element');
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
