abstract class StudyBlock {
  final String id;
  final String type;
  const StudyBlock({required this.id, required this.type});

  Map<String, dynamic> toJson() => {'id': id, 'type': type};

  static StudyBlock fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'title': return StudyTitleBlock.fromJson(json);
      case 'section': return StudySectionBlock.fromJson(json);
      case 'paragraph': return StudyParagraphBlock.fromJson(json);
      case 'code': return CodeBlock.fromJson(json);
      case 'image': return ImageBlock.fromJson(json);
      case 'quote': return QuoteBlock.fromJson(json);
      case 'list': return ListBlock.fromJson(json);
      case 'divider': return DividerBlock.fromJson(json);
      case 'table': return TableBlock.fromJson(json);
      case 'callout': return CalloutBlock.fromJson(json);
      case 'complexity': return ComplexityTableBlock.fromJson(json);
      default: return StudyParagraphBlock(id: json['id'] ?? '', text: 'Unknown block type: ${json["type"]}');
    }
  }
}

class StudyTitleBlock extends StudyBlock {
  final String title;
  const StudyTitleBlock({required String id, required this.title}) : super(id: id, type: 'title');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'title': title});
  factory StudyTitleBlock.fromJson(Map<String, dynamic> json) => StudyTitleBlock(id: json['id'], title: json['title']);
}

class StudySectionBlock extends StudyBlock {
  final String heading;
  const StudySectionBlock({required String id, required this.heading}) : super(id: id, type: 'section');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'heading': heading});
  factory StudySectionBlock.fromJson(Map<String, dynamic> json) => StudySectionBlock(id: json['id'], heading: json['heading']);
}

class StudyParagraphBlock extends StudyBlock {
  final String text;
  const StudyParagraphBlock({required String id, required this.text}) : super(id: id, type: 'paragraph');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'text': text});
  factory StudyParagraphBlock.fromJson(Map<String, dynamic> json) => StudyParagraphBlock(id: json['id'], text: json['text']);
}

class CodeBlock extends StudyBlock {
  final String code;
  final String language;
  const CodeBlock({required String id, required this.code, required this.language}) : super(id: id, type: 'code');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'code': code, 'language': language});
  factory CodeBlock.fromJson(Map<String, dynamic> json) => CodeBlock(id: json['id'], code: json['code'], language: json['language']);
}

class ImageBlock extends StudyBlock {
  final String url;
  final String altText;
  const ImageBlock({required String id, required this.url, required this.altText}) : super(id: id, type: 'image');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'url': url, 'altText': altText});
  factory ImageBlock.fromJson(Map<String, dynamic> json) => ImageBlock(id: json['id'], url: json['url'], altText: json['altText']);
}

class QuoteBlock extends StudyBlock {
  final String text;
  final String? author;
  const QuoteBlock({required String id, required this.text, this.author}) : super(id: id, type: 'quote');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'text': text, 'author': author});
  factory QuoteBlock.fromJson(Map<String, dynamic> json) => QuoteBlock(id: json['id'], text: json['text'], author: json['author']);
}

class ListItem {
  final String text;
  const ListItem(this.text);
  Map<String, dynamic> toJson() => {'text': text};
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(json['text']);
}

class ListBlock extends StudyBlock {
  final List<ListItem> items;
  final bool isOrdered;
  const ListBlock({required String id, required this.items, this.isOrdered = false}) : super(id: id, type: 'list');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'items': items.map((i) => i.toJson()).toList(), 'isOrdered': isOrdered});
  factory ListBlock.fromJson(Map<String, dynamic> json) => ListBlock(id: json['id'], items: (json['items'] as List).map((i) => ListItem.fromJson(i)).toList(), isOrdered: json['isOrdered']);
}

class DividerBlock extends StudyBlock {
  const DividerBlock({required String id}) : super(id: id, type: 'divider');
  @override
  Map<String, dynamic> toJson() => super.toJson();
  factory DividerBlock.fromJson(Map<String, dynamic> json) => DividerBlock(id: json['id']);
}

class TableBlock extends StudyBlock {
  final List<List<String>> rows;
  const TableBlock({required String id, required this.rows}) : super(id: id, type: 'table');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'rows': rows});
  factory TableBlock.fromJson(Map<String, dynamic> json) {
    final rowsList = (json['rows'] as List).map((row) => (row as List).map((c) => c.toString()).toList()).toList();
    return TableBlock(id: json['id'], rows: rowsList);
  }
}

class CalloutBlock extends StudyBlock {
  final String text;
  final String calloutType; // tip, warning, note
  const CalloutBlock({required String id, required this.text, required this.calloutType}) : super(id: id, type: 'callout');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'text': text, 'calloutType': calloutType});
  factory CalloutBlock.fromJson(Map<String, dynamic> json) => CalloutBlock(id: json['id'], text: json['text'], calloutType: json['calloutType']);
}

class ComplexityTableBlock extends StudyBlock {
  final String timeComplexity;
  final String spaceComplexity;
  const ComplexityTableBlock({required String id, required this.timeComplexity, required this.spaceComplexity}) : super(id: id, type: 'complexity');
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll({'timeComplexity': timeComplexity, 'spaceComplexity': spaceComplexity});
  factory ComplexityTableBlock.fromJson(Map<String, dynamic> json) => ComplexityTableBlock(id: json['id'], timeComplexity: json['timeComplexity'], spaceComplexity: json['spaceComplexity']);
}

class RenderedStudyDocument {
  final String cardId;
  final String title;
  final String conceptName;
  final List<StudyBlock> blocks;
  final List<String> discoveredLinks;
  final String? canonicalUrl;


  RenderedStudyDocument({
    required this.cardId,
    required this.title,
    required this.conceptName,
    required this.blocks,
    this.discoveredLinks = const [],
    this.canonicalUrl,
  });
}
