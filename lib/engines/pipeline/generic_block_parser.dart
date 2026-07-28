import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../engines/study_page_builder/rendered_document.dart';
import 'resource_engine.dart';

class ParsingReport {
  final String sourceUrl;
  final String parserVersion;
  final DateTime parseTime;
  int totalBlocks = 0;
  int unknownBlocks = 0;
  int imagesParsed = 0;
  int tablesParsed = 0;
  int codeBlocksParsed = 0;
  List<String> warnings = [];

  ParsingReport({required this.sourceUrl, required this.parserVersion, required this.parseTime});
  
  Map<String, dynamic> toJson() => {
    'sourceUrl': sourceUrl,
    'parserVersion': parserVersion,
    'parseTime': parseTime.toIso8601String(),
    'totalBlocks': totalBlocks,
    'unknownBlocks': unknownBlocks,
    'imagesParsed': imagesParsed,
    'tablesParsed': tablesParsed,
    'codeBlocksParsed': codeBlocksParsed,
    'warnings': warnings,
  };
}

class GenericBlockParser {
  final ResourceEngine _resourceEngine;
  
  GenericBlockParser(this._resourceEngine);

    Future<List<StudyBlock>> parseHtmlToBlocks(String htmlContent, String documentId, ParsingReport report) async {
      final document = html_parser.parseFragment(htmlContent);
      final blocks = <StudyBlock>[];
      int blockOrder = 0;

      String generateId(String type, String content) {
        final raw = '$documentId:$type:$blockOrder:$content';
        return md5.convert(utf8.encode(raw)).toString();
      }

    Future<void> processNode(Node node) async {
      if (node is Element) {
        final block = await _parseElement(node, generateId, report);
        if (block != null) {
          blocks.add(block);
          blockOrder++;
          report.totalBlocks++;
        } else {
          for (var child in node.children) {
            await processNode(child);
          }
        }
      }
    }

    for (var node in document.nodes) {
      await processNode(node);
    }
    
    // Validate: Merge consecutive paragraphs where possible
    final mergedBlocks = <StudyBlock>[];
    for (var block in blocks) {
      if (mergedBlocks.isNotEmpty && block is StudyParagraphBlock && mergedBlocks.last is StudyParagraphBlock) {
        final last = mergedBlocks.removeLast() as StudyParagraphBlock;
        final newText = '${last.text}\n\n${block.text}';
        mergedBlocks.add(StudyParagraphBlock(id: generateId('paragraph', newText), text: newText));
      } else {
        mergedBlocks.add(block);
      }
    }
    
    return mergedBlocks;
  }

  Future<StudyBlock?> _parseElement(Element element, String Function(String, String) generateId, ParsingReport report) async {
    // Handle LearnCpp callouts (cpp-note)
    if (element.localName == 'div' && element.className.contains('cpp-note')) {
      final text = element.text.trim();
      if (text.isEmpty) return null;
      String type = 'note';
      if (element.className.contains('warning') || text.toLowerCase().contains('warning')) type = 'warning';
      if (element.className.contains('tip') || text.toLowerCase().contains('tip')) type = 'tip';
      return CalloutBlock(id: generateId('callout', text), text: text, calloutType: type);
    }

    switch (element.localName) {
      case 'h1':
      case 'h2':
      case 'h3':
      case 'h4':
        final text = element.text.trim();
        if (text.isEmpty) return null; 
        return StudySectionBlock(id: generateId('heading', text), heading: text);
      case 'p':
        final text = element.text.trim();
        if (text.isEmpty) return null; 
        return StudyParagraphBlock(id: generateId('paragraph', text), text: text);
      case 'pre':
        final text = element.text.trim();
        if (text.isEmpty) return null; 
        report.codeBlocksParsed++;
        return CodeBlock(
          id: generateId('code', text),
          code: text,
          language: 'cpp', // Fallback for MVP
        );
      case 'code':
        if (element.parent?.localName != 'pre' && element.parent?.localName != 'p') {
          final text = element.text.trim();
          if (text.isEmpty) return null;
          report.codeBlocksParsed++;
          return CodeBlock(id: generateId('code', text), code: text, language: 'cpp');
        }
        return null;
      case 'ul':
      case 'ol':
        final items = element.children
            .where((c) => c.localName == 'li')
            .map((c) => ListItem(c.text.trim()))
            .where((i) => i.text.isNotEmpty) 
            .toList();
        if (items.isEmpty) return null;
        final rawContent = items.map((e) => e.text).join('|');
        return ListBlock(id: generateId('list', rawContent), items: items, isOrdered: element.localName == 'ol');
      case 'blockquote':
        final text = element.text.trim();
        if (text.isEmpty) return null;
        return QuoteBlock(id: generateId('quote', text), text: text);
      case 'hr':
        return DividerBlock(id: generateId('divider', ''));
      case 'img':
        final url = element.attributes['src'] ?? '';
        if (url.isEmpty) return null;
        final localPath = await _resourceEngine.downloadAndCacheResource(url);
        report.imagesParsed++;
        return ImageBlock(
          id: generateId('image', localPath),
          url: localPath,
          altText: element.attributes['alt'] ?? '',
        );
      case 'table':
        final rows = <List<String>>[];
        for (var tr in element.querySelectorAll('tr')) {
          final cells = tr.querySelectorAll('th, td').map((c) => c.text.trim()).toList();
          if (cells.isNotEmpty) rows.add(cells);
        }
        if (rows.isEmpty) return null;
        report.tablesParsed++;
        return TableBlock(id: generateId('table', rows.expand((r) => r).join('|')), rows: rows);
    }
    return null; // Return null causes recursion into children
  }
}
