import 'generic_block_parser.dart';
import 'adapters/content_adapter.dart';
import 'adapters/learncpp_adapter.dart';
import 'adapters/mdn_adapter.dart';
import 'adapters/cppreference_adapter.dart';
import 'adapters/ms_learn_adapter.dart';
import 'adapters/python_docs_adapter.dart';
import 'resource_engine.dart';
import 'package:html/parser.dart' as html_parser;
import '../study_page_builder/rendered_document.dart';
import 'url_normalizer.dart';

class FallbackAdapter implements ContentAdapter {
  final GenericBlockParser _parser;
  FallbackAdapter(this._parser);

  @override
  String get sourceName => 'Web Document';

  @override
  Future<RenderedStudyDocument> extractDocument(String htmlContent, String url, ParsingReport report) async {
    final document = html_parser.parse(htmlContent);
    final titleNode = document.querySelector('title');
    final contentNode = document.querySelector('article') ?? document.querySelector('main') ?? document.body;
    
    final title = titleNode?.text.trim() ?? 'Unknown Title';
    final documentId = url.hashCode.toString(); // Stable document identifier

    final canonicalNode = document.querySelector('link[rel="canonical"]');
    final canonicalUrl = canonicalNode?.attributes['href'];
    final discoveredLinks = UrlNormalizer.extractLinks(document, url);
    
    List<StudyBlock> blocks = [];
    if (contentNode != null) {
      blocks = await _parser.parseHtmlToBlocks(contentNode.outerHtml, documentId, report);
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

class ParserRegistry {
  final ResourceEngine resourceEngine;
  late final GenericBlockParser genericParser;
  late final LearnCppAdapter learnCppAdapter;
  late final MdnAdapter mdnAdapter;
  late final CppReferenceAdapter cppReferenceAdapter;
  late final MsLearnAdapter msLearnAdapter;
  late final PythonDocsAdapter pythonDocsAdapter;
  late final FallbackAdapter fallbackAdapter;

  ParserRegistry(this.resourceEngine) {
    genericParser = GenericBlockParser(resourceEngine);
    learnCppAdapter = LearnCppAdapter(genericParser);
    mdnAdapter = MdnAdapter(genericParser);
    cppReferenceAdapter = CppReferenceAdapter(genericParser);
    msLearnAdapter = MsLearnAdapter(genericParser);
    pythonDocsAdapter = PythonDocsAdapter(genericParser);
    fallbackAdapter = FallbackAdapter(genericParser);
  }

  ContentAdapter getAdapterForUrl(String url) {
    if (url.contains('learncpp.com')) return learnCppAdapter;
    if (url.contains('developer.mozilla.org')) return mdnAdapter;
    if (url.contains('cppreference.com')) return cppReferenceAdapter;
    if (url.contains('learn.microsoft.com')) return msLearnAdapter;
    if (url.contains('docs.python.org')) return pythonDocsAdapter;
    return fallbackAdapter;
  }
}
