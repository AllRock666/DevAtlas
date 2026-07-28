// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RawDocumentsTable extends RawDocuments
    with TableInfo<$RawDocumentsTable, RawDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RawDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceUriMeta = const VerificationMeta(
    'sourceUri',
  );
  @override
  late final GeneratedColumn<String> sourceUri = GeneratedColumn<String>(
    'source_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawContentMeta = const VerificationMeta(
    'rawContent',
  );
  @override
  late final GeneratedColumn<String> rawContent = GeneratedColumn<String>(
    'raw_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, sourceUri, rawContent, fetchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'raw_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<RawDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_uri')) {
      context.handle(
        _sourceUriMeta,
        sourceUri.isAcceptableOrUnknown(data['source_uri']!, _sourceUriMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceUriMeta);
    }
    if (data.containsKey('raw_content')) {
      context.handle(
        _rawContentMeta,
        rawContent.isAcceptableOrUnknown(data['raw_content']!, _rawContentMeta),
      );
    } else if (isInserting) {
      context.missing(_rawContentMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RawDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RawDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sourceUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_uri'],
      )!,
      rawContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_content'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $RawDocumentsTable createAlias(String alias) {
    return $RawDocumentsTable(attachedDatabase, alias);
  }
}

class RawDocument extends DataClass implements Insertable<RawDocument> {
  final int id;
  final String sourceUri;
  final String rawContent;
  final DateTime fetchedAt;
  const RawDocument({
    required this.id,
    required this.sourceUri,
    required this.rawContent,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_uri'] = Variable<String>(sourceUri);
    map['raw_content'] = Variable<String>(rawContent);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  RawDocumentsCompanion toCompanion(bool nullToAbsent) {
    return RawDocumentsCompanion(
      id: Value(id),
      sourceUri: Value(sourceUri),
      rawContent: Value(rawContent),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory RawDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RawDocument(
      id: serializer.fromJson<int>(json['id']),
      sourceUri: serializer.fromJson<String>(json['sourceUri']),
      rawContent: serializer.fromJson<String>(json['rawContent']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceUri': serializer.toJson<String>(sourceUri),
      'rawContent': serializer.toJson<String>(rawContent),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  RawDocument copyWith({
    int? id,
    String? sourceUri,
    String? rawContent,
    DateTime? fetchedAt,
  }) => RawDocument(
    id: id ?? this.id,
    sourceUri: sourceUri ?? this.sourceUri,
    rawContent: rawContent ?? this.rawContent,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  RawDocument copyWithCompanion(RawDocumentsCompanion data) {
    return RawDocument(
      id: data.id.present ? data.id.value : this.id,
      sourceUri: data.sourceUri.present ? data.sourceUri.value : this.sourceUri,
      rawContent: data.rawContent.present
          ? data.rawContent.value
          : this.rawContent,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RawDocument(')
          ..write('id: $id, ')
          ..write('sourceUri: $sourceUri, ')
          ..write('rawContent: $rawContent, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceUri, rawContent, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RawDocument &&
          other.id == this.id &&
          other.sourceUri == this.sourceUri &&
          other.rawContent == this.rawContent &&
          other.fetchedAt == this.fetchedAt);
}

class RawDocumentsCompanion extends UpdateCompanion<RawDocument> {
  final Value<int> id;
  final Value<String> sourceUri;
  final Value<String> rawContent;
  final Value<DateTime> fetchedAt;
  const RawDocumentsCompanion({
    this.id = const Value.absent(),
    this.sourceUri = const Value.absent(),
    this.rawContent = const Value.absent(),
    this.fetchedAt = const Value.absent(),
  });
  RawDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String sourceUri,
    required String rawContent,
    this.fetchedAt = const Value.absent(),
  }) : sourceUri = Value(sourceUri),
       rawContent = Value(rawContent);
  static Insertable<RawDocument> custom({
    Expression<int>? id,
    Expression<String>? sourceUri,
    Expression<String>? rawContent,
    Expression<DateTime>? fetchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceUri != null) 'source_uri': sourceUri,
      if (rawContent != null) 'raw_content': rawContent,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
    });
  }

  RawDocumentsCompanion copyWith({
    Value<int>? id,
    Value<String>? sourceUri,
    Value<String>? rawContent,
    Value<DateTime>? fetchedAt,
  }) {
    return RawDocumentsCompanion(
      id: id ?? this.id,
      sourceUri: sourceUri ?? this.sourceUri,
      rawContent: rawContent ?? this.rawContent,
      fetchedAt: fetchedAt ?? this.fetchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceUri.present) {
      map['source_uri'] = Variable<String>(sourceUri.value);
    }
    if (rawContent.present) {
      map['raw_content'] = Variable<String>(rawContent.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RawDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('sourceUri: $sourceUri, ')
          ..write('rawContent: $rawContent, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }
}

class $NormalizedDocumentsTable extends NormalizedDocuments
    with TableInfo<$NormalizedDocumentsTable, NormalizedDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NormalizedDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _rawDocumentIdMeta = const VerificationMeta(
    'rawDocumentId',
  );
  @override
  late final GeneratedColumn<int> rawDocumentId = GeneratedColumn<int>(
    'raw_document_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES raw_documents (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalizedAtMeta = const VerificationMeta(
    'normalizedAt',
  );
  @override
  late final GeneratedColumn<DateTime> normalizedAt = GeneratedColumn<DateTime>(
    'normalized_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rawDocumentId,
    title,
    content,
    normalizedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'normalized_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<NormalizedDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('raw_document_id')) {
      context.handle(
        _rawDocumentIdMeta,
        rawDocumentId.isAcceptableOrUnknown(
          data['raw_document_id']!,
          _rawDocumentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rawDocumentIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('normalized_at')) {
      context.handle(
        _normalizedAtMeta,
        normalizedAt.isAcceptableOrUnknown(
          data['normalized_at']!,
          _normalizedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NormalizedDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NormalizedDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      rawDocumentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}raw_document_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      normalizedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}normalized_at'],
      )!,
    );
  }

  @override
  $NormalizedDocumentsTable createAlias(String alias) {
    return $NormalizedDocumentsTable(attachedDatabase, alias);
  }
}

class NormalizedDocument extends DataClass
    implements Insertable<NormalizedDocument> {
  final int id;
  final int rawDocumentId;
  final String title;
  final String content;
  final DateTime normalizedAt;
  const NormalizedDocument({
    required this.id,
    required this.rawDocumentId,
    required this.title,
    required this.content,
    required this.normalizedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['raw_document_id'] = Variable<int>(rawDocumentId);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['normalized_at'] = Variable<DateTime>(normalizedAt);
    return map;
  }

  NormalizedDocumentsCompanion toCompanion(bool nullToAbsent) {
    return NormalizedDocumentsCompanion(
      id: Value(id),
      rawDocumentId: Value(rawDocumentId),
      title: Value(title),
      content: Value(content),
      normalizedAt: Value(normalizedAt),
    );
  }

  factory NormalizedDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NormalizedDocument(
      id: serializer.fromJson<int>(json['id']),
      rawDocumentId: serializer.fromJson<int>(json['rawDocumentId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      normalizedAt: serializer.fromJson<DateTime>(json['normalizedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rawDocumentId': serializer.toJson<int>(rawDocumentId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'normalizedAt': serializer.toJson<DateTime>(normalizedAt),
    };
  }

  NormalizedDocument copyWith({
    int? id,
    int? rawDocumentId,
    String? title,
    String? content,
    DateTime? normalizedAt,
  }) => NormalizedDocument(
    id: id ?? this.id,
    rawDocumentId: rawDocumentId ?? this.rawDocumentId,
    title: title ?? this.title,
    content: content ?? this.content,
    normalizedAt: normalizedAt ?? this.normalizedAt,
  );
  NormalizedDocument copyWithCompanion(NormalizedDocumentsCompanion data) {
    return NormalizedDocument(
      id: data.id.present ? data.id.value : this.id,
      rawDocumentId: data.rawDocumentId.present
          ? data.rawDocumentId.value
          : this.rawDocumentId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      normalizedAt: data.normalizedAt.present
          ? data.normalizedAt.value
          : this.normalizedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NormalizedDocument(')
          ..write('id: $id, ')
          ..write('rawDocumentId: $rawDocumentId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('normalizedAt: $normalizedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, rawDocumentId, title, content, normalizedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NormalizedDocument &&
          other.id == this.id &&
          other.rawDocumentId == this.rawDocumentId &&
          other.title == this.title &&
          other.content == this.content &&
          other.normalizedAt == this.normalizedAt);
}

class NormalizedDocumentsCompanion extends UpdateCompanion<NormalizedDocument> {
  final Value<int> id;
  final Value<int> rawDocumentId;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> normalizedAt;
  const NormalizedDocumentsCompanion({
    this.id = const Value.absent(),
    this.rawDocumentId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.normalizedAt = const Value.absent(),
  });
  NormalizedDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int rawDocumentId,
    required String title,
    required String content,
    this.normalizedAt = const Value.absent(),
  }) : rawDocumentId = Value(rawDocumentId),
       title = Value(title),
       content = Value(content);
  static Insertable<NormalizedDocument> custom({
    Expression<int>? id,
    Expression<int>? rawDocumentId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? normalizedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rawDocumentId != null) 'raw_document_id': rawDocumentId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (normalizedAt != null) 'normalized_at': normalizedAt,
    });
  }

  NormalizedDocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? rawDocumentId,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? normalizedAt,
  }) {
    return NormalizedDocumentsCompanion(
      id: id ?? this.id,
      rawDocumentId: rawDocumentId ?? this.rawDocumentId,
      title: title ?? this.title,
      content: content ?? this.content,
      normalizedAt: normalizedAt ?? this.normalizedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rawDocumentId.present) {
      map['raw_document_id'] = Variable<int>(rawDocumentId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (normalizedAt.present) {
      map['normalized_at'] = Variable<DateTime>(normalizedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NormalizedDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('rawDocumentId: $rawDocumentId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('normalizedAt: $normalizedAt')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeCardsTable extends KnowledgeCards
    with TableInfo<$KnowledgeCardsTable, KnowledgeCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedDateMeta = const VerificationMeta(
    'publishedDate',
  );
  @override
  late final GeneratedColumn<String> publishedDate = GeneratedColumn<String>(
    'published_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _retrievedAtMeta = const VerificationMeta(
    'retrievedAt',
  );
  @override
  late final GeneratedColumn<String> retrievedAt = GeneratedColumn<String>(
    'retrieved_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parserVersionMeta = const VerificationMeta(
    'parserVersion',
  );
  @override
  late final GeneratedColumn<String> parserVersion = GeneratedColumn<String>(
    'parser_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalHtmlMeta = const VerificationMeta(
    'originalHtml',
  );
  @override
  late final GeneratedColumn<String> originalHtml = GeneratedColumn<String>(
    'original_html',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _blocksJsonMeta = const VerificationMeta(
    'blocksJson',
  );
  @override
  late final GeneratedColumn<String> blocksJson = GeneratedColumn<String>(
    'blocks_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _knowledgeArtifactJsonMeta =
      const VerificationMeta('knowledgeArtifactJson');
  @override
  late final GeneratedColumn<String> knowledgeArtifactJson =
      GeneratedColumn<String>(
        'knowledge_artifact_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _importStatusMeta = const VerificationMeta(
    'importStatus',
  );
  @override
  late final GeneratedColumn<String> importStatus = GeneratedColumn<String>(
    'import_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _contentVersionMeta = const VerificationMeta(
    'contentVersion',
  );
  @override
  late final GeneratedColumn<int> contentVersion = GeneratedColumn<int>(
    'content_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _parsingReportMeta = const VerificationMeta(
    'parsingReport',
  );
  @override
  late final GeneratedColumn<String> parsingReport = GeneratedColumn<String>(
    'parsing_report',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeComplexityMeta = const VerificationMeta(
    'timeComplexity',
  );
  @override
  late final GeneratedColumn<String> timeComplexity = GeneratedColumn<String>(
    'time_complexity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spaceComplexityMeta = const VerificationMeta(
    'spaceComplexity',
  );
  @override
  late final GeneratedColumn<String> spaceComplexity = GeneratedColumn<String>(
    'space_complexity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionNotesMeta = const VerificationMeta(
    'revisionNotes',
  );
  @override
  late final GeneratedColumn<String> revisionNotes = GeneratedColumn<String>(
    'revision_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    sourceUrl,
    sourceName,
    author,
    publishedDate,
    retrievedAt,
    parserVersion,
    originalHtml,
    blocksJson,
    knowledgeArtifactJson,
    importStatus,
    schemaVersion,
    contentVersion,
    parsingReport,
    explanation,
    tags,
    difficulty,
    timeComplexity,
    spaceComplexity,
    sources,
    revisionNotes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<KnowledgeCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('published_date')) {
      context.handle(
        _publishedDateMeta,
        publishedDate.isAcceptableOrUnknown(
          data['published_date']!,
          _publishedDateMeta,
        ),
      );
    }
    if (data.containsKey('retrieved_at')) {
      context.handle(
        _retrievedAtMeta,
        retrievedAt.isAcceptableOrUnknown(
          data['retrieved_at']!,
          _retrievedAtMeta,
        ),
      );
    }
    if (data.containsKey('parser_version')) {
      context.handle(
        _parserVersionMeta,
        parserVersion.isAcceptableOrUnknown(
          data['parser_version']!,
          _parserVersionMeta,
        ),
      );
    }
    if (data.containsKey('original_html')) {
      context.handle(
        _originalHtmlMeta,
        originalHtml.isAcceptableOrUnknown(
          data['original_html']!,
          _originalHtmlMeta,
        ),
      );
    }
    if (data.containsKey('blocks_json')) {
      context.handle(
        _blocksJsonMeta,
        blocksJson.isAcceptableOrUnknown(data['blocks_json']!, _blocksJsonMeta),
      );
    }
    if (data.containsKey('knowledge_artifact_json')) {
      context.handle(
        _knowledgeArtifactJsonMeta,
        knowledgeArtifactJson.isAcceptableOrUnknown(
          data['knowledge_artifact_json']!,
          _knowledgeArtifactJsonMeta,
        ),
      );
    }
    if (data.containsKey('import_status')) {
      context.handle(
        _importStatusMeta,
        importStatus.isAcceptableOrUnknown(
          data['import_status']!,
          _importStatusMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('content_version')) {
      context.handle(
        _contentVersionMeta,
        contentVersion.isAcceptableOrUnknown(
          data['content_version']!,
          _contentVersionMeta,
        ),
      );
    }
    if (data.containsKey('parsing_report')) {
      context.handle(
        _parsingReportMeta,
        parsingReport.isAcceptableOrUnknown(
          data['parsing_report']!,
          _parsingReportMeta,
        ),
      );
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('time_complexity')) {
      context.handle(
        _timeComplexityMeta,
        timeComplexity.isAcceptableOrUnknown(
          data['time_complexity']!,
          _timeComplexityMeta,
        ),
      );
    }
    if (data.containsKey('space_complexity')) {
      context.handle(
        _spaceComplexityMeta,
        spaceComplexity.isAcceptableOrUnknown(
          data['space_complexity']!,
          _spaceComplexityMeta,
        ),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    }
    if (data.containsKey('revision_notes')) {
      context.handle(
        _revisionNotesMeta,
        revisionNotes.isAcceptableOrUnknown(
          data['revision_notes']!,
          _revisionNotesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeCard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      ),
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      publishedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}published_date'],
      ),
      retrievedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}retrieved_at'],
      ),
      parserVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parser_version'],
      ),
      originalHtml: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_html'],
      ),
      blocksJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blocks_json'],
      ),
      knowledgeArtifactJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}knowledge_artifact_json'],
      ),
      importStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}import_status'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      contentVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}content_version'],
      )!,
      parsingReport: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsing_report'],
      ),
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      timeComplexity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_complexity'],
      ),
      spaceComplexity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}space_complexity'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      ),
      revisionNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revision_notes'],
      ),
    );
  }

  @override
  $KnowledgeCardsTable createAlias(String alias) {
    return $KnowledgeCardsTable(attachedDatabase, alias);
  }
}

class KnowledgeCard extends DataClass implements Insertable<KnowledgeCard> {
  final String id;
  final String title;
  final String? sourceUrl;
  final String? sourceName;
  final String? author;
  final String? publishedDate;
  final String? retrievedAt;
  final String? parserVersion;
  final String? originalHtml;
  final String? blocksJson;
  final String? knowledgeArtifactJson;
  final String importStatus;
  final int schemaVersion;
  final int contentVersion;
  final String? parsingReport;
  final String explanation;
  final String tags;
  final String difficulty;
  final String? timeComplexity;
  final String? spaceComplexity;
  final String? sources;
  final String? revisionNotes;
  const KnowledgeCard({
    required this.id,
    required this.title,
    this.sourceUrl,
    this.sourceName,
    this.author,
    this.publishedDate,
    this.retrievedAt,
    this.parserVersion,
    this.originalHtml,
    this.blocksJson,
    this.knowledgeArtifactJson,
    required this.importStatus,
    required this.schemaVersion,
    required this.contentVersion,
    this.parsingReport,
    required this.explanation,
    required this.tags,
    required this.difficulty,
    this.timeComplexity,
    this.spaceComplexity,
    this.sources,
    this.revisionNotes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || sourceName != null) {
      map['source_name'] = Variable<String>(sourceName);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || publishedDate != null) {
      map['published_date'] = Variable<String>(publishedDate);
    }
    if (!nullToAbsent || retrievedAt != null) {
      map['retrieved_at'] = Variable<String>(retrievedAt);
    }
    if (!nullToAbsent || parserVersion != null) {
      map['parser_version'] = Variable<String>(parserVersion);
    }
    if (!nullToAbsent || originalHtml != null) {
      map['original_html'] = Variable<String>(originalHtml);
    }
    if (!nullToAbsent || blocksJson != null) {
      map['blocks_json'] = Variable<String>(blocksJson);
    }
    if (!nullToAbsent || knowledgeArtifactJson != null) {
      map['knowledge_artifact_json'] = Variable<String>(knowledgeArtifactJson);
    }
    map['import_status'] = Variable<String>(importStatus);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['content_version'] = Variable<int>(contentVersion);
    if (!nullToAbsent || parsingReport != null) {
      map['parsing_report'] = Variable<String>(parsingReport);
    }
    map['explanation'] = Variable<String>(explanation);
    map['tags'] = Variable<String>(tags);
    map['difficulty'] = Variable<String>(difficulty);
    if (!nullToAbsent || timeComplexity != null) {
      map['time_complexity'] = Variable<String>(timeComplexity);
    }
    if (!nullToAbsent || spaceComplexity != null) {
      map['space_complexity'] = Variable<String>(spaceComplexity);
    }
    if (!nullToAbsent || sources != null) {
      map['sources'] = Variable<String>(sources);
    }
    if (!nullToAbsent || revisionNotes != null) {
      map['revision_notes'] = Variable<String>(revisionNotes);
    }
    return map;
  }

  KnowledgeCardsCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeCardsCompanion(
      id: Value(id),
      title: Value(title),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      sourceName: sourceName == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceName),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      publishedDate: publishedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedDate),
      retrievedAt: retrievedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(retrievedAt),
      parserVersion: parserVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(parserVersion),
      originalHtml: originalHtml == null && nullToAbsent
          ? const Value.absent()
          : Value(originalHtml),
      blocksJson: blocksJson == null && nullToAbsent
          ? const Value.absent()
          : Value(blocksJson),
      knowledgeArtifactJson: knowledgeArtifactJson == null && nullToAbsent
          ? const Value.absent()
          : Value(knowledgeArtifactJson),
      importStatus: Value(importStatus),
      schemaVersion: Value(schemaVersion),
      contentVersion: Value(contentVersion),
      parsingReport: parsingReport == null && nullToAbsent
          ? const Value.absent()
          : Value(parsingReport),
      explanation: Value(explanation),
      tags: Value(tags),
      difficulty: Value(difficulty),
      timeComplexity: timeComplexity == null && nullToAbsent
          ? const Value.absent()
          : Value(timeComplexity),
      spaceComplexity: spaceComplexity == null && nullToAbsent
          ? const Value.absent()
          : Value(spaceComplexity),
      sources: sources == null && nullToAbsent
          ? const Value.absent()
          : Value(sources),
      revisionNotes: revisionNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(revisionNotes),
    );
  }

  factory KnowledgeCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeCard(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      sourceName: serializer.fromJson<String?>(json['sourceName']),
      author: serializer.fromJson<String?>(json['author']),
      publishedDate: serializer.fromJson<String?>(json['publishedDate']),
      retrievedAt: serializer.fromJson<String?>(json['retrievedAt']),
      parserVersion: serializer.fromJson<String?>(json['parserVersion']),
      originalHtml: serializer.fromJson<String?>(json['originalHtml']),
      blocksJson: serializer.fromJson<String?>(json['blocksJson']),
      knowledgeArtifactJson: serializer.fromJson<String?>(
        json['knowledgeArtifactJson'],
      ),
      importStatus: serializer.fromJson<String>(json['importStatus']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      contentVersion: serializer.fromJson<int>(json['contentVersion']),
      parsingReport: serializer.fromJson<String?>(json['parsingReport']),
      explanation: serializer.fromJson<String>(json['explanation']),
      tags: serializer.fromJson<String>(json['tags']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      timeComplexity: serializer.fromJson<String?>(json['timeComplexity']),
      spaceComplexity: serializer.fromJson<String?>(json['spaceComplexity']),
      sources: serializer.fromJson<String?>(json['sources']),
      revisionNotes: serializer.fromJson<String?>(json['revisionNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'sourceName': serializer.toJson<String?>(sourceName),
      'author': serializer.toJson<String?>(author),
      'publishedDate': serializer.toJson<String?>(publishedDate),
      'retrievedAt': serializer.toJson<String?>(retrievedAt),
      'parserVersion': serializer.toJson<String?>(parserVersion),
      'originalHtml': serializer.toJson<String?>(originalHtml),
      'blocksJson': serializer.toJson<String?>(blocksJson),
      'knowledgeArtifactJson': serializer.toJson<String?>(
        knowledgeArtifactJson,
      ),
      'importStatus': serializer.toJson<String>(importStatus),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'contentVersion': serializer.toJson<int>(contentVersion),
      'parsingReport': serializer.toJson<String?>(parsingReport),
      'explanation': serializer.toJson<String>(explanation),
      'tags': serializer.toJson<String>(tags),
      'difficulty': serializer.toJson<String>(difficulty),
      'timeComplexity': serializer.toJson<String?>(timeComplexity),
      'spaceComplexity': serializer.toJson<String?>(spaceComplexity),
      'sources': serializer.toJson<String?>(sources),
      'revisionNotes': serializer.toJson<String?>(revisionNotes),
    };
  }

  KnowledgeCard copyWith({
    String? id,
    String? title,
    Value<String?> sourceUrl = const Value.absent(),
    Value<String?> sourceName = const Value.absent(),
    Value<String?> author = const Value.absent(),
    Value<String?> publishedDate = const Value.absent(),
    Value<String?> retrievedAt = const Value.absent(),
    Value<String?> parserVersion = const Value.absent(),
    Value<String?> originalHtml = const Value.absent(),
    Value<String?> blocksJson = const Value.absent(),
    Value<String?> knowledgeArtifactJson = const Value.absent(),
    String? importStatus,
    int? schemaVersion,
    int? contentVersion,
    Value<String?> parsingReport = const Value.absent(),
    String? explanation,
    String? tags,
    String? difficulty,
    Value<String?> timeComplexity = const Value.absent(),
    Value<String?> spaceComplexity = const Value.absent(),
    Value<String?> sources = const Value.absent(),
    Value<String?> revisionNotes = const Value.absent(),
  }) => KnowledgeCard(
    id: id ?? this.id,
    title: title ?? this.title,
    sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
    sourceName: sourceName.present ? sourceName.value : this.sourceName,
    author: author.present ? author.value : this.author,
    publishedDate: publishedDate.present
        ? publishedDate.value
        : this.publishedDate,
    retrievedAt: retrievedAt.present ? retrievedAt.value : this.retrievedAt,
    parserVersion: parserVersion.present
        ? parserVersion.value
        : this.parserVersion,
    originalHtml: originalHtml.present ? originalHtml.value : this.originalHtml,
    blocksJson: blocksJson.present ? blocksJson.value : this.blocksJson,
    knowledgeArtifactJson: knowledgeArtifactJson.present
        ? knowledgeArtifactJson.value
        : this.knowledgeArtifactJson,
    importStatus: importStatus ?? this.importStatus,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    contentVersion: contentVersion ?? this.contentVersion,
    parsingReport: parsingReport.present
        ? parsingReport.value
        : this.parsingReport,
    explanation: explanation ?? this.explanation,
    tags: tags ?? this.tags,
    difficulty: difficulty ?? this.difficulty,
    timeComplexity: timeComplexity.present
        ? timeComplexity.value
        : this.timeComplexity,
    spaceComplexity: spaceComplexity.present
        ? spaceComplexity.value
        : this.spaceComplexity,
    sources: sources.present ? sources.value : this.sources,
    revisionNotes: revisionNotes.present
        ? revisionNotes.value
        : this.revisionNotes,
  );
  KnowledgeCard copyWithCompanion(KnowledgeCardsCompanion data) {
    return KnowledgeCard(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      author: data.author.present ? data.author.value : this.author,
      publishedDate: data.publishedDate.present
          ? data.publishedDate.value
          : this.publishedDate,
      retrievedAt: data.retrievedAt.present
          ? data.retrievedAt.value
          : this.retrievedAt,
      parserVersion: data.parserVersion.present
          ? data.parserVersion.value
          : this.parserVersion,
      originalHtml: data.originalHtml.present
          ? data.originalHtml.value
          : this.originalHtml,
      blocksJson: data.blocksJson.present
          ? data.blocksJson.value
          : this.blocksJson,
      knowledgeArtifactJson: data.knowledgeArtifactJson.present
          ? data.knowledgeArtifactJson.value
          : this.knowledgeArtifactJson,
      importStatus: data.importStatus.present
          ? data.importStatus.value
          : this.importStatus,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      contentVersion: data.contentVersion.present
          ? data.contentVersion.value
          : this.contentVersion,
      parsingReport: data.parsingReport.present
          ? data.parsingReport.value
          : this.parsingReport,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      tags: data.tags.present ? data.tags.value : this.tags,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      timeComplexity: data.timeComplexity.present
          ? data.timeComplexity.value
          : this.timeComplexity,
      spaceComplexity: data.spaceComplexity.present
          ? data.spaceComplexity.value
          : this.spaceComplexity,
      sources: data.sources.present ? data.sources.value : this.sources,
      revisionNotes: data.revisionNotes.present
          ? data.revisionNotes.value
          : this.revisionNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeCard(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('retrievedAt: $retrievedAt, ')
          ..write('parserVersion: $parserVersion, ')
          ..write('originalHtml: $originalHtml, ')
          ..write('blocksJson: $blocksJson, ')
          ..write('knowledgeArtifactJson: $knowledgeArtifactJson, ')
          ..write('importStatus: $importStatus, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('parsingReport: $parsingReport, ')
          ..write('explanation: $explanation, ')
          ..write('tags: $tags, ')
          ..write('difficulty: $difficulty, ')
          ..write('timeComplexity: $timeComplexity, ')
          ..write('spaceComplexity: $spaceComplexity, ')
          ..write('sources: $sources, ')
          ..write('revisionNotes: $revisionNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    sourceUrl,
    sourceName,
    author,
    publishedDate,
    retrievedAt,
    parserVersion,
    originalHtml,
    blocksJson,
    knowledgeArtifactJson,
    importStatus,
    schemaVersion,
    contentVersion,
    parsingReport,
    explanation,
    tags,
    difficulty,
    timeComplexity,
    spaceComplexity,
    sources,
    revisionNotes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeCard &&
          other.id == this.id &&
          other.title == this.title &&
          other.sourceUrl == this.sourceUrl &&
          other.sourceName == this.sourceName &&
          other.author == this.author &&
          other.publishedDate == this.publishedDate &&
          other.retrievedAt == this.retrievedAt &&
          other.parserVersion == this.parserVersion &&
          other.originalHtml == this.originalHtml &&
          other.blocksJson == this.blocksJson &&
          other.knowledgeArtifactJson == this.knowledgeArtifactJson &&
          other.importStatus == this.importStatus &&
          other.schemaVersion == this.schemaVersion &&
          other.contentVersion == this.contentVersion &&
          other.parsingReport == this.parsingReport &&
          other.explanation == this.explanation &&
          other.tags == this.tags &&
          other.difficulty == this.difficulty &&
          other.timeComplexity == this.timeComplexity &&
          other.spaceComplexity == this.spaceComplexity &&
          other.sources == this.sources &&
          other.revisionNotes == this.revisionNotes);
}

class KnowledgeCardsCompanion extends UpdateCompanion<KnowledgeCard> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> sourceUrl;
  final Value<String?> sourceName;
  final Value<String?> author;
  final Value<String?> publishedDate;
  final Value<String?> retrievedAt;
  final Value<String?> parserVersion;
  final Value<String?> originalHtml;
  final Value<String?> blocksJson;
  final Value<String?> knowledgeArtifactJson;
  final Value<String> importStatus;
  final Value<int> schemaVersion;
  final Value<int> contentVersion;
  final Value<String?> parsingReport;
  final Value<String> explanation;
  final Value<String> tags;
  final Value<String> difficulty;
  final Value<String?> timeComplexity;
  final Value<String?> spaceComplexity;
  final Value<String?> sources;
  final Value<String?> revisionNotes;
  final Value<int> rowid;
  const KnowledgeCardsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.retrievedAt = const Value.absent(),
    this.parserVersion = const Value.absent(),
    this.originalHtml = const Value.absent(),
    this.blocksJson = const Value.absent(),
    this.knowledgeArtifactJson = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.parsingReport = const Value.absent(),
    this.explanation = const Value.absent(),
    this.tags = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.timeComplexity = const Value.absent(),
    this.spaceComplexity = const Value.absent(),
    this.sources = const Value.absent(),
    this.revisionNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowledgeCardsCompanion.insert({
    required String id,
    required String title,
    this.sourceUrl = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.retrievedAt = const Value.absent(),
    this.parserVersion = const Value.absent(),
    this.originalHtml = const Value.absent(),
    this.blocksJson = const Value.absent(),
    this.knowledgeArtifactJson = const Value.absent(),
    this.importStatus = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.parsingReport = const Value.absent(),
    required String explanation,
    required String tags,
    required String difficulty,
    this.timeComplexity = const Value.absent(),
    this.spaceComplexity = const Value.absent(),
    this.sources = const Value.absent(),
    this.revisionNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       explanation = Value(explanation),
       tags = Value(tags),
       difficulty = Value(difficulty);
  static Insertable<KnowledgeCard> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? sourceUrl,
    Expression<String>? sourceName,
    Expression<String>? author,
    Expression<String>? publishedDate,
    Expression<String>? retrievedAt,
    Expression<String>? parserVersion,
    Expression<String>? originalHtml,
    Expression<String>? blocksJson,
    Expression<String>? knowledgeArtifactJson,
    Expression<String>? importStatus,
    Expression<int>? schemaVersion,
    Expression<int>? contentVersion,
    Expression<String>? parsingReport,
    Expression<String>? explanation,
    Expression<String>? tags,
    Expression<String>? difficulty,
    Expression<String>? timeComplexity,
    Expression<String>? spaceComplexity,
    Expression<String>? sources,
    Expression<String>? revisionNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (sourceName != null) 'source_name': sourceName,
      if (author != null) 'author': author,
      if (publishedDate != null) 'published_date': publishedDate,
      if (retrievedAt != null) 'retrieved_at': retrievedAt,
      if (parserVersion != null) 'parser_version': parserVersion,
      if (originalHtml != null) 'original_html': originalHtml,
      if (blocksJson != null) 'blocks_json': blocksJson,
      if (knowledgeArtifactJson != null)
        'knowledge_artifact_json': knowledgeArtifactJson,
      if (importStatus != null) 'import_status': importStatus,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (contentVersion != null) 'content_version': contentVersion,
      if (parsingReport != null) 'parsing_report': parsingReport,
      if (explanation != null) 'explanation': explanation,
      if (tags != null) 'tags': tags,
      if (difficulty != null) 'difficulty': difficulty,
      if (timeComplexity != null) 'time_complexity': timeComplexity,
      if (spaceComplexity != null) 'space_complexity': spaceComplexity,
      if (sources != null) 'sources': sources,
      if (revisionNotes != null) 'revision_notes': revisionNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowledgeCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? sourceUrl,
    Value<String?>? sourceName,
    Value<String?>? author,
    Value<String?>? publishedDate,
    Value<String?>? retrievedAt,
    Value<String?>? parserVersion,
    Value<String?>? originalHtml,
    Value<String?>? blocksJson,
    Value<String?>? knowledgeArtifactJson,
    Value<String>? importStatus,
    Value<int>? schemaVersion,
    Value<int>? contentVersion,
    Value<String?>? parsingReport,
    Value<String>? explanation,
    Value<String>? tags,
    Value<String>? difficulty,
    Value<String?>? timeComplexity,
    Value<String?>? spaceComplexity,
    Value<String?>? sources,
    Value<String?>? revisionNotes,
    Value<int>? rowid,
  }) {
    return KnowledgeCardsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      publishedDate: publishedDate ?? this.publishedDate,
      retrievedAt: retrievedAt ?? this.retrievedAt,
      parserVersion: parserVersion ?? this.parserVersion,
      originalHtml: originalHtml ?? this.originalHtml,
      blocksJson: blocksJson ?? this.blocksJson,
      knowledgeArtifactJson:
          knowledgeArtifactJson ?? this.knowledgeArtifactJson,
      importStatus: importStatus ?? this.importStatus,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      contentVersion: contentVersion ?? this.contentVersion,
      parsingReport: parsingReport ?? this.parsingReport,
      explanation: explanation ?? this.explanation,
      tags: tags ?? this.tags,
      difficulty: difficulty ?? this.difficulty,
      timeComplexity: timeComplexity ?? this.timeComplexity,
      spaceComplexity: spaceComplexity ?? this.spaceComplexity,
      sources: sources ?? this.sources,
      revisionNotes: revisionNotes ?? this.revisionNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (retrievedAt.present) {
      map['retrieved_at'] = Variable<String>(retrievedAt.value);
    }
    if (parserVersion.present) {
      map['parser_version'] = Variable<String>(parserVersion.value);
    }
    if (originalHtml.present) {
      map['original_html'] = Variable<String>(originalHtml.value);
    }
    if (blocksJson.present) {
      map['blocks_json'] = Variable<String>(blocksJson.value);
    }
    if (knowledgeArtifactJson.present) {
      map['knowledge_artifact_json'] = Variable<String>(
        knowledgeArtifactJson.value,
      );
    }
    if (importStatus.present) {
      map['import_status'] = Variable<String>(importStatus.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (contentVersion.present) {
      map['content_version'] = Variable<int>(contentVersion.value);
    }
    if (parsingReport.present) {
      map['parsing_report'] = Variable<String>(parsingReport.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (timeComplexity.present) {
      map['time_complexity'] = Variable<String>(timeComplexity.value);
    }
    if (spaceComplexity.present) {
      map['space_complexity'] = Variable<String>(spaceComplexity.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (revisionNotes.present) {
      map['revision_notes'] = Variable<String>(revisionNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeCardsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('retrievedAt: $retrievedAt, ')
          ..write('parserVersion: $parserVersion, ')
          ..write('originalHtml: $originalHtml, ')
          ..write('blocksJson: $blocksJson, ')
          ..write('knowledgeArtifactJson: $knowledgeArtifactJson, ')
          ..write('importStatus: $importStatus, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('parsingReport: $parsingReport, ')
          ..write('explanation: $explanation, ')
          ..write('tags: $tags, ')
          ..write('difficulty: $difficulty, ')
          ..write('timeComplexity: $timeComplexity, ')
          ..write('spaceComplexity: $spaceComplexity, ')
          ..write('sources: $sources, ')
          ..write('revisionNotes: $revisionNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GraphLinksTable extends GraphLinks
    with TableInfo<$GraphLinksTable, GraphLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GraphLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceCardIdMeta = const VerificationMeta(
    'sourceCardId',
  );
  @override
  late final GeneratedColumn<String> sourceCardId = GeneratedColumn<String>(
    'source_card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _targetCardIdMeta = const VerificationMeta(
    'targetCardId',
  );
  @override
  late final GeneratedColumn<String> targetCardId = GeneratedColumn<String>(
    'target_card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _relationshipTypeMeta = const VerificationMeta(
    'relationshipType',
  );
  @override
  late final GeneratedColumn<String> relationshipType = GeneratedColumn<String>(
    'relationship_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sourceCardId,
    targetCardId,
    relationshipType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'graph_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<GraphLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_card_id')) {
      context.handle(
        _sourceCardIdMeta,
        sourceCardId.isAcceptableOrUnknown(
          data['source_card_id']!,
          _sourceCardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceCardIdMeta);
    }
    if (data.containsKey('target_card_id')) {
      context.handle(
        _targetCardIdMeta,
        targetCardId.isAcceptableOrUnknown(
          data['target_card_id']!,
          _targetCardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCardIdMeta);
    }
    if (data.containsKey('relationship_type')) {
      context.handle(
        _relationshipTypeMeta,
        relationshipType.isAcceptableOrUnknown(
          data['relationship_type']!,
          _relationshipTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    sourceCardId,
    targetCardId,
    relationshipType,
  };
  @override
  GraphLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GraphLink(
      sourceCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_card_id'],
      )!,
      targetCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_card_id'],
      )!,
      relationshipType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship_type'],
      )!,
    );
  }

  @override
  $GraphLinksTable createAlias(String alias) {
    return $GraphLinksTable(attachedDatabase, alias);
  }
}

class GraphLink extends DataClass implements Insertable<GraphLink> {
  final String sourceCardId;
  final String targetCardId;
  final String relationshipType;
  const GraphLink({
    required this.sourceCardId,
    required this.targetCardId,
    required this.relationshipType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_card_id'] = Variable<String>(sourceCardId);
    map['target_card_id'] = Variable<String>(targetCardId);
    map['relationship_type'] = Variable<String>(relationshipType);
    return map;
  }

  GraphLinksCompanion toCompanion(bool nullToAbsent) {
    return GraphLinksCompanion(
      sourceCardId: Value(sourceCardId),
      targetCardId: Value(targetCardId),
      relationshipType: Value(relationshipType),
    );
  }

  factory GraphLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GraphLink(
      sourceCardId: serializer.fromJson<String>(json['sourceCardId']),
      targetCardId: serializer.fromJson<String>(json['targetCardId']),
      relationshipType: serializer.fromJson<String>(json['relationshipType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceCardId': serializer.toJson<String>(sourceCardId),
      'targetCardId': serializer.toJson<String>(targetCardId),
      'relationshipType': serializer.toJson<String>(relationshipType),
    };
  }

  GraphLink copyWith({
    String? sourceCardId,
    String? targetCardId,
    String? relationshipType,
  }) => GraphLink(
    sourceCardId: sourceCardId ?? this.sourceCardId,
    targetCardId: targetCardId ?? this.targetCardId,
    relationshipType: relationshipType ?? this.relationshipType,
  );
  GraphLink copyWithCompanion(GraphLinksCompanion data) {
    return GraphLink(
      sourceCardId: data.sourceCardId.present
          ? data.sourceCardId.value
          : this.sourceCardId,
      targetCardId: data.targetCardId.present
          ? data.targetCardId.value
          : this.targetCardId,
      relationshipType: data.relationshipType.present
          ? data.relationshipType.value
          : this.relationshipType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GraphLink(')
          ..write('sourceCardId: $sourceCardId, ')
          ..write('targetCardId: $targetCardId, ')
          ..write('relationshipType: $relationshipType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sourceCardId, targetCardId, relationshipType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GraphLink &&
          other.sourceCardId == this.sourceCardId &&
          other.targetCardId == this.targetCardId &&
          other.relationshipType == this.relationshipType);
}

class GraphLinksCompanion extends UpdateCompanion<GraphLink> {
  final Value<String> sourceCardId;
  final Value<String> targetCardId;
  final Value<String> relationshipType;
  final Value<int> rowid;
  const GraphLinksCompanion({
    this.sourceCardId = const Value.absent(),
    this.targetCardId = const Value.absent(),
    this.relationshipType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GraphLinksCompanion.insert({
    required String sourceCardId,
    required String targetCardId,
    required String relationshipType,
    this.rowid = const Value.absent(),
  }) : sourceCardId = Value(sourceCardId),
       targetCardId = Value(targetCardId),
       relationshipType = Value(relationshipType);
  static Insertable<GraphLink> custom({
    Expression<String>? sourceCardId,
    Expression<String>? targetCardId,
    Expression<String>? relationshipType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sourceCardId != null) 'source_card_id': sourceCardId,
      if (targetCardId != null) 'target_card_id': targetCardId,
      if (relationshipType != null) 'relationship_type': relationshipType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GraphLinksCompanion copyWith({
    Value<String>? sourceCardId,
    Value<String>? targetCardId,
    Value<String>? relationshipType,
    Value<int>? rowid,
  }) {
    return GraphLinksCompanion(
      sourceCardId: sourceCardId ?? this.sourceCardId,
      targetCardId: targetCardId ?? this.targetCardId,
      relationshipType: relationshipType ?? this.relationshipType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceCardId.present) {
      map['source_card_id'] = Variable<String>(sourceCardId.value);
    }
    if (targetCardId.present) {
      map['target_card_id'] = Variable<String>(targetCardId.value);
    }
    if (relationshipType.present) {
      map['relationship_type'] = Variable<String>(relationshipType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GraphLinksCompanion(')
          ..write('sourceCardId: $sourceCardId, ')
          ..write('targetCardId: $targetCardId, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProblemPatternsTable extends ProblemPatterns
    with TableInfo<$ProblemPatternsTable, ProblemPattern> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemPatternsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recognitionTipsMeta = const VerificationMeta(
    'recognitionTips',
  );
  @override
  late final GeneratedColumn<String> recognitionTips = GeneratedColumn<String>(
    'recognition_tips',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _commonMistakesMeta = const VerificationMeta(
    'commonMistakes',
  );
  @override
  late final GeneratedColumn<String> commonMistakes = GeneratedColumn<String>(
    'common_mistakes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemsJsonMeta = const VerificationMeta(
    'problemsJson',
  );
  @override
  late final GeneratedColumn<String> problemsJson = GeneratedColumn<String>(
    'problems_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardId,
    name,
    explanation,
    recognitionTips,
    commonMistakes,
    problemsJson,
    difficulty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problem_patterns';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProblemPattern> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('recognition_tips')) {
      context.handle(
        _recognitionTipsMeta,
        recognitionTips.isAcceptableOrUnknown(
          data['recognition_tips']!,
          _recognitionTipsMeta,
        ),
      );
    }
    if (data.containsKey('common_mistakes')) {
      context.handle(
        _commonMistakesMeta,
        commonMistakes.isAcceptableOrUnknown(
          data['common_mistakes']!,
          _commonMistakesMeta,
        ),
      );
    }
    if (data.containsKey('problems_json')) {
      context.handle(
        _problemsJsonMeta,
        problemsJson.isAcceptableOrUnknown(
          data['problems_json']!,
          _problemsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_problemsJsonMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProblemPattern map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProblemPattern(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      recognitionTips: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recognition_tips'],
      ),
      commonMistakes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_mistakes'],
      ),
      problemsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}problems_json'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      ),
    );
  }

  @override
  $ProblemPatternsTable createAlias(String alias) {
    return $ProblemPatternsTable(attachedDatabase, alias);
  }
}

class ProblemPattern extends DataClass implements Insertable<ProblemPattern> {
  final String id;
  final String cardId;
  final String name;
  final String explanation;
  final String? recognitionTips;
  final String? commonMistakes;
  final String problemsJson;
  final String? difficulty;
  const ProblemPattern({
    required this.id,
    required this.cardId,
    required this.name,
    required this.explanation,
    this.recognitionTips,
    this.commonMistakes,
    required this.problemsJson,
    this.difficulty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['card_id'] = Variable<String>(cardId);
    map['name'] = Variable<String>(name);
    map['explanation'] = Variable<String>(explanation);
    if (!nullToAbsent || recognitionTips != null) {
      map['recognition_tips'] = Variable<String>(recognitionTips);
    }
    if (!nullToAbsent || commonMistakes != null) {
      map['common_mistakes'] = Variable<String>(commonMistakes);
    }
    map['problems_json'] = Variable<String>(problemsJson);
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String>(difficulty);
    }
    return map;
  }

  ProblemPatternsCompanion toCompanion(bool nullToAbsent) {
    return ProblemPatternsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      name: Value(name),
      explanation: Value(explanation),
      recognitionTips: recognitionTips == null && nullToAbsent
          ? const Value.absent()
          : Value(recognitionTips),
      commonMistakes: commonMistakes == null && nullToAbsent
          ? const Value.absent()
          : Value(commonMistakes),
      problemsJson: Value(problemsJson),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
    );
  }

  factory ProblemPattern.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProblemPattern(
      id: serializer.fromJson<String>(json['id']),
      cardId: serializer.fromJson<String>(json['cardId']),
      name: serializer.fromJson<String>(json['name']),
      explanation: serializer.fromJson<String>(json['explanation']),
      recognitionTips: serializer.fromJson<String?>(json['recognitionTips']),
      commonMistakes: serializer.fromJson<String?>(json['commonMistakes']),
      problemsJson: serializer.fromJson<String>(json['problemsJson']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardId': serializer.toJson<String>(cardId),
      'name': serializer.toJson<String>(name),
      'explanation': serializer.toJson<String>(explanation),
      'recognitionTips': serializer.toJson<String?>(recognitionTips),
      'commonMistakes': serializer.toJson<String?>(commonMistakes),
      'problemsJson': serializer.toJson<String>(problemsJson),
      'difficulty': serializer.toJson<String?>(difficulty),
    };
  }

  ProblemPattern copyWith({
    String? id,
    String? cardId,
    String? name,
    String? explanation,
    Value<String?> recognitionTips = const Value.absent(),
    Value<String?> commonMistakes = const Value.absent(),
    String? problemsJson,
    Value<String?> difficulty = const Value.absent(),
  }) => ProblemPattern(
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    name: name ?? this.name,
    explanation: explanation ?? this.explanation,
    recognitionTips: recognitionTips.present
        ? recognitionTips.value
        : this.recognitionTips,
    commonMistakes: commonMistakes.present
        ? commonMistakes.value
        : this.commonMistakes,
    problemsJson: problemsJson ?? this.problemsJson,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
  );
  ProblemPattern copyWithCompanion(ProblemPatternsCompanion data) {
    return ProblemPattern(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      name: data.name.present ? data.name.value : this.name,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      recognitionTips: data.recognitionTips.present
          ? data.recognitionTips.value
          : this.recognitionTips,
      commonMistakes: data.commonMistakes.present
          ? data.commonMistakes.value
          : this.commonMistakes,
      problemsJson: data.problemsJson.present
          ? data.problemsJson.value
          : this.problemsJson,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProblemPattern(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('name: $name, ')
          ..write('explanation: $explanation, ')
          ..write('recognitionTips: $recognitionTips, ')
          ..write('commonMistakes: $commonMistakes, ')
          ..write('problemsJson: $problemsJson, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardId,
    name,
    explanation,
    recognitionTips,
    commonMistakes,
    problemsJson,
    difficulty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProblemPattern &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.name == this.name &&
          other.explanation == this.explanation &&
          other.recognitionTips == this.recognitionTips &&
          other.commonMistakes == this.commonMistakes &&
          other.problemsJson == this.problemsJson &&
          other.difficulty == this.difficulty);
}

class ProblemPatternsCompanion extends UpdateCompanion<ProblemPattern> {
  final Value<String> id;
  final Value<String> cardId;
  final Value<String> name;
  final Value<String> explanation;
  final Value<String?> recognitionTips;
  final Value<String?> commonMistakes;
  final Value<String> problemsJson;
  final Value<String?> difficulty;
  final Value<int> rowid;
  const ProblemPatternsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.name = const Value.absent(),
    this.explanation = const Value.absent(),
    this.recognitionTips = const Value.absent(),
    this.commonMistakes = const Value.absent(),
    this.problemsJson = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProblemPatternsCompanion.insert({
    required String id,
    required String cardId,
    required String name,
    required String explanation,
    this.recognitionTips = const Value.absent(),
    this.commonMistakes = const Value.absent(),
    required String problemsJson,
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardId = Value(cardId),
       name = Value(name),
       explanation = Value(explanation),
       problemsJson = Value(problemsJson);
  static Insertable<ProblemPattern> custom({
    Expression<String>? id,
    Expression<String>? cardId,
    Expression<String>? name,
    Expression<String>? explanation,
    Expression<String>? recognitionTips,
    Expression<String>? commonMistakes,
    Expression<String>? problemsJson,
    Expression<String>? difficulty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (name != null) 'name': name,
      if (explanation != null) 'explanation': explanation,
      if (recognitionTips != null) 'recognition_tips': recognitionTips,
      if (commonMistakes != null) 'common_mistakes': commonMistakes,
      if (problemsJson != null) 'problems_json': problemsJson,
      if (difficulty != null) 'difficulty': difficulty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProblemPatternsCompanion copyWith({
    Value<String>? id,
    Value<String>? cardId,
    Value<String>? name,
    Value<String>? explanation,
    Value<String?>? recognitionTips,
    Value<String?>? commonMistakes,
    Value<String>? problemsJson,
    Value<String?>? difficulty,
    Value<int>? rowid,
  }) {
    return ProblemPatternsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      name: name ?? this.name,
      explanation: explanation ?? this.explanation,
      recognitionTips: recognitionTips ?? this.recognitionTips,
      commonMistakes: commonMistakes ?? this.commonMistakes,
      problemsJson: problemsJson ?? this.problemsJson,
      difficulty: difficulty ?? this.difficulty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (recognitionTips.present) {
      map['recognition_tips'] = Variable<String>(recognitionTips.value);
    }
    if (commonMistakes.present) {
      map['common_mistakes'] = Variable<String>(commonMistakes.value);
    }
    if (problemsJson.present) {
      map['problems_json'] = Variable<String>(problemsJson.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemPatternsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('name: $name, ')
          ..write('explanation: $explanation, ')
          ..write('recognitionTips: $recognitionTips, ')
          ..write('commonMistakes: $commonMistakes, ')
          ..write('problemsJson: $problemsJson, ')
          ..write('difficulty: $difficulty, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningProgressTable extends LearningProgress
    with TableInfo<$LearningProgressTable, LearningProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('not_started'),
  );
  static const VerificationMeta _confidenceLevelMeta = const VerificationMeta(
    'confidenceLevel',
  );
  @override
  late final GeneratedColumn<int> confidenceLevel = GeneratedColumn<int>(
    'confidence_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastRevisedAtMeta = const VerificationMeta(
    'lastRevisedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastRevisedAt =
      GeneratedColumn<DateTime>(
        'last_revised_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _nextRevisionAtMeta = const VerificationMeta(
    'nextRevisionAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRevisionAt =
      GeneratedColumn<DateTime>(
        'next_revision_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastOpenedAtMeta = const VerificationMeta(
    'lastOpenedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastOpenedAt = GeneratedColumn<DateTime>(
    'last_opened_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readingPositionMeta = const VerificationMeta(
    'readingPosition',
  );
  @override
  late final GeneratedColumn<double> readingPosition = GeneratedColumn<double>(
    'reading_position',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    cardId,
    status,
    confidenceLevel,
    lastRevisedAt,
    nextRevisionAt,
    lastOpenedAt,
    readingPosition,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<LearningProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('confidence_level')) {
      context.handle(
        _confidenceLevelMeta,
        confidenceLevel.isAcceptableOrUnknown(
          data['confidence_level']!,
          _confidenceLevelMeta,
        ),
      );
    }
    if (data.containsKey('last_revised_at')) {
      context.handle(
        _lastRevisedAtMeta,
        lastRevisedAt.isAcceptableOrUnknown(
          data['last_revised_at']!,
          _lastRevisedAtMeta,
        ),
      );
    }
    if (data.containsKey('next_revision_at')) {
      context.handle(
        _nextRevisionAtMeta,
        nextRevisionAt.isAcceptableOrUnknown(
          data['next_revision_at']!,
          _nextRevisionAtMeta,
        ),
      );
    }
    if (data.containsKey('last_opened_at')) {
      context.handle(
        _lastOpenedAtMeta,
        lastOpenedAt.isAcceptableOrUnknown(
          data['last_opened_at']!,
          _lastOpenedAtMeta,
        ),
      );
    }
    if (data.containsKey('reading_position')) {
      context.handle(
        _readingPositionMeta,
        readingPosition.isAcceptableOrUnknown(
          data['reading_position']!,
          _readingPositionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cardId};
  @override
  LearningProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningProgressData(
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      confidenceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence_level'],
      )!,
      lastRevisedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_revised_at'],
      ),
      nextRevisionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_revision_at'],
      ),
      lastOpenedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_opened_at'],
      ),
      readingPosition: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}reading_position'],
      )!,
    );
  }

  @override
  $LearningProgressTable createAlias(String alias) {
    return $LearningProgressTable(attachedDatabase, alias);
  }
}

class LearningProgressData extends DataClass
    implements Insertable<LearningProgressData> {
  final String cardId;
  final String status;
  final int confidenceLevel;
  final DateTime? lastRevisedAt;
  final DateTime? nextRevisionAt;
  final DateTime? lastOpenedAt;
  final double readingPosition;
  const LearningProgressData({
    required this.cardId,
    required this.status,
    required this.confidenceLevel,
    this.lastRevisedAt,
    this.nextRevisionAt,
    this.lastOpenedAt,
    required this.readingPosition,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<String>(cardId);
    map['status'] = Variable<String>(status);
    map['confidence_level'] = Variable<int>(confidenceLevel);
    if (!nullToAbsent || lastRevisedAt != null) {
      map['last_revised_at'] = Variable<DateTime>(lastRevisedAt);
    }
    if (!nullToAbsent || nextRevisionAt != null) {
      map['next_revision_at'] = Variable<DateTime>(nextRevisionAt);
    }
    if (!nullToAbsent || lastOpenedAt != null) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt);
    }
    map['reading_position'] = Variable<double>(readingPosition);
    return map;
  }

  LearningProgressCompanion toCompanion(bool nullToAbsent) {
    return LearningProgressCompanion(
      cardId: Value(cardId),
      status: Value(status),
      confidenceLevel: Value(confidenceLevel),
      lastRevisedAt: lastRevisedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRevisedAt),
      nextRevisionAt: nextRevisionAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRevisionAt),
      lastOpenedAt: lastOpenedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOpenedAt),
      readingPosition: Value(readingPosition),
    );
  }

  factory LearningProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningProgressData(
      cardId: serializer.fromJson<String>(json['cardId']),
      status: serializer.fromJson<String>(json['status']),
      confidenceLevel: serializer.fromJson<int>(json['confidenceLevel']),
      lastRevisedAt: serializer.fromJson<DateTime?>(json['lastRevisedAt']),
      nextRevisionAt: serializer.fromJson<DateTime?>(json['nextRevisionAt']),
      lastOpenedAt: serializer.fromJson<DateTime?>(json['lastOpenedAt']),
      readingPosition: serializer.fromJson<double>(json['readingPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<String>(cardId),
      'status': serializer.toJson<String>(status),
      'confidenceLevel': serializer.toJson<int>(confidenceLevel),
      'lastRevisedAt': serializer.toJson<DateTime?>(lastRevisedAt),
      'nextRevisionAt': serializer.toJson<DateTime?>(nextRevisionAt),
      'lastOpenedAt': serializer.toJson<DateTime?>(lastOpenedAt),
      'readingPosition': serializer.toJson<double>(readingPosition),
    };
  }

  LearningProgressData copyWith({
    String? cardId,
    String? status,
    int? confidenceLevel,
    Value<DateTime?> lastRevisedAt = const Value.absent(),
    Value<DateTime?> nextRevisionAt = const Value.absent(),
    Value<DateTime?> lastOpenedAt = const Value.absent(),
    double? readingPosition,
  }) => LearningProgressData(
    cardId: cardId ?? this.cardId,
    status: status ?? this.status,
    confidenceLevel: confidenceLevel ?? this.confidenceLevel,
    lastRevisedAt: lastRevisedAt.present
        ? lastRevisedAt.value
        : this.lastRevisedAt,
    nextRevisionAt: nextRevisionAt.present
        ? nextRevisionAt.value
        : this.nextRevisionAt,
    lastOpenedAt: lastOpenedAt.present ? lastOpenedAt.value : this.lastOpenedAt,
    readingPosition: readingPosition ?? this.readingPosition,
  );
  LearningProgressData copyWithCompanion(LearningProgressCompanion data) {
    return LearningProgressData(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      status: data.status.present ? data.status.value : this.status,
      confidenceLevel: data.confidenceLevel.present
          ? data.confidenceLevel.value
          : this.confidenceLevel,
      lastRevisedAt: data.lastRevisedAt.present
          ? data.lastRevisedAt.value
          : this.lastRevisedAt,
      nextRevisionAt: data.nextRevisionAt.present
          ? data.nextRevisionAt.value
          : this.nextRevisionAt,
      lastOpenedAt: data.lastOpenedAt.present
          ? data.lastOpenedAt.value
          : this.lastOpenedAt,
      readingPosition: data.readingPosition.present
          ? data.readingPosition.value
          : this.readingPosition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningProgressData(')
          ..write('cardId: $cardId, ')
          ..write('status: $status, ')
          ..write('confidenceLevel: $confidenceLevel, ')
          ..write('lastRevisedAt: $lastRevisedAt, ')
          ..write('nextRevisionAt: $nextRevisionAt, ')
          ..write('lastOpenedAt: $lastOpenedAt, ')
          ..write('readingPosition: $readingPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cardId,
    status,
    confidenceLevel,
    lastRevisedAt,
    nextRevisionAt,
    lastOpenedAt,
    readingPosition,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningProgressData &&
          other.cardId == this.cardId &&
          other.status == this.status &&
          other.confidenceLevel == this.confidenceLevel &&
          other.lastRevisedAt == this.lastRevisedAt &&
          other.nextRevisionAt == this.nextRevisionAt &&
          other.lastOpenedAt == this.lastOpenedAt &&
          other.readingPosition == this.readingPosition);
}

class LearningProgressCompanion extends UpdateCompanion<LearningProgressData> {
  final Value<String> cardId;
  final Value<String> status;
  final Value<int> confidenceLevel;
  final Value<DateTime?> lastRevisedAt;
  final Value<DateTime?> nextRevisionAt;
  final Value<DateTime?> lastOpenedAt;
  final Value<double> readingPosition;
  final Value<int> rowid;
  const LearningProgressCompanion({
    this.cardId = const Value.absent(),
    this.status = const Value.absent(),
    this.confidenceLevel = const Value.absent(),
    this.lastRevisedAt = const Value.absent(),
    this.nextRevisionAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
    this.readingPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningProgressCompanion.insert({
    required String cardId,
    this.status = const Value.absent(),
    this.confidenceLevel = const Value.absent(),
    this.lastRevisedAt = const Value.absent(),
    this.nextRevisionAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
    this.readingPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardId = Value(cardId);
  static Insertable<LearningProgressData> custom({
    Expression<String>? cardId,
    Expression<String>? status,
    Expression<int>? confidenceLevel,
    Expression<DateTime>? lastRevisedAt,
    Expression<DateTime>? nextRevisionAt,
    Expression<DateTime>? lastOpenedAt,
    Expression<double>? readingPosition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (status != null) 'status': status,
      if (confidenceLevel != null) 'confidence_level': confidenceLevel,
      if (lastRevisedAt != null) 'last_revised_at': lastRevisedAt,
      if (nextRevisionAt != null) 'next_revision_at': nextRevisionAt,
      if (lastOpenedAt != null) 'last_opened_at': lastOpenedAt,
      if (readingPosition != null) 'reading_position': readingPosition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningProgressCompanion copyWith({
    Value<String>? cardId,
    Value<String>? status,
    Value<int>? confidenceLevel,
    Value<DateTime?>? lastRevisedAt,
    Value<DateTime?>? nextRevisionAt,
    Value<DateTime?>? lastOpenedAt,
    Value<double>? readingPosition,
    Value<int>? rowid,
  }) {
    return LearningProgressCompanion(
      cardId: cardId ?? this.cardId,
      status: status ?? this.status,
      confidenceLevel: confidenceLevel ?? this.confidenceLevel,
      lastRevisedAt: lastRevisedAt ?? this.lastRevisedAt,
      nextRevisionAt: nextRevisionAt ?? this.nextRevisionAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
      readingPosition: readingPosition ?? this.readingPosition,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (confidenceLevel.present) {
      map['confidence_level'] = Variable<int>(confidenceLevel.value);
    }
    if (lastRevisedAt.present) {
      map['last_revised_at'] = Variable<DateTime>(lastRevisedAt.value);
    }
    if (nextRevisionAt.present) {
      map['next_revision_at'] = Variable<DateTime>(nextRevisionAt.value);
    }
    if (lastOpenedAt.present) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt.value);
    }
    if (readingPosition.present) {
      map['reading_position'] = Variable<double>(readingPosition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningProgressCompanion(')
          ..write('cardId: $cardId, ')
          ..write('status: $status, ')
          ..write('confidenceLevel: $confidenceLevel, ')
          ..write('lastRevisedAt: $lastRevisedAt, ')
          ..write('nextRevisionAt: $nextRevisionAt, ')
          ..write('lastOpenedAt: $lastOpenedAt, ')
          ..write('readingPosition: $readingPosition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExtractedConceptsTable extends ExtractedConcepts
    with TableInfo<$ExtractedConceptsTable, ExtractedConcept> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExtractedConceptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conceptTypeMeta = const VerificationMeta(
    'conceptType',
  );
  @override
  late final GeneratedColumn<String> conceptType = GeneratedColumn<String>(
    'concept_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('concept'),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardId,
    name,
    conceptType,
    category,
    language,
    confidence,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'extracted_concepts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExtractedConcept> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('concept_type')) {
      context.handle(
        _conceptTypeMeta,
        conceptType.isAcceptableOrUnknown(
          data['concept_type']!,
          _conceptTypeMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExtractedConcept map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExtractedConcept(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      conceptType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept_type'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
    );
  }

  @override
  $ExtractedConceptsTable createAlias(String alias) {
    return $ExtractedConceptsTable(attachedDatabase, alias);
  }
}

class ExtractedConcept extends DataClass
    implements Insertable<ExtractedConcept> {
  final String id;
  final String cardId;
  final String name;
  final String conceptType;
  final String? category;
  final String? language;
  final double confidence;
  const ExtractedConcept({
    required this.id,
    required this.cardId,
    required this.name,
    required this.conceptType,
    this.category,
    this.language,
    required this.confidence,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['card_id'] = Variable<String>(cardId);
    map['name'] = Variable<String>(name);
    map['concept_type'] = Variable<String>(conceptType);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['confidence'] = Variable<double>(confidence);
    return map;
  }

  ExtractedConceptsCompanion toCompanion(bool nullToAbsent) {
    return ExtractedConceptsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      name: Value(name),
      conceptType: Value(conceptType),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      confidence: Value(confidence),
    );
  }

  factory ExtractedConcept.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExtractedConcept(
      id: serializer.fromJson<String>(json['id']),
      cardId: serializer.fromJson<String>(json['cardId']),
      name: serializer.fromJson<String>(json['name']),
      conceptType: serializer.fromJson<String>(json['conceptType']),
      category: serializer.fromJson<String?>(json['category']),
      language: serializer.fromJson<String?>(json['language']),
      confidence: serializer.fromJson<double>(json['confidence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardId': serializer.toJson<String>(cardId),
      'name': serializer.toJson<String>(name),
      'conceptType': serializer.toJson<String>(conceptType),
      'category': serializer.toJson<String?>(category),
      'language': serializer.toJson<String?>(language),
      'confidence': serializer.toJson<double>(confidence),
    };
  }

  ExtractedConcept copyWith({
    String? id,
    String? cardId,
    String? name,
    String? conceptType,
    Value<String?> category = const Value.absent(),
    Value<String?> language = const Value.absent(),
    double? confidence,
  }) => ExtractedConcept(
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    name: name ?? this.name,
    conceptType: conceptType ?? this.conceptType,
    category: category.present ? category.value : this.category,
    language: language.present ? language.value : this.language,
    confidence: confidence ?? this.confidence,
  );
  ExtractedConcept copyWithCompanion(ExtractedConceptsCompanion data) {
    return ExtractedConcept(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      name: data.name.present ? data.name.value : this.name,
      conceptType: data.conceptType.present
          ? data.conceptType.value
          : this.conceptType,
      category: data.category.present ? data.category.value : this.category,
      language: data.language.present ? data.language.value : this.language,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExtractedConcept(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('name: $name, ')
          ..write('conceptType: $conceptType, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('confidence: $confidence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardId,
    name,
    conceptType,
    category,
    language,
    confidence,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExtractedConcept &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.name == this.name &&
          other.conceptType == this.conceptType &&
          other.category == this.category &&
          other.language == this.language &&
          other.confidence == this.confidence);
}

class ExtractedConceptsCompanion extends UpdateCompanion<ExtractedConcept> {
  final Value<String> id;
  final Value<String> cardId;
  final Value<String> name;
  final Value<String> conceptType;
  final Value<String?> category;
  final Value<String?> language;
  final Value<double> confidence;
  final Value<int> rowid;
  const ExtractedConceptsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.name = const Value.absent(),
    this.conceptType = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    this.confidence = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExtractedConceptsCompanion.insert({
    required String id,
    required String cardId,
    required String name,
    this.conceptType = const Value.absent(),
    this.category = const Value.absent(),
    this.language = const Value.absent(),
    required double confidence,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardId = Value(cardId),
       name = Value(name),
       confidence = Value(confidence);
  static Insertable<ExtractedConcept> custom({
    Expression<String>? id,
    Expression<String>? cardId,
    Expression<String>? name,
    Expression<String>? conceptType,
    Expression<String>? category,
    Expression<String>? language,
    Expression<double>? confidence,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (name != null) 'name': name,
      if (conceptType != null) 'concept_type': conceptType,
      if (category != null) 'category': category,
      if (language != null) 'language': language,
      if (confidence != null) 'confidence': confidence,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExtractedConceptsCompanion copyWith({
    Value<String>? id,
    Value<String>? cardId,
    Value<String>? name,
    Value<String>? conceptType,
    Value<String?>? category,
    Value<String?>? language,
    Value<double>? confidence,
    Value<int>? rowid,
  }) {
    return ExtractedConceptsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      name: name ?? this.name,
      conceptType: conceptType ?? this.conceptType,
      category: category ?? this.category,
      language: language ?? this.language,
      confidence: confidence ?? this.confidence,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (conceptType.present) {
      map['concept_type'] = Variable<String>(conceptType.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExtractedConceptsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('name: $name, ')
          ..write('conceptType: $conceptType, ')
          ..write('category: $category, ')
          ..write('language: $language, ')
          ..write('confidence: $confidence, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConceptRelationshipsTable extends ConceptRelationships
    with TableInfo<$ConceptRelationshipsTable, ConceptRelationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConceptRelationshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _targetConceptNameMeta = const VerificationMeta(
    'targetConceptName',
  );
  @override
  late final GeneratedColumn<String> targetConceptName =
      GeneratedColumn<String>(
        'target_concept_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _relationshipTypeMeta = const VerificationMeta(
    'relationshipType',
  );
  @override
  late final GeneratedColumn<String> relationshipType = GeneratedColumn<String>(
    'relationship_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleUsedMeta = const VerificationMeta(
    'ruleUsed',
  );
  @override
  late final GeneratedColumn<String> ruleUsed = GeneratedColumn<String>(
    'rule_used',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardId,
    targetConceptName,
    relationshipType,
    confidence,
    ruleUsed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'concept_relationships';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConceptRelationship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('target_concept_name')) {
      context.handle(
        _targetConceptNameMeta,
        targetConceptName.isAcceptableOrUnknown(
          data['target_concept_name']!,
          _targetConceptNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetConceptNameMeta);
    }
    if (data.containsKey('relationship_type')) {
      context.handle(
        _relationshipTypeMeta,
        relationshipType.isAcceptableOrUnknown(
          data['relationship_type']!,
          _relationshipTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipTypeMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('rule_used')) {
      context.handle(
        _ruleUsedMeta,
        ruleUsed.isAcceptableOrUnknown(data['rule_used']!, _ruleUsedMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleUsedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConceptRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConceptRelationship(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      targetConceptName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_concept_name'],
      )!,
      relationshipType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship_type'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      ruleUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_used'],
      )!,
    );
  }

  @override
  $ConceptRelationshipsTable createAlias(String alias) {
    return $ConceptRelationshipsTable(attachedDatabase, alias);
  }
}

class ConceptRelationship extends DataClass
    implements Insertable<ConceptRelationship> {
  final String id;
  final String cardId;
  final String targetConceptName;
  final String relationshipType;
  final double confidence;
  final String ruleUsed;
  const ConceptRelationship({
    required this.id,
    required this.cardId,
    required this.targetConceptName,
    required this.relationshipType,
    required this.confidence,
    required this.ruleUsed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['card_id'] = Variable<String>(cardId);
    map['target_concept_name'] = Variable<String>(targetConceptName);
    map['relationship_type'] = Variable<String>(relationshipType);
    map['confidence'] = Variable<double>(confidence);
    map['rule_used'] = Variable<String>(ruleUsed);
    return map;
  }

  ConceptRelationshipsCompanion toCompanion(bool nullToAbsent) {
    return ConceptRelationshipsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      targetConceptName: Value(targetConceptName),
      relationshipType: Value(relationshipType),
      confidence: Value(confidence),
      ruleUsed: Value(ruleUsed),
    );
  }

  factory ConceptRelationship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConceptRelationship(
      id: serializer.fromJson<String>(json['id']),
      cardId: serializer.fromJson<String>(json['cardId']),
      targetConceptName: serializer.fromJson<String>(json['targetConceptName']),
      relationshipType: serializer.fromJson<String>(json['relationshipType']),
      confidence: serializer.fromJson<double>(json['confidence']),
      ruleUsed: serializer.fromJson<String>(json['ruleUsed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardId': serializer.toJson<String>(cardId),
      'targetConceptName': serializer.toJson<String>(targetConceptName),
      'relationshipType': serializer.toJson<String>(relationshipType),
      'confidence': serializer.toJson<double>(confidence),
      'ruleUsed': serializer.toJson<String>(ruleUsed),
    };
  }

  ConceptRelationship copyWith({
    String? id,
    String? cardId,
    String? targetConceptName,
    String? relationshipType,
    double? confidence,
    String? ruleUsed,
  }) => ConceptRelationship(
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    targetConceptName: targetConceptName ?? this.targetConceptName,
    relationshipType: relationshipType ?? this.relationshipType,
    confidence: confidence ?? this.confidence,
    ruleUsed: ruleUsed ?? this.ruleUsed,
  );
  ConceptRelationship copyWithCompanion(ConceptRelationshipsCompanion data) {
    return ConceptRelationship(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      targetConceptName: data.targetConceptName.present
          ? data.targetConceptName.value
          : this.targetConceptName,
      relationshipType: data.relationshipType.present
          ? data.relationshipType.value
          : this.relationshipType,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      ruleUsed: data.ruleUsed.present ? data.ruleUsed.value : this.ruleUsed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConceptRelationship(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('targetConceptName: $targetConceptName, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('confidence: $confidence, ')
          ..write('ruleUsed: $ruleUsed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardId,
    targetConceptName,
    relationshipType,
    confidence,
    ruleUsed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConceptRelationship &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.targetConceptName == this.targetConceptName &&
          other.relationshipType == this.relationshipType &&
          other.confidence == this.confidence &&
          other.ruleUsed == this.ruleUsed);
}

class ConceptRelationshipsCompanion
    extends UpdateCompanion<ConceptRelationship> {
  final Value<String> id;
  final Value<String> cardId;
  final Value<String> targetConceptName;
  final Value<String> relationshipType;
  final Value<double> confidence;
  final Value<String> ruleUsed;
  final Value<int> rowid;
  const ConceptRelationshipsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.targetConceptName = const Value.absent(),
    this.relationshipType = const Value.absent(),
    this.confidence = const Value.absent(),
    this.ruleUsed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConceptRelationshipsCompanion.insert({
    required String id,
    required String cardId,
    required String targetConceptName,
    required String relationshipType,
    required double confidence,
    required String ruleUsed,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardId = Value(cardId),
       targetConceptName = Value(targetConceptName),
       relationshipType = Value(relationshipType),
       confidence = Value(confidence),
       ruleUsed = Value(ruleUsed);
  static Insertable<ConceptRelationship> custom({
    Expression<String>? id,
    Expression<String>? cardId,
    Expression<String>? targetConceptName,
    Expression<String>? relationshipType,
    Expression<double>? confidence,
    Expression<String>? ruleUsed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (targetConceptName != null) 'target_concept_name': targetConceptName,
      if (relationshipType != null) 'relationship_type': relationshipType,
      if (confidence != null) 'confidence': confidence,
      if (ruleUsed != null) 'rule_used': ruleUsed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConceptRelationshipsCompanion copyWith({
    Value<String>? id,
    Value<String>? cardId,
    Value<String>? targetConceptName,
    Value<String>? relationshipType,
    Value<double>? confidence,
    Value<String>? ruleUsed,
    Value<int>? rowid,
  }) {
    return ConceptRelationshipsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      targetConceptName: targetConceptName ?? this.targetConceptName,
      relationshipType: relationshipType ?? this.relationshipType,
      confidence: confidence ?? this.confidence,
      ruleUsed: ruleUsed ?? this.ruleUsed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (targetConceptName.present) {
      map['target_concept_name'] = Variable<String>(targetConceptName.value);
    }
    if (relationshipType.present) {
      map['relationship_type'] = Variable<String>(relationshipType.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (ruleUsed.present) {
      map['rule_used'] = Variable<String>(ruleUsed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConceptRelationshipsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('targetConceptName: $targetConceptName, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('confidence: $confidence, ')
          ..write('ruleUsed: $ruleUsed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SemanticElementsTable extends SemanticElements
    with TableInfo<$SemanticElementsTable, SemanticElement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SemanticElementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _blockIdMeta = const VerificationMeta(
    'blockId',
  );
  @override
  late final GeneratedColumn<String> blockId = GeneratedColumn<String>(
    'block_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elementTypeMeta = const VerificationMeta(
    'elementType',
  );
  @override
  late final GeneratedColumn<String> elementType = GeneratedColumn<String>(
    'element_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentSummaryMeta = const VerificationMeta(
    'contentSummary',
  );
  @override
  late final GeneratedColumn<String> contentSummary = GeneratedColumn<String>(
    'content_summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleUsedMeta = const VerificationMeta(
    'ruleUsed',
  );
  @override
  late final GeneratedColumn<String> ruleUsed = GeneratedColumn<String>(
    'rule_used',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardId,
    blockId,
    elementType,
    contentSummary,
    confidence,
    ruleUsed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'semantic_elements';
  @override
  VerificationContext validateIntegrity(
    Insertable<SemanticElement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('block_id')) {
      context.handle(
        _blockIdMeta,
        blockId.isAcceptableOrUnknown(data['block_id']!, _blockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_blockIdMeta);
    }
    if (data.containsKey('element_type')) {
      context.handle(
        _elementTypeMeta,
        elementType.isAcceptableOrUnknown(
          data['element_type']!,
          _elementTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_elementTypeMeta);
    }
    if (data.containsKey('content_summary')) {
      context.handle(
        _contentSummaryMeta,
        contentSummary.isAcceptableOrUnknown(
          data['content_summary']!,
          _contentSummaryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentSummaryMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('rule_used')) {
      context.handle(
        _ruleUsedMeta,
        ruleUsed.isAcceptableOrUnknown(data['rule_used']!, _ruleUsedMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleUsedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SemanticElement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemanticElement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      blockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block_id'],
      )!,
      elementType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}element_type'],
      )!,
      contentSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_summary'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      ruleUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_used'],
      )!,
    );
  }

  @override
  $SemanticElementsTable createAlias(String alias) {
    return $SemanticElementsTable(attachedDatabase, alias);
  }
}

class SemanticElement extends DataClass implements Insertable<SemanticElement> {
  final String id;
  final String cardId;
  final String blockId;
  final String elementType;
  final String contentSummary;
  final double confidence;
  final String ruleUsed;
  const SemanticElement({
    required this.id,
    required this.cardId,
    required this.blockId,
    required this.elementType,
    required this.contentSummary,
    required this.confidence,
    required this.ruleUsed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['card_id'] = Variable<String>(cardId);
    map['block_id'] = Variable<String>(blockId);
    map['element_type'] = Variable<String>(elementType);
    map['content_summary'] = Variable<String>(contentSummary);
    map['confidence'] = Variable<double>(confidence);
    map['rule_used'] = Variable<String>(ruleUsed);
    return map;
  }

  SemanticElementsCompanion toCompanion(bool nullToAbsent) {
    return SemanticElementsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      blockId: Value(blockId),
      elementType: Value(elementType),
      contentSummary: Value(contentSummary),
      confidence: Value(confidence),
      ruleUsed: Value(ruleUsed),
    );
  }

  factory SemanticElement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemanticElement(
      id: serializer.fromJson<String>(json['id']),
      cardId: serializer.fromJson<String>(json['cardId']),
      blockId: serializer.fromJson<String>(json['blockId']),
      elementType: serializer.fromJson<String>(json['elementType']),
      contentSummary: serializer.fromJson<String>(json['contentSummary']),
      confidence: serializer.fromJson<double>(json['confidence']),
      ruleUsed: serializer.fromJson<String>(json['ruleUsed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardId': serializer.toJson<String>(cardId),
      'blockId': serializer.toJson<String>(blockId),
      'elementType': serializer.toJson<String>(elementType),
      'contentSummary': serializer.toJson<String>(contentSummary),
      'confidence': serializer.toJson<double>(confidence),
      'ruleUsed': serializer.toJson<String>(ruleUsed),
    };
  }

  SemanticElement copyWith({
    String? id,
    String? cardId,
    String? blockId,
    String? elementType,
    String? contentSummary,
    double? confidence,
    String? ruleUsed,
  }) => SemanticElement(
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    blockId: blockId ?? this.blockId,
    elementType: elementType ?? this.elementType,
    contentSummary: contentSummary ?? this.contentSummary,
    confidence: confidence ?? this.confidence,
    ruleUsed: ruleUsed ?? this.ruleUsed,
  );
  SemanticElement copyWithCompanion(SemanticElementsCompanion data) {
    return SemanticElement(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      blockId: data.blockId.present ? data.blockId.value : this.blockId,
      elementType: data.elementType.present
          ? data.elementType.value
          : this.elementType,
      contentSummary: data.contentSummary.present
          ? data.contentSummary.value
          : this.contentSummary,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      ruleUsed: data.ruleUsed.present ? data.ruleUsed.value : this.ruleUsed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SemanticElement(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('blockId: $blockId, ')
          ..write('elementType: $elementType, ')
          ..write('contentSummary: $contentSummary, ')
          ..write('confidence: $confidence, ')
          ..write('ruleUsed: $ruleUsed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardId,
    blockId,
    elementType,
    contentSummary,
    confidence,
    ruleUsed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SemanticElement &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.blockId == this.blockId &&
          other.elementType == this.elementType &&
          other.contentSummary == this.contentSummary &&
          other.confidence == this.confidence &&
          other.ruleUsed == this.ruleUsed);
}

class SemanticElementsCompanion extends UpdateCompanion<SemanticElement> {
  final Value<String> id;
  final Value<String> cardId;
  final Value<String> blockId;
  final Value<String> elementType;
  final Value<String> contentSummary;
  final Value<double> confidence;
  final Value<String> ruleUsed;
  final Value<int> rowid;
  const SemanticElementsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.blockId = const Value.absent(),
    this.elementType = const Value.absent(),
    this.contentSummary = const Value.absent(),
    this.confidence = const Value.absent(),
    this.ruleUsed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SemanticElementsCompanion.insert({
    required String id,
    required String cardId,
    required String blockId,
    required String elementType,
    required String contentSummary,
    required double confidence,
    required String ruleUsed,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardId = Value(cardId),
       blockId = Value(blockId),
       elementType = Value(elementType),
       contentSummary = Value(contentSummary),
       confidence = Value(confidence),
       ruleUsed = Value(ruleUsed);
  static Insertable<SemanticElement> custom({
    Expression<String>? id,
    Expression<String>? cardId,
    Expression<String>? blockId,
    Expression<String>? elementType,
    Expression<String>? contentSummary,
    Expression<double>? confidence,
    Expression<String>? ruleUsed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (blockId != null) 'block_id': blockId,
      if (elementType != null) 'element_type': elementType,
      if (contentSummary != null) 'content_summary': contentSummary,
      if (confidence != null) 'confidence': confidence,
      if (ruleUsed != null) 'rule_used': ruleUsed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SemanticElementsCompanion copyWith({
    Value<String>? id,
    Value<String>? cardId,
    Value<String>? blockId,
    Value<String>? elementType,
    Value<String>? contentSummary,
    Value<double>? confidence,
    Value<String>? ruleUsed,
    Value<int>? rowid,
  }) {
    return SemanticElementsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      blockId: blockId ?? this.blockId,
      elementType: elementType ?? this.elementType,
      contentSummary: contentSummary ?? this.contentSummary,
      confidence: confidence ?? this.confidence,
      ruleUsed: ruleUsed ?? this.ruleUsed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (blockId.present) {
      map['block_id'] = Variable<String>(blockId.value);
    }
    if (elementType.present) {
      map['element_type'] = Variable<String>(elementType.value);
    }
    if (contentSummary.present) {
      map['content_summary'] = Variable<String>(contentSummary.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (ruleUsed.present) {
      map['rule_used'] = Variable<String>(ruleUsed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemanticElementsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('blockId: $blockId, ')
          ..write('elementType: $elementType, ')
          ..write('contentSummary: $contentSummary, ')
          ..write('confidence: $confidence, ')
          ..write('ruleUsed: $ruleUsed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProblemsTable extends Problems with TableInfo<$ProblemsTable, Problem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformMeta = const VerificationMeta(
    'platform',
  );
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
    'platform',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedTimeMinutesMeta =
      const VerificationMeta('estimatedTimeMinutes');
  @override
  late final GeneratedColumn<int> estimatedTimeMinutes = GeneratedColumn<int>(
    'estimated_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<double> frequency = GeneratedColumn<double>(
    'frequency',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    platform,
    difficulty,
    sourceUrl,
    estimatedTimeMinutes,
    frequency,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problems';
  @override
  VerificationContext validateIntegrity(
    Insertable<Problem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('platform')) {
      context.handle(
        _platformMeta,
        platform.isAcceptableOrUnknown(data['platform']!, _platformMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    }
    if (data.containsKey('estimated_time_minutes')) {
      context.handle(
        _estimatedTimeMinutesMeta,
        estimatedTimeMinutes.isAcceptableOrUnknown(
          data['estimated_time_minutes']!,
          _estimatedTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Problem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Problem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      platform: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}platform'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      ),
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      ),
      estimatedTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_time_minutes'],
      ),
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frequency'],
      ),
    );
  }

  @override
  $ProblemsTable createAlias(String alias) {
    return $ProblemsTable(attachedDatabase, alias);
  }
}

class Problem extends DataClass implements Insertable<Problem> {
  final String id;
  final String title;
  final String? platform;
  final String? difficulty;
  final String? sourceUrl;
  final int? estimatedTimeMinutes;
  final double? frequency;
  const Problem({
    required this.id,
    required this.title,
    this.platform,
    this.difficulty,
    this.sourceUrl,
    this.estimatedTimeMinutes,
    this.frequency,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String>(difficulty);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || estimatedTimeMinutes != null) {
      map['estimated_time_minutes'] = Variable<int>(estimatedTimeMinutes);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<double>(frequency);
    }
    return map;
  }

  ProblemsCompanion toCompanion(bool nullToAbsent) {
    return ProblemsCompanion(
      id: Value(id),
      title: Value(title),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      estimatedTimeMinutes: estimatedTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedTimeMinutes),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
    );
  }

  factory Problem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Problem(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      platform: serializer.fromJson<String?>(json['platform']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      estimatedTimeMinutes: serializer.fromJson<int?>(
        json['estimatedTimeMinutes'],
      ),
      frequency: serializer.fromJson<double?>(json['frequency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'platform': serializer.toJson<String?>(platform),
      'difficulty': serializer.toJson<String?>(difficulty),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'estimatedTimeMinutes': serializer.toJson<int?>(estimatedTimeMinutes),
      'frequency': serializer.toJson<double?>(frequency),
    };
  }

  Problem copyWith({
    String? id,
    String? title,
    Value<String?> platform = const Value.absent(),
    Value<String?> difficulty = const Value.absent(),
    Value<String?> sourceUrl = const Value.absent(),
    Value<int?> estimatedTimeMinutes = const Value.absent(),
    Value<double?> frequency = const Value.absent(),
  }) => Problem(
    id: id ?? this.id,
    title: title ?? this.title,
    platform: platform.present ? platform.value : this.platform,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
    estimatedTimeMinutes: estimatedTimeMinutes.present
        ? estimatedTimeMinutes.value
        : this.estimatedTimeMinutes,
    frequency: frequency.present ? frequency.value : this.frequency,
  );
  Problem copyWithCompanion(ProblemsCompanion data) {
    return Problem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      platform: data.platform.present ? data.platform.value : this.platform,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      estimatedTimeMinutes: data.estimatedTimeMinutes.present
          ? data.estimatedTimeMinutes.value
          : this.estimatedTimeMinutes,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Problem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('platform: $platform, ')
          ..write('difficulty: $difficulty, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('estimatedTimeMinutes: $estimatedTimeMinutes, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    platform,
    difficulty,
    sourceUrl,
    estimatedTimeMinutes,
    frequency,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Problem &&
          other.id == this.id &&
          other.title == this.title &&
          other.platform == this.platform &&
          other.difficulty == this.difficulty &&
          other.sourceUrl == this.sourceUrl &&
          other.estimatedTimeMinutes == this.estimatedTimeMinutes &&
          other.frequency == this.frequency);
}

class ProblemsCompanion extends UpdateCompanion<Problem> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> platform;
  final Value<String?> difficulty;
  final Value<String?> sourceUrl;
  final Value<int?> estimatedTimeMinutes;
  final Value<double?> frequency;
  final Value<int> rowid;
  const ProblemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.platform = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.estimatedTimeMinutes = const Value.absent(),
    this.frequency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProblemsCompanion.insert({
    required String id,
    required String title,
    this.platform = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.estimatedTimeMinutes = const Value.absent(),
    this.frequency = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<Problem> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? platform,
    Expression<String>? difficulty,
    Expression<String>? sourceUrl,
    Expression<int>? estimatedTimeMinutes,
    Expression<double>? frequency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (platform != null) 'platform': platform,
      if (difficulty != null) 'difficulty': difficulty,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (estimatedTimeMinutes != null)
        'estimated_time_minutes': estimatedTimeMinutes,
      if (frequency != null) 'frequency': frequency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProblemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? platform,
    Value<String?>? difficulty,
    Value<String?>? sourceUrl,
    Value<int?>? estimatedTimeMinutes,
    Value<double?>? frequency,
    Value<int>? rowid,
  }) {
    return ProblemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      platform: platform ?? this.platform,
      difficulty: difficulty ?? this.difficulty,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      estimatedTimeMinutes: estimatedTimeMinutes ?? this.estimatedTimeMinutes,
      frequency: frequency ?? this.frequency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (estimatedTimeMinutes.present) {
      map['estimated_time_minutes'] = Variable<int>(estimatedTimeMinutes.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<double>(frequency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('platform: $platform, ')
          ..write('difficulty: $difficulty, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('estimatedTimeMinutes: $estimatedTimeMinutes, ')
          ..write('frequency: $frequency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProblemConceptLinksTable extends ProblemConceptLinks
    with TableInfo<$ProblemConceptLinksTable, ProblemConceptLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemConceptLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<String> problemId = GeneratedColumn<String>(
    'problem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES problems (id)',
    ),
  );
  static const VerificationMeta _conceptNameMeta = const VerificationMeta(
    'conceptName',
  );
  @override
  late final GeneratedColumn<String> conceptName = GeneratedColumn<String>(
    'concept_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [problemId, conceptName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problem_concept_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProblemConceptLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('problem_id')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problem_id']!, _problemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_problemIdMeta);
    }
    if (data.containsKey('concept_name')) {
      context.handle(
        _conceptNameMeta,
        conceptName.isAcceptableOrUnknown(
          data['concept_name']!,
          _conceptNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conceptNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {problemId, conceptName};
  @override
  ProblemConceptLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProblemConceptLink(
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}problem_id'],
      )!,
      conceptName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept_name'],
      )!,
    );
  }

  @override
  $ProblemConceptLinksTable createAlias(String alias) {
    return $ProblemConceptLinksTable(attachedDatabase, alias);
  }
}

class ProblemConceptLink extends DataClass
    implements Insertable<ProblemConceptLink> {
  final String problemId;
  final String conceptName;
  const ProblemConceptLink({
    required this.problemId,
    required this.conceptName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['problem_id'] = Variable<String>(problemId);
    map['concept_name'] = Variable<String>(conceptName);
    return map;
  }

  ProblemConceptLinksCompanion toCompanion(bool nullToAbsent) {
    return ProblemConceptLinksCompanion(
      problemId: Value(problemId),
      conceptName: Value(conceptName),
    );
  }

  factory ProblemConceptLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProblemConceptLink(
      problemId: serializer.fromJson<String>(json['problemId']),
      conceptName: serializer.fromJson<String>(json['conceptName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'problemId': serializer.toJson<String>(problemId),
      'conceptName': serializer.toJson<String>(conceptName),
    };
  }

  ProblemConceptLink copyWith({String? problemId, String? conceptName}) =>
      ProblemConceptLink(
        problemId: problemId ?? this.problemId,
        conceptName: conceptName ?? this.conceptName,
      );
  ProblemConceptLink copyWithCompanion(ProblemConceptLinksCompanion data) {
    return ProblemConceptLink(
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      conceptName: data.conceptName.present
          ? data.conceptName.value
          : this.conceptName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProblemConceptLink(')
          ..write('problemId: $problemId, ')
          ..write('conceptName: $conceptName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(problemId, conceptName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProblemConceptLink &&
          other.problemId == this.problemId &&
          other.conceptName == this.conceptName);
}

class ProblemConceptLinksCompanion extends UpdateCompanion<ProblemConceptLink> {
  final Value<String> problemId;
  final Value<String> conceptName;
  final Value<int> rowid;
  const ProblemConceptLinksCompanion({
    this.problemId = const Value.absent(),
    this.conceptName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProblemConceptLinksCompanion.insert({
    required String problemId,
    required String conceptName,
    this.rowid = const Value.absent(),
  }) : problemId = Value(problemId),
       conceptName = Value(conceptName);
  static Insertable<ProblemConceptLink> custom({
    Expression<String>? problemId,
    Expression<String>? conceptName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (problemId != null) 'problem_id': problemId,
      if (conceptName != null) 'concept_name': conceptName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProblemConceptLinksCompanion copyWith({
    Value<String>? problemId,
    Value<String>? conceptName,
    Value<int>? rowid,
  }) {
    return ProblemConceptLinksCompanion(
      problemId: problemId ?? this.problemId,
      conceptName: conceptName ?? this.conceptName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (problemId.present) {
      map['problem_id'] = Variable<String>(problemId.value);
    }
    if (conceptName.present) {
      map['concept_name'] = Variable<String>(conceptName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemConceptLinksCompanion(')
          ..write('problemId: $problemId, ')
          ..write('conceptName: $conceptName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProblemProgressTable extends ProblemProgress
    with TableInfo<$ProblemProgressTable, ProblemProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<String> problemId = GeneratedColumn<String>(
    'problem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES problems (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('not_attempted'),
  );
  static const VerificationMeta _confidenceLevelMeta = const VerificationMeta(
    'confidenceLevel',
  );
  @override
  late final GeneratedColumn<int> confidenceLevel = GeneratedColumn<int>(
    'confidence_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptedAtMeta = const VerificationMeta(
    'lastAttemptedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptedAt =
      GeneratedColumn<DateTime>(
        'last_attempted_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _nextRevisionAtMeta = const VerificationMeta(
    'nextRevisionAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRevisionAt =
      GeneratedColumn<DateTime>(
        'next_revision_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    problemId,
    status,
    confidenceLevel,
    lastAttemptedAt,
    nextRevisionAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problem_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProblemProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('problem_id')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problem_id']!, _problemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_problemIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('confidence_level')) {
      context.handle(
        _confidenceLevelMeta,
        confidenceLevel.isAcceptableOrUnknown(
          data['confidence_level']!,
          _confidenceLevelMeta,
        ),
      );
    }
    if (data.containsKey('last_attempted_at')) {
      context.handle(
        _lastAttemptedAtMeta,
        lastAttemptedAt.isAcceptableOrUnknown(
          data['last_attempted_at']!,
          _lastAttemptedAtMeta,
        ),
      );
    }
    if (data.containsKey('next_revision_at')) {
      context.handle(
        _nextRevisionAtMeta,
        nextRevisionAt.isAcceptableOrUnknown(
          data['next_revision_at']!,
          _nextRevisionAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {problemId};
  @override
  ProblemProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProblemProgressData(
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}problem_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      confidenceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence_level'],
      )!,
      lastAttemptedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempted_at'],
      ),
      nextRevisionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_revision_at'],
      ),
    );
  }

  @override
  $ProblemProgressTable createAlias(String alias) {
    return $ProblemProgressTable(attachedDatabase, alias);
  }
}

class ProblemProgressData extends DataClass
    implements Insertable<ProblemProgressData> {
  final String problemId;
  final String status;
  final int confidenceLevel;
  final DateTime? lastAttemptedAt;
  final DateTime? nextRevisionAt;
  const ProblemProgressData({
    required this.problemId,
    required this.status,
    required this.confidenceLevel,
    this.lastAttemptedAt,
    this.nextRevisionAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['problem_id'] = Variable<String>(problemId);
    map['status'] = Variable<String>(status);
    map['confidence_level'] = Variable<int>(confidenceLevel);
    if (!nullToAbsent || lastAttemptedAt != null) {
      map['last_attempted_at'] = Variable<DateTime>(lastAttemptedAt);
    }
    if (!nullToAbsent || nextRevisionAt != null) {
      map['next_revision_at'] = Variable<DateTime>(nextRevisionAt);
    }
    return map;
  }

  ProblemProgressCompanion toCompanion(bool nullToAbsent) {
    return ProblemProgressCompanion(
      problemId: Value(problemId),
      status: Value(status),
      confidenceLevel: Value(confidenceLevel),
      lastAttemptedAt: lastAttemptedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptedAt),
      nextRevisionAt: nextRevisionAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRevisionAt),
    );
  }

  factory ProblemProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProblemProgressData(
      problemId: serializer.fromJson<String>(json['problemId']),
      status: serializer.fromJson<String>(json['status']),
      confidenceLevel: serializer.fromJson<int>(json['confidenceLevel']),
      lastAttemptedAt: serializer.fromJson<DateTime?>(json['lastAttemptedAt']),
      nextRevisionAt: serializer.fromJson<DateTime?>(json['nextRevisionAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'problemId': serializer.toJson<String>(problemId),
      'status': serializer.toJson<String>(status),
      'confidenceLevel': serializer.toJson<int>(confidenceLevel),
      'lastAttemptedAt': serializer.toJson<DateTime?>(lastAttemptedAt),
      'nextRevisionAt': serializer.toJson<DateTime?>(nextRevisionAt),
    };
  }

  ProblemProgressData copyWith({
    String? problemId,
    String? status,
    int? confidenceLevel,
    Value<DateTime?> lastAttemptedAt = const Value.absent(),
    Value<DateTime?> nextRevisionAt = const Value.absent(),
  }) => ProblemProgressData(
    problemId: problemId ?? this.problemId,
    status: status ?? this.status,
    confidenceLevel: confidenceLevel ?? this.confidenceLevel,
    lastAttemptedAt: lastAttemptedAt.present
        ? lastAttemptedAt.value
        : this.lastAttemptedAt,
    nextRevisionAt: nextRevisionAt.present
        ? nextRevisionAt.value
        : this.nextRevisionAt,
  );
  ProblemProgressData copyWithCompanion(ProblemProgressCompanion data) {
    return ProblemProgressData(
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      status: data.status.present ? data.status.value : this.status,
      confidenceLevel: data.confidenceLevel.present
          ? data.confidenceLevel.value
          : this.confidenceLevel,
      lastAttemptedAt: data.lastAttemptedAt.present
          ? data.lastAttemptedAt.value
          : this.lastAttemptedAt,
      nextRevisionAt: data.nextRevisionAt.present
          ? data.nextRevisionAt.value
          : this.nextRevisionAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProblemProgressData(')
          ..write('problemId: $problemId, ')
          ..write('status: $status, ')
          ..write('confidenceLevel: $confidenceLevel, ')
          ..write('lastAttemptedAt: $lastAttemptedAt, ')
          ..write('nextRevisionAt: $nextRevisionAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    problemId,
    status,
    confidenceLevel,
    lastAttemptedAt,
    nextRevisionAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProblemProgressData &&
          other.problemId == this.problemId &&
          other.status == this.status &&
          other.confidenceLevel == this.confidenceLevel &&
          other.lastAttemptedAt == this.lastAttemptedAt &&
          other.nextRevisionAt == this.nextRevisionAt);
}

class ProblemProgressCompanion extends UpdateCompanion<ProblemProgressData> {
  final Value<String> problemId;
  final Value<String> status;
  final Value<int> confidenceLevel;
  final Value<DateTime?> lastAttemptedAt;
  final Value<DateTime?> nextRevisionAt;
  final Value<int> rowid;
  const ProblemProgressCompanion({
    this.problemId = const Value.absent(),
    this.status = const Value.absent(),
    this.confidenceLevel = const Value.absent(),
    this.lastAttemptedAt = const Value.absent(),
    this.nextRevisionAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProblemProgressCompanion.insert({
    required String problemId,
    this.status = const Value.absent(),
    this.confidenceLevel = const Value.absent(),
    this.lastAttemptedAt = const Value.absent(),
    this.nextRevisionAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : problemId = Value(problemId);
  static Insertable<ProblemProgressData> custom({
    Expression<String>? problemId,
    Expression<String>? status,
    Expression<int>? confidenceLevel,
    Expression<DateTime>? lastAttemptedAt,
    Expression<DateTime>? nextRevisionAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (problemId != null) 'problem_id': problemId,
      if (status != null) 'status': status,
      if (confidenceLevel != null) 'confidence_level': confidenceLevel,
      if (lastAttemptedAt != null) 'last_attempted_at': lastAttemptedAt,
      if (nextRevisionAt != null) 'next_revision_at': nextRevisionAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProblemProgressCompanion copyWith({
    Value<String>? problemId,
    Value<String>? status,
    Value<int>? confidenceLevel,
    Value<DateTime?>? lastAttemptedAt,
    Value<DateTime?>? nextRevisionAt,
    Value<int>? rowid,
  }) {
    return ProblemProgressCompanion(
      problemId: problemId ?? this.problemId,
      status: status ?? this.status,
      confidenceLevel: confidenceLevel ?? this.confidenceLevel,
      lastAttemptedAt: lastAttemptedAt ?? this.lastAttemptedAt,
      nextRevisionAt: nextRevisionAt ?? this.nextRevisionAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (problemId.present) {
      map['problem_id'] = Variable<String>(problemId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (confidenceLevel.present) {
      map['confidence_level'] = Variable<int>(confidenceLevel.value);
    }
    if (lastAttemptedAt.present) {
      map['last_attempted_at'] = Variable<DateTime>(lastAttemptedAt.value);
    }
    if (nextRevisionAt.present) {
      map['next_revision_at'] = Variable<DateTime>(nextRevisionAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemProgressCompanion(')
          ..write('problemId: $problemId, ')
          ..write('status: $status, ')
          ..write('confidenceLevel: $confidenceLevel, ')
          ..write('lastAttemptedAt: $lastAttemptedAt, ')
          ..write('nextRevisionAt: $nextRevisionAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoadmapsTable extends Roadmaps with TableInfo<$RoadmapsTable, Roadmap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roadmapTypeMeta = const VerificationMeta(
    'roadmapType',
  );
  @override
  late final GeneratedColumn<String> roadmapType = GeneratedColumn<String>(
    'roadmap_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('curated'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    roadmapType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmaps';
  @override
  VerificationContext validateIntegrity(
    Insertable<Roadmap> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('roadmap_type')) {
      context.handle(
        _roadmapTypeMeta,
        roadmapType.isAcceptableOrUnknown(
          data['roadmap_type']!,
          _roadmapTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Roadmap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Roadmap(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      roadmapType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_type'],
      )!,
    );
  }

  @override
  $RoadmapsTable createAlias(String alias) {
    return $RoadmapsTable(attachedDatabase, alias);
  }
}

class Roadmap extends DataClass implements Insertable<Roadmap> {
  final String id;
  final String title;
  final String? description;
  final String? category;
  final String roadmapType;
  const Roadmap({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.roadmapType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['roadmap_type'] = Variable<String>(roadmapType);
    return map;
  }

  RoadmapsCompanion toCompanion(bool nullToAbsent) {
    return RoadmapsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      roadmapType: Value(roadmapType),
    );
  }

  factory Roadmap.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Roadmap(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String?>(json['category']),
      roadmapType: serializer.fromJson<String>(json['roadmapType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String?>(category),
      'roadmapType': serializer.toJson<String>(roadmapType),
    };
  }

  Roadmap copyWith({
    String? id,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> category = const Value.absent(),
    String? roadmapType,
  }) => Roadmap(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    category: category.present ? category.value : this.category,
    roadmapType: roadmapType ?? this.roadmapType,
  );
  Roadmap copyWithCompanion(RoadmapsCompanion data) {
    return Roadmap(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      roadmapType: data.roadmapType.present
          ? data.roadmapType.value
          : this.roadmapType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Roadmap(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('roadmapType: $roadmapType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, category, roadmapType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Roadmap &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.roadmapType == this.roadmapType);
}

class RoadmapsCompanion extends UpdateCompanion<Roadmap> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> category;
  final Value<String> roadmapType;
  final Value<int> rowid;
  const RoadmapsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.roadmapType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.roadmapType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<Roadmap> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? roadmapType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (roadmapType != null) 'roadmap_type': roadmapType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? category,
    Value<String>? roadmapType,
    Value<int>? rowid,
  }) {
    return RoadmapsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      roadmapType: roadmapType ?? this.roadmapType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (roadmapType.present) {
      map['roadmap_type'] = Variable<String>(roadmapType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('roadmapType: $roadmapType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoadmapModulesTable extends RoadmapModules
    with TableInfo<$RoadmapModulesTable, RoadmapModule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapModulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moduleTypeMeta = const VerificationMeta(
    'moduleType',
  );
  @override
  late final GeneratedColumn<String> moduleType = GeneratedColumn<String>(
    'module_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('core'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roadmapId,
    title,
    orderIndex,
    moduleType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmap_modules';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoadmapModule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('module_type')) {
      context.handle(
        _moduleTypeMeta,
        moduleType.isAcceptableOrUnknown(data['module_type']!, _moduleTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoadmapModule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoadmapModule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      moduleType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_type'],
      )!,
    );
  }

  @override
  $RoadmapModulesTable createAlias(String alias) {
    return $RoadmapModulesTable(attachedDatabase, alias);
  }
}

class RoadmapModule extends DataClass implements Insertable<RoadmapModule> {
  final String id;
  final String roadmapId;
  final String title;
  final int orderIndex;
  final String moduleType;
  const RoadmapModule({
    required this.id,
    required this.roadmapId,
    required this.title,
    required this.orderIndex,
    required this.moduleType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roadmap_id'] = Variable<String>(roadmapId);
    map['title'] = Variable<String>(title);
    map['order_index'] = Variable<int>(orderIndex);
    map['module_type'] = Variable<String>(moduleType);
    return map;
  }

  RoadmapModulesCompanion toCompanion(bool nullToAbsent) {
    return RoadmapModulesCompanion(
      id: Value(id),
      roadmapId: Value(roadmapId),
      title: Value(title),
      orderIndex: Value(orderIndex),
      moduleType: Value(moduleType),
    );
  }

  factory RoadmapModule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoadmapModule(
      id: serializer.fromJson<String>(json['id']),
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      title: serializer.fromJson<String>(json['title']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      moduleType: serializer.fromJson<String>(json['moduleType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roadmapId': serializer.toJson<String>(roadmapId),
      'title': serializer.toJson<String>(title),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'moduleType': serializer.toJson<String>(moduleType),
    };
  }

  RoadmapModule copyWith({
    String? id,
    String? roadmapId,
    String? title,
    int? orderIndex,
    String? moduleType,
  }) => RoadmapModule(
    id: id ?? this.id,
    roadmapId: roadmapId ?? this.roadmapId,
    title: title ?? this.title,
    orderIndex: orderIndex ?? this.orderIndex,
    moduleType: moduleType ?? this.moduleType,
  );
  RoadmapModule copyWithCompanion(RoadmapModulesCompanion data) {
    return RoadmapModule(
      id: data.id.present ? data.id.value : this.id,
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      title: data.title.present ? data.title.value : this.title,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      moduleType: data.moduleType.present
          ? data.moduleType.value
          : this.moduleType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapModule(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('moduleType: $moduleType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roadmapId, title, orderIndex, moduleType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoadmapModule &&
          other.id == this.id &&
          other.roadmapId == this.roadmapId &&
          other.title == this.title &&
          other.orderIndex == this.orderIndex &&
          other.moduleType == this.moduleType);
}

class RoadmapModulesCompanion extends UpdateCompanion<RoadmapModule> {
  final Value<String> id;
  final Value<String> roadmapId;
  final Value<String> title;
  final Value<int> orderIndex;
  final Value<String> moduleType;
  final Value<int> rowid;
  const RoadmapModulesCompanion({
    this.id = const Value.absent(),
    this.roadmapId = const Value.absent(),
    this.title = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.moduleType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapModulesCompanion.insert({
    required String id,
    required String roadmapId,
    required String title,
    required int orderIndex,
    this.moduleType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roadmapId = Value(roadmapId),
       title = Value(title),
       orderIndex = Value(orderIndex);
  static Insertable<RoadmapModule> custom({
    Expression<String>? id,
    Expression<String>? roadmapId,
    Expression<String>? title,
    Expression<int>? orderIndex,
    Expression<String>? moduleType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (title != null) 'title': title,
      if (orderIndex != null) 'order_index': orderIndex,
      if (moduleType != null) 'module_type': moduleType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapModulesCompanion copyWith({
    Value<String>? id,
    Value<String>? roadmapId,
    Value<String>? title,
    Value<int>? orderIndex,
    Value<String>? moduleType,
    Value<int>? rowid,
  }) {
    return RoadmapModulesCompanion(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      title: title ?? this.title,
      orderIndex: orderIndex ?? this.orderIndex,
      moduleType: moduleType ?? this.moduleType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (moduleType.present) {
      map['module_type'] = Variable<String>(moduleType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapModulesCompanion(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('moduleType: $moduleType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoadmapNodesTable extends RoadmapNodes
    with TableInfo<$RoadmapNodesTable, RoadmapNode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapNodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moduleIdMeta = const VerificationMeta(
    'moduleId',
  );
  @override
  late final GeneratedColumn<String> moduleId = GeneratedColumn<String>(
    'module_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmap_modules (id)',
    ),
  );
  static const VerificationMeta _conceptNameMeta = const VerificationMeta(
    'conceptName',
  );
  @override
  late final GeneratedColumn<String> conceptName = GeneratedColumn<String>(
    'concept_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkedCardIdMeta = const VerificationMeta(
    'linkedCardId',
  );
  @override
  late final GeneratedColumn<String> linkedCardId = GeneratedColumn<String>(
    'linked_card_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES knowledge_cards (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCheckpointMeta = const VerificationMeta(
    'isCheckpoint',
  );
  @override
  late final GeneratedColumn<bool> isCheckpoint = GeneratedColumn<bool>(
    'is_checkpoint',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_checkpoint" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    moduleId,
    conceptName,
    linkedCardId,
    orderIndex,
    isCheckpoint,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmap_nodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoadmapNode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('module_id')) {
      context.handle(
        _moduleIdMeta,
        moduleId.isAcceptableOrUnknown(data['module_id']!, _moduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_moduleIdMeta);
    }
    if (data.containsKey('concept_name')) {
      context.handle(
        _conceptNameMeta,
        conceptName.isAcceptableOrUnknown(
          data['concept_name']!,
          _conceptNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conceptNameMeta);
    }
    if (data.containsKey('linked_card_id')) {
      context.handle(
        _linkedCardIdMeta,
        linkedCardId.isAcceptableOrUnknown(
          data['linked_card_id']!,
          _linkedCardIdMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('is_checkpoint')) {
      context.handle(
        _isCheckpointMeta,
        isCheckpoint.isAcceptableOrUnknown(
          data['is_checkpoint']!,
          _isCheckpointMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoadmapNode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoadmapNode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      moduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_id'],
      )!,
      conceptName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept_name'],
      )!,
      linkedCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_card_id'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      isCheckpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_checkpoint'],
      )!,
    );
  }

  @override
  $RoadmapNodesTable createAlias(String alias) {
    return $RoadmapNodesTable(attachedDatabase, alias);
  }
}

class RoadmapNode extends DataClass implements Insertable<RoadmapNode> {
  final String id;
  final String moduleId;
  final String conceptName;
  final String? linkedCardId;
  final int orderIndex;
  final bool isCheckpoint;
  const RoadmapNode({
    required this.id,
    required this.moduleId,
    required this.conceptName,
    this.linkedCardId,
    required this.orderIndex,
    required this.isCheckpoint,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['module_id'] = Variable<String>(moduleId);
    map['concept_name'] = Variable<String>(conceptName);
    if (!nullToAbsent || linkedCardId != null) {
      map['linked_card_id'] = Variable<String>(linkedCardId);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['is_checkpoint'] = Variable<bool>(isCheckpoint);
    return map;
  }

  RoadmapNodesCompanion toCompanion(bool nullToAbsent) {
    return RoadmapNodesCompanion(
      id: Value(id),
      moduleId: Value(moduleId),
      conceptName: Value(conceptName),
      linkedCardId: linkedCardId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedCardId),
      orderIndex: Value(orderIndex),
      isCheckpoint: Value(isCheckpoint),
    );
  }

  factory RoadmapNode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoadmapNode(
      id: serializer.fromJson<String>(json['id']),
      moduleId: serializer.fromJson<String>(json['moduleId']),
      conceptName: serializer.fromJson<String>(json['conceptName']),
      linkedCardId: serializer.fromJson<String?>(json['linkedCardId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      isCheckpoint: serializer.fromJson<bool>(json['isCheckpoint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'moduleId': serializer.toJson<String>(moduleId),
      'conceptName': serializer.toJson<String>(conceptName),
      'linkedCardId': serializer.toJson<String?>(linkedCardId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'isCheckpoint': serializer.toJson<bool>(isCheckpoint),
    };
  }

  RoadmapNode copyWith({
    String? id,
    String? moduleId,
    String? conceptName,
    Value<String?> linkedCardId = const Value.absent(),
    int? orderIndex,
    bool? isCheckpoint,
  }) => RoadmapNode(
    id: id ?? this.id,
    moduleId: moduleId ?? this.moduleId,
    conceptName: conceptName ?? this.conceptName,
    linkedCardId: linkedCardId.present ? linkedCardId.value : this.linkedCardId,
    orderIndex: orderIndex ?? this.orderIndex,
    isCheckpoint: isCheckpoint ?? this.isCheckpoint,
  );
  RoadmapNode copyWithCompanion(RoadmapNodesCompanion data) {
    return RoadmapNode(
      id: data.id.present ? data.id.value : this.id,
      moduleId: data.moduleId.present ? data.moduleId.value : this.moduleId,
      conceptName: data.conceptName.present
          ? data.conceptName.value
          : this.conceptName,
      linkedCardId: data.linkedCardId.present
          ? data.linkedCardId.value
          : this.linkedCardId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      isCheckpoint: data.isCheckpoint.present
          ? data.isCheckpoint.value
          : this.isCheckpoint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapNode(')
          ..write('id: $id, ')
          ..write('moduleId: $moduleId, ')
          ..write('conceptName: $conceptName, ')
          ..write('linkedCardId: $linkedCardId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isCheckpoint: $isCheckpoint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    moduleId,
    conceptName,
    linkedCardId,
    orderIndex,
    isCheckpoint,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoadmapNode &&
          other.id == this.id &&
          other.moduleId == this.moduleId &&
          other.conceptName == this.conceptName &&
          other.linkedCardId == this.linkedCardId &&
          other.orderIndex == this.orderIndex &&
          other.isCheckpoint == this.isCheckpoint);
}

class RoadmapNodesCompanion extends UpdateCompanion<RoadmapNode> {
  final Value<String> id;
  final Value<String> moduleId;
  final Value<String> conceptName;
  final Value<String?> linkedCardId;
  final Value<int> orderIndex;
  final Value<bool> isCheckpoint;
  final Value<int> rowid;
  const RoadmapNodesCompanion({
    this.id = const Value.absent(),
    this.moduleId = const Value.absent(),
    this.conceptName = const Value.absent(),
    this.linkedCardId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.isCheckpoint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapNodesCompanion.insert({
    required String id,
    required String moduleId,
    required String conceptName,
    this.linkedCardId = const Value.absent(),
    required int orderIndex,
    this.isCheckpoint = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       moduleId = Value(moduleId),
       conceptName = Value(conceptName),
       orderIndex = Value(orderIndex);
  static Insertable<RoadmapNode> custom({
    Expression<String>? id,
    Expression<String>? moduleId,
    Expression<String>? conceptName,
    Expression<String>? linkedCardId,
    Expression<int>? orderIndex,
    Expression<bool>? isCheckpoint,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moduleId != null) 'module_id': moduleId,
      if (conceptName != null) 'concept_name': conceptName,
      if (linkedCardId != null) 'linked_card_id': linkedCardId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (isCheckpoint != null) 'is_checkpoint': isCheckpoint,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapNodesCompanion copyWith({
    Value<String>? id,
    Value<String>? moduleId,
    Value<String>? conceptName,
    Value<String?>? linkedCardId,
    Value<int>? orderIndex,
    Value<bool>? isCheckpoint,
    Value<int>? rowid,
  }) {
    return RoadmapNodesCompanion(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      conceptName: conceptName ?? this.conceptName,
      linkedCardId: linkedCardId ?? this.linkedCardId,
      orderIndex: orderIndex ?? this.orderIndex,
      isCheckpoint: isCheckpoint ?? this.isCheckpoint,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (moduleId.present) {
      map['module_id'] = Variable<String>(moduleId.value);
    }
    if (conceptName.present) {
      map['concept_name'] = Variable<String>(conceptName.value);
    }
    if (linkedCardId.present) {
      map['linked_card_id'] = Variable<String>(linkedCardId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (isCheckpoint.present) {
      map['is_checkpoint'] = Variable<bool>(isCheckpoint.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapNodesCompanion(')
          ..write('id: $id, ')
          ..write('moduleId: $moduleId, ')
          ..write('conceptName: $conceptName, ')
          ..write('linkedCardId: $linkedCardId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isCheckpoint: $isCheckpoint, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserRoadmapProgressTable extends UserRoadmapProgress
    with TableInfo<$UserRoadmapProgressTable, UserRoadmapProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRoadmapProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id)',
    ),
  );
  static const VerificationMeta _activeNodeIdMeta = const VerificationMeta(
    'activeNodeId',
  );
  @override
  late final GeneratedColumn<String> activeNodeId = GeneratedColumn<String>(
    'active_node_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastAccessedAtMeta = const VerificationMeta(
    'lastAccessedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAccessedAt =
      GeneratedColumn<DateTime>(
        'last_accessed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    roadmapId,
    activeNodeId,
    lastAccessedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_roadmap_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRoadmapProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('active_node_id')) {
      context.handle(
        _activeNodeIdMeta,
        activeNodeId.isAcceptableOrUnknown(
          data['active_node_id']!,
          _activeNodeIdMeta,
        ),
      );
    }
    if (data.containsKey('last_accessed_at')) {
      context.handle(
        _lastAccessedAtMeta,
        lastAccessedAt.isAcceptableOrUnknown(
          data['last_accessed_at']!,
          _lastAccessedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roadmapId};
  @override
  UserRoadmapProgressData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRoadmapProgressData(
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      activeNodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_node_id'],
      ),
      lastAccessedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_accessed_at'],
      ),
    );
  }

  @override
  $UserRoadmapProgressTable createAlias(String alias) {
    return $UserRoadmapProgressTable(attachedDatabase, alias);
  }
}

class UserRoadmapProgressData extends DataClass
    implements Insertable<UserRoadmapProgressData> {
  final String roadmapId;
  final String? activeNodeId;
  final DateTime? lastAccessedAt;
  const UserRoadmapProgressData({
    required this.roadmapId,
    this.activeNodeId,
    this.lastAccessedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['roadmap_id'] = Variable<String>(roadmapId);
    if (!nullToAbsent || activeNodeId != null) {
      map['active_node_id'] = Variable<String>(activeNodeId);
    }
    if (!nullToAbsent || lastAccessedAt != null) {
      map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt);
    }
    return map;
  }

  UserRoadmapProgressCompanion toCompanion(bool nullToAbsent) {
    return UserRoadmapProgressCompanion(
      roadmapId: Value(roadmapId),
      activeNodeId: activeNodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(activeNodeId),
      lastAccessedAt: lastAccessedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedAt),
    );
  }

  factory UserRoadmapProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRoadmapProgressData(
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      activeNodeId: serializer.fromJson<String?>(json['activeNodeId']),
      lastAccessedAt: serializer.fromJson<DateTime?>(json['lastAccessedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roadmapId': serializer.toJson<String>(roadmapId),
      'activeNodeId': serializer.toJson<String?>(activeNodeId),
      'lastAccessedAt': serializer.toJson<DateTime?>(lastAccessedAt),
    };
  }

  UserRoadmapProgressData copyWith({
    String? roadmapId,
    Value<String?> activeNodeId = const Value.absent(),
    Value<DateTime?> lastAccessedAt = const Value.absent(),
  }) => UserRoadmapProgressData(
    roadmapId: roadmapId ?? this.roadmapId,
    activeNodeId: activeNodeId.present ? activeNodeId.value : this.activeNodeId,
    lastAccessedAt: lastAccessedAt.present
        ? lastAccessedAt.value
        : this.lastAccessedAt,
  );
  UserRoadmapProgressData copyWithCompanion(UserRoadmapProgressCompanion data) {
    return UserRoadmapProgressData(
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      activeNodeId: data.activeNodeId.present
          ? data.activeNodeId.value
          : this.activeNodeId,
      lastAccessedAt: data.lastAccessedAt.present
          ? data.lastAccessedAt.value
          : this.lastAccessedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRoadmapProgressData(')
          ..write('roadmapId: $roadmapId, ')
          ..write('activeNodeId: $activeNodeId, ')
          ..write('lastAccessedAt: $lastAccessedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roadmapId, activeNodeId, lastAccessedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRoadmapProgressData &&
          other.roadmapId == this.roadmapId &&
          other.activeNodeId == this.activeNodeId &&
          other.lastAccessedAt == this.lastAccessedAt);
}

class UserRoadmapProgressCompanion
    extends UpdateCompanion<UserRoadmapProgressData> {
  final Value<String> roadmapId;
  final Value<String?> activeNodeId;
  final Value<DateTime?> lastAccessedAt;
  final Value<int> rowid;
  const UserRoadmapProgressCompanion({
    this.roadmapId = const Value.absent(),
    this.activeNodeId = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRoadmapProgressCompanion.insert({
    required String roadmapId,
    this.activeNodeId = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : roadmapId = Value(roadmapId);
  static Insertable<UserRoadmapProgressData> custom({
    Expression<String>? roadmapId,
    Expression<String>? activeNodeId,
    Expression<DateTime>? lastAccessedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (activeNodeId != null) 'active_node_id': activeNodeId,
      if (lastAccessedAt != null) 'last_accessed_at': lastAccessedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRoadmapProgressCompanion copyWith({
    Value<String>? roadmapId,
    Value<String?>? activeNodeId,
    Value<DateTime?>? lastAccessedAt,
    Value<int>? rowid,
  }) {
    return UserRoadmapProgressCompanion(
      roadmapId: roadmapId ?? this.roadmapId,
      activeNodeId: activeNodeId ?? this.activeNodeId,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (activeNodeId.present) {
      map['active_node_id'] = Variable<String>(activeNodeId.value);
    }
    if (lastAccessedAt.present) {
      map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRoadmapProgressCompanion(')
          ..write('roadmapId: $roadmapId, ')
          ..write('activeNodeId: $activeNodeId, ')
          ..write('lastAccessedAt: $lastAccessedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GlobalWorkspaceTable extends GlobalWorkspace
    with TableInfo<$GlobalWorkspaceTable, GlobalWorkspaceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GlobalWorkspaceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, content, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'global_workspace';
  @override
  VerificationContext validateIntegrity(
    Insertable<GlobalWorkspaceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GlobalWorkspaceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GlobalWorkspaceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GlobalWorkspaceTable createAlias(String alias) {
    return $GlobalWorkspaceTable(attachedDatabase, alias);
  }
}

class GlobalWorkspaceData extends DataClass
    implements Insertable<GlobalWorkspaceData> {
  final int id;
  final String content;
  final DateTime updatedAt;
  const GlobalWorkspaceData({
    required this.id,
    required this.content,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GlobalWorkspaceCompanion toCompanion(bool nullToAbsent) {
    return GlobalWorkspaceCompanion(
      id: Value(id),
      content: Value(content),
      updatedAt: Value(updatedAt),
    );
  }

  factory GlobalWorkspaceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GlobalWorkspaceData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GlobalWorkspaceData copyWith({
    int? id,
    String? content,
    DateTime? updatedAt,
  }) => GlobalWorkspaceData(
    id: id ?? this.id,
    content: content ?? this.content,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GlobalWorkspaceData copyWithCompanion(GlobalWorkspaceCompanion data) {
    return GlobalWorkspaceData(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GlobalWorkspaceData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GlobalWorkspaceData &&
          other.id == this.id &&
          other.content == this.content &&
          other.updatedAt == this.updatedAt);
}

class GlobalWorkspaceCompanion extends UpdateCompanion<GlobalWorkspaceData> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> updatedAt;
  const GlobalWorkspaceCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GlobalWorkspaceCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<GlobalWorkspaceData> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GlobalWorkspaceCompanion copyWith({
    Value<int>? id,
    Value<String>? content,
    Value<DateTime>? updatedAt,
  }) {
    return GlobalWorkspaceCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlobalWorkspaceCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ConceptNotesTable extends ConceptNotes
    with TableInfo<$ConceptNotesTable, ConceptNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConceptNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _conceptNameMeta = const VerificationMeta(
    'conceptName',
  );
  @override
  late final GeneratedColumn<String> conceptName = GeneratedColumn<String>(
    'concept_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [conceptName, content, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'concept_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConceptNote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('concept_name')) {
      context.handle(
        _conceptNameMeta,
        conceptName.isAcceptableOrUnknown(
          data['concept_name']!,
          _conceptNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conceptNameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {conceptName};
  @override
  ConceptNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConceptNote(
      conceptName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept_name'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ConceptNotesTable createAlias(String alias) {
    return $ConceptNotesTable(attachedDatabase, alias);
  }
}

class ConceptNote extends DataClass implements Insertable<ConceptNote> {
  final String conceptName;
  final String content;
  final DateTime updatedAt;
  const ConceptNote({
    required this.conceptName,
    required this.content,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['concept_name'] = Variable<String>(conceptName);
    map['content'] = Variable<String>(content);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ConceptNotesCompanion toCompanion(bool nullToAbsent) {
    return ConceptNotesCompanion(
      conceptName: Value(conceptName),
      content: Value(content),
      updatedAt: Value(updatedAt),
    );
  }

  factory ConceptNote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConceptNote(
      conceptName: serializer.fromJson<String>(json['conceptName']),
      content: serializer.fromJson<String>(json['content']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'conceptName': serializer.toJson<String>(conceptName),
      'content': serializer.toJson<String>(content),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ConceptNote copyWith({
    String? conceptName,
    String? content,
    DateTime? updatedAt,
  }) => ConceptNote(
    conceptName: conceptName ?? this.conceptName,
    content: content ?? this.content,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ConceptNote copyWithCompanion(ConceptNotesCompanion data) {
    return ConceptNote(
      conceptName: data.conceptName.present
          ? data.conceptName.value
          : this.conceptName,
      content: data.content.present ? data.content.value : this.content,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConceptNote(')
          ..write('conceptName: $conceptName, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(conceptName, content, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConceptNote &&
          other.conceptName == this.conceptName &&
          other.content == this.content &&
          other.updatedAt == this.updatedAt);
}

class ConceptNotesCompanion extends UpdateCompanion<ConceptNote> {
  final Value<String> conceptName;
  final Value<String> content;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ConceptNotesCompanion({
    this.conceptName = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConceptNotesCompanion.insert({
    required String conceptName,
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : conceptName = Value(conceptName);
  static Insertable<ConceptNote> custom({
    Expression<String>? conceptName,
    Expression<String>? content,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (conceptName != null) 'concept_name': conceptName,
      if (content != null) 'content': content,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConceptNotesCompanion copyWith({
    Value<String>? conceptName,
    Value<String>? content,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ConceptNotesCompanion(
      conceptName: conceptName ?? this.conceptName,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (conceptName.present) {
      map['concept_name'] = Variable<String>(conceptName.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConceptNotesCompanion(')
          ..write('conceptName: $conceptName, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BlockAnnotationsTable extends BlockAnnotations
    with TableInfo<$BlockAnnotationsTable, BlockAnnotation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlockAnnotationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _blockIdMeta = const VerificationMeta(
    'blockId',
  );
  @override
  late final GeneratedColumn<String> blockId = GeneratedColumn<String>(
    'block_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteTextMeta = const VerificationMeta(
    'noteText',
  );
  @override
  late final GeneratedColumn<String> noteText = GeneratedColumn<String>(
    'note_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [blockId, noteText, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'block_annotations';
  @override
  VerificationContext validateIntegrity(
    Insertable<BlockAnnotation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('block_id')) {
      context.handle(
        _blockIdMeta,
        blockId.isAcceptableOrUnknown(data['block_id']!, _blockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_blockIdMeta);
    }
    if (data.containsKey('note_text')) {
      context.handle(
        _noteTextMeta,
        noteText.isAcceptableOrUnknown(data['note_text']!, _noteTextMeta),
      );
    } else if (isInserting) {
      context.missing(_noteTextMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {blockId};
  @override
  BlockAnnotation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlockAnnotation(
      blockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block_id'],
      )!,
      noteText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_text'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BlockAnnotationsTable createAlias(String alias) {
    return $BlockAnnotationsTable(attachedDatabase, alias);
  }
}

class BlockAnnotation extends DataClass implements Insertable<BlockAnnotation> {
  final String blockId;
  final String noteText;
  final DateTime updatedAt;
  const BlockAnnotation({
    required this.blockId,
    required this.noteText,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['block_id'] = Variable<String>(blockId);
    map['note_text'] = Variable<String>(noteText);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BlockAnnotationsCompanion toCompanion(bool nullToAbsent) {
    return BlockAnnotationsCompanion(
      blockId: Value(blockId),
      noteText: Value(noteText),
      updatedAt: Value(updatedAt),
    );
  }

  factory BlockAnnotation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlockAnnotation(
      blockId: serializer.fromJson<String>(json['blockId']),
      noteText: serializer.fromJson<String>(json['noteText']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'blockId': serializer.toJson<String>(blockId),
      'noteText': serializer.toJson<String>(noteText),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BlockAnnotation copyWith({
    String? blockId,
    String? noteText,
    DateTime? updatedAt,
  }) => BlockAnnotation(
    blockId: blockId ?? this.blockId,
    noteText: noteText ?? this.noteText,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BlockAnnotation copyWithCompanion(BlockAnnotationsCompanion data) {
    return BlockAnnotation(
      blockId: data.blockId.present ? data.blockId.value : this.blockId,
      noteText: data.noteText.present ? data.noteText.value : this.noteText,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlockAnnotation(')
          ..write('blockId: $blockId, ')
          ..write('noteText: $noteText, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(blockId, noteText, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlockAnnotation &&
          other.blockId == this.blockId &&
          other.noteText == this.noteText &&
          other.updatedAt == this.updatedAt);
}

class BlockAnnotationsCompanion extends UpdateCompanion<BlockAnnotation> {
  final Value<String> blockId;
  final Value<String> noteText;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BlockAnnotationsCompanion({
    this.blockId = const Value.absent(),
    this.noteText = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlockAnnotationsCompanion.insert({
    required String blockId,
    required String noteText,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : blockId = Value(blockId),
       noteText = Value(noteText);
  static Insertable<BlockAnnotation> custom({
    Expression<String>? blockId,
    Expression<String>? noteText,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (blockId != null) 'block_id': blockId,
      if (noteText != null) 'note_text': noteText,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlockAnnotationsCompanion copyWith({
    Value<String>? blockId,
    Value<String>? noteText,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return BlockAnnotationsCompanion(
      blockId: blockId ?? this.blockId,
      noteText: noteText ?? this.noteText,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (blockId.present) {
      map['block_id'] = Variable<String>(blockId.value);
    }
    if (noteText.present) {
      map['note_text'] = Variable<String>(noteText.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlockAnnotationsCompanion(')
          ..write('blockId: $blockId, ')
          ..write('noteText: $noteText, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Collection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  const Collection({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Collection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Collection copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => Collection(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Collection> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionItemsTable extends CollectionItems
    with TableInfo<$CollectionItemsTable, CollectionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES collections (id)',
    ),
  );
  static const VerificationMeta _conceptNameMeta = const VerificationMeta(
    'conceptName',
  );
  @override
  late final GeneratedColumn<String> conceptName = GeneratedColumn<String>(
    'concept_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [collectionId, conceptName, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('concept_name')) {
      context.handle(
        _conceptNameMeta,
        conceptName.isAcceptableOrUnknown(
          data['concept_name']!,
          _conceptNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conceptNameMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collectionId, conceptName};
  @override
  CollectionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionItem(
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      )!,
      conceptName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept_name'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $CollectionItemsTable createAlias(String alias) {
    return $CollectionItemsTable(attachedDatabase, alias);
  }
}

class CollectionItem extends DataClass implements Insertable<CollectionItem> {
  final String collectionId;
  final String conceptName;
  final DateTime addedAt;
  const CollectionItem({
    required this.collectionId,
    required this.conceptName,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection_id'] = Variable<String>(collectionId);
    map['concept_name'] = Variable<String>(conceptName);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  CollectionItemsCompanion toCompanion(bool nullToAbsent) {
    return CollectionItemsCompanion(
      collectionId: Value(collectionId),
      conceptName: Value(conceptName),
      addedAt: Value(addedAt),
    );
  }

  factory CollectionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionItem(
      collectionId: serializer.fromJson<String>(json['collectionId']),
      conceptName: serializer.fromJson<String>(json['conceptName']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionId': serializer.toJson<String>(collectionId),
      'conceptName': serializer.toJson<String>(conceptName),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  CollectionItem copyWith({
    String? collectionId,
    String? conceptName,
    DateTime? addedAt,
  }) => CollectionItem(
    collectionId: collectionId ?? this.collectionId,
    conceptName: conceptName ?? this.conceptName,
    addedAt: addedAt ?? this.addedAt,
  );
  CollectionItem copyWithCompanion(CollectionItemsCompanion data) {
    return CollectionItem(
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      conceptName: data.conceptName.present
          ? data.conceptName.value
          : this.conceptName,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItem(')
          ..write('collectionId: $collectionId, ')
          ..write('conceptName: $conceptName, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collectionId, conceptName, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionItem &&
          other.collectionId == this.collectionId &&
          other.conceptName == this.conceptName &&
          other.addedAt == this.addedAt);
}

class CollectionItemsCompanion extends UpdateCompanion<CollectionItem> {
  final Value<String> collectionId;
  final Value<String> conceptName;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const CollectionItemsCompanion({
    this.collectionId = const Value.absent(),
    this.conceptName = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionItemsCompanion.insert({
    required String collectionId,
    required String conceptName,
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : collectionId = Value(collectionId),
       conceptName = Value(conceptName);
  static Insertable<CollectionItem> custom({
    Expression<String>? collectionId,
    Expression<String>? conceptName,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collectionId != null) 'collection_id': collectionId,
      if (conceptName != null) 'concept_name': conceptName,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionItemsCompanion copyWith({
    Value<String>? collectionId,
    Value<String>? conceptName,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return CollectionItemsCompanion(
      collectionId: collectionId ?? this.collectionId,
      conceptName: conceptName ?? this.conceptName,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (conceptName.present) {
      map['concept_name'] = Variable<String>(conceptName.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItemsCompanion(')
          ..write('collectionId: $collectionId, ')
          ..write('conceptName: $conceptName, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImportQueueItemsTable extends ImportQueueItems
    with TableInfo<$ImportQueueItemsTable, ImportQueueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImportQueueItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchNameMeta = const VerificationMeta(
    'batchName',
  );
  @override
  late final GeneratedColumn<String> batchName = GeneratedColumn<String>(
    'batch_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importModeMeta = const VerificationMeta(
    'importMode',
  );
  @override
  late final GeneratedColumn<String> importMode = GeneratedColumn<String>(
    'import_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('page'),
  );
  static const VerificationMeta _depthMeta = const VerificationMeta('depth');
  @override
  late final GeneratedColumn<int> depth = GeneratedColumn<int>(
    'depth',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crawlSessionIdMeta = const VerificationMeta(
    'crawlSessionId',
  );
  @override
  late final GeneratedColumn<String> crawlSessionId = GeneratedColumn<String>(
    'crawl_session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('queued'),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    url,
    batchName,
    importMode,
    depth,
    parentId,
    crawlSessionId,
    status,
    progress,
    error,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'import_queue_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImportQueueItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('batch_name')) {
      context.handle(
        _batchNameMeta,
        batchName.isAcceptableOrUnknown(data['batch_name']!, _batchNameMeta),
      );
    }
    if (data.containsKey('import_mode')) {
      context.handle(
        _importModeMeta,
        importMode.isAcceptableOrUnknown(data['import_mode']!, _importModeMeta),
      );
    }
    if (data.containsKey('depth')) {
      context.handle(
        _depthMeta,
        depth.isAcceptableOrUnknown(data['depth']!, _depthMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('crawl_session_id')) {
      context.handle(
        _crawlSessionIdMeta,
        crawlSessionId.isAcceptableOrUnknown(
          data['crawl_session_id']!,
          _crawlSessionIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImportQueueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImportQueueItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      batchName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_name'],
      ),
      importMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}import_mode'],
      )!,
      depth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}depth'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      crawlSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crawl_session_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $ImportQueueItemsTable createAlias(String alias) {
    return $ImportQueueItemsTable(attachedDatabase, alias);
  }
}

class ImportQueueItem extends DataClass implements Insertable<ImportQueueItem> {
  final String id;
  final String url;
  final String? batchName;
  final String importMode;
  final int depth;
  final String? parentId;
  final String? crawlSessionId;
  final String status;
  final double progress;
  final String? error;
  final DateTime addedAt;
  const ImportQueueItem({
    required this.id,
    required this.url,
    this.batchName,
    required this.importMode,
    required this.depth,
    this.parentId,
    this.crawlSessionId,
    required this.status,
    required this.progress,
    this.error,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || batchName != null) {
      map['batch_name'] = Variable<String>(batchName);
    }
    map['import_mode'] = Variable<String>(importMode);
    map['depth'] = Variable<int>(depth);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || crawlSessionId != null) {
      map['crawl_session_id'] = Variable<String>(crawlSessionId);
    }
    map['status'] = Variable<String>(status);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  ImportQueueItemsCompanion toCompanion(bool nullToAbsent) {
    return ImportQueueItemsCompanion(
      id: Value(id),
      url: Value(url),
      batchName: batchName == null && nullToAbsent
          ? const Value.absent()
          : Value(batchName),
      importMode: Value(importMode),
      depth: Value(depth),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      crawlSessionId: crawlSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(crawlSessionId),
      status: Value(status),
      progress: Value(progress),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
      addedAt: Value(addedAt),
    );
  }

  factory ImportQueueItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImportQueueItem(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      batchName: serializer.fromJson<String?>(json['batchName']),
      importMode: serializer.fromJson<String>(json['importMode']),
      depth: serializer.fromJson<int>(json['depth']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      crawlSessionId: serializer.fromJson<String?>(json['crawlSessionId']),
      status: serializer.fromJson<String>(json['status']),
      progress: serializer.fromJson<double>(json['progress']),
      error: serializer.fromJson<String?>(json['error']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'batchName': serializer.toJson<String?>(batchName),
      'importMode': serializer.toJson<String>(importMode),
      'depth': serializer.toJson<int>(depth),
      'parentId': serializer.toJson<String?>(parentId),
      'crawlSessionId': serializer.toJson<String?>(crawlSessionId),
      'status': serializer.toJson<String>(status),
      'progress': serializer.toJson<double>(progress),
      'error': serializer.toJson<String?>(error),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  ImportQueueItem copyWith({
    String? id,
    String? url,
    Value<String?> batchName = const Value.absent(),
    String? importMode,
    int? depth,
    Value<String?> parentId = const Value.absent(),
    Value<String?> crawlSessionId = const Value.absent(),
    String? status,
    double? progress,
    Value<String?> error = const Value.absent(),
    DateTime? addedAt,
  }) => ImportQueueItem(
    id: id ?? this.id,
    url: url ?? this.url,
    batchName: batchName.present ? batchName.value : this.batchName,
    importMode: importMode ?? this.importMode,
    depth: depth ?? this.depth,
    parentId: parentId.present ? parentId.value : this.parentId,
    crawlSessionId: crawlSessionId.present
        ? crawlSessionId.value
        : this.crawlSessionId,
    status: status ?? this.status,
    progress: progress ?? this.progress,
    error: error.present ? error.value : this.error,
    addedAt: addedAt ?? this.addedAt,
  );
  ImportQueueItem copyWithCompanion(ImportQueueItemsCompanion data) {
    return ImportQueueItem(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      batchName: data.batchName.present ? data.batchName.value : this.batchName,
      importMode: data.importMode.present
          ? data.importMode.value
          : this.importMode,
      depth: data.depth.present ? data.depth.value : this.depth,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      crawlSessionId: data.crawlSessionId.present
          ? data.crawlSessionId.value
          : this.crawlSessionId,
      status: data.status.present ? data.status.value : this.status,
      progress: data.progress.present ? data.progress.value : this.progress,
      error: data.error.present ? data.error.value : this.error,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImportQueueItem(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('batchName: $batchName, ')
          ..write('importMode: $importMode, ')
          ..write('depth: $depth, ')
          ..write('parentId: $parentId, ')
          ..write('crawlSessionId: $crawlSessionId, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('error: $error, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    url,
    batchName,
    importMode,
    depth,
    parentId,
    crawlSessionId,
    status,
    progress,
    error,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImportQueueItem &&
          other.id == this.id &&
          other.url == this.url &&
          other.batchName == this.batchName &&
          other.importMode == this.importMode &&
          other.depth == this.depth &&
          other.parentId == this.parentId &&
          other.crawlSessionId == this.crawlSessionId &&
          other.status == this.status &&
          other.progress == this.progress &&
          other.error == this.error &&
          other.addedAt == this.addedAt);
}

class ImportQueueItemsCompanion extends UpdateCompanion<ImportQueueItem> {
  final Value<String> id;
  final Value<String> url;
  final Value<String?> batchName;
  final Value<String> importMode;
  final Value<int> depth;
  final Value<String?> parentId;
  final Value<String?> crawlSessionId;
  final Value<String> status;
  final Value<double> progress;
  final Value<String?> error;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const ImportQueueItemsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.batchName = const Value.absent(),
    this.importMode = const Value.absent(),
    this.depth = const Value.absent(),
    this.parentId = const Value.absent(),
    this.crawlSessionId = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.error = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImportQueueItemsCompanion.insert({
    required String id,
    required String url,
    this.batchName = const Value.absent(),
    this.importMode = const Value.absent(),
    this.depth = const Value.absent(),
    this.parentId = const Value.absent(),
    this.crawlSessionId = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.error = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       url = Value(url);
  static Insertable<ImportQueueItem> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? batchName,
    Expression<String>? importMode,
    Expression<int>? depth,
    Expression<String>? parentId,
    Expression<String>? crawlSessionId,
    Expression<String>? status,
    Expression<double>? progress,
    Expression<String>? error,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (batchName != null) 'batch_name': batchName,
      if (importMode != null) 'import_mode': importMode,
      if (depth != null) 'depth': depth,
      if (parentId != null) 'parent_id': parentId,
      if (crawlSessionId != null) 'crawl_session_id': crawlSessionId,
      if (status != null) 'status': status,
      if (progress != null) 'progress': progress,
      if (error != null) 'error': error,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImportQueueItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? url,
    Value<String?>? batchName,
    Value<String>? importMode,
    Value<int>? depth,
    Value<String?>? parentId,
    Value<String?>? crawlSessionId,
    Value<String>? status,
    Value<double>? progress,
    Value<String?>? error,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return ImportQueueItemsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      batchName: batchName ?? this.batchName,
      importMode: importMode ?? this.importMode,
      depth: depth ?? this.depth,
      parentId: parentId ?? this.parentId,
      crawlSessionId: crawlSessionId ?? this.crawlSessionId,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      error: error ?? this.error,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (batchName.present) {
      map['batch_name'] = Variable<String>(batchName.value);
    }
    if (importMode.present) {
      map['import_mode'] = Variable<String>(importMode.value);
    }
    if (depth.present) {
      map['depth'] = Variable<int>(depth.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (crawlSessionId.present) {
      map['crawl_session_id'] = Variable<String>(crawlSessionId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImportQueueItemsCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('batchName: $batchName, ')
          ..write('importMode: $importMode, ')
          ..write('depth: $depth, ')
          ..write('parentId: $parentId, ')
          ..write('crawlSessionId: $crawlSessionId, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('error: $error, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RawDocumentsTable rawDocuments = $RawDocumentsTable(this);
  late final $NormalizedDocumentsTable normalizedDocuments =
      $NormalizedDocumentsTable(this);
  late final $KnowledgeCardsTable knowledgeCards = $KnowledgeCardsTable(this);
  late final $GraphLinksTable graphLinks = $GraphLinksTable(this);
  late final $ProblemPatternsTable problemPatterns = $ProblemPatternsTable(
    this,
  );
  late final $LearningProgressTable learningProgress = $LearningProgressTable(
    this,
  );
  late final $ExtractedConceptsTable extractedConcepts =
      $ExtractedConceptsTable(this);
  late final $ConceptRelationshipsTable conceptRelationships =
      $ConceptRelationshipsTable(this);
  late final $SemanticElementsTable semanticElements = $SemanticElementsTable(
    this,
  );
  late final $ProblemsTable problems = $ProblemsTable(this);
  late final $ProblemConceptLinksTable problemConceptLinks =
      $ProblemConceptLinksTable(this);
  late final $ProblemProgressTable problemProgress = $ProblemProgressTable(
    this,
  );
  late final $RoadmapsTable roadmaps = $RoadmapsTable(this);
  late final $RoadmapModulesTable roadmapModules = $RoadmapModulesTable(this);
  late final $RoadmapNodesTable roadmapNodes = $RoadmapNodesTable(this);
  late final $UserRoadmapProgressTable userRoadmapProgress =
      $UserRoadmapProgressTable(this);
  late final $GlobalWorkspaceTable globalWorkspace = $GlobalWorkspaceTable(
    this,
  );
  late final $ConceptNotesTable conceptNotes = $ConceptNotesTable(this);
  late final $BlockAnnotationsTable blockAnnotations = $BlockAnnotationsTable(
    this,
  );
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $CollectionItemsTable collectionItems = $CollectionItemsTable(
    this,
  );
  late final $ImportQueueItemsTable importQueueItems = $ImportQueueItemsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    rawDocuments,
    normalizedDocuments,
    knowledgeCards,
    graphLinks,
    problemPatterns,
    learningProgress,
    extractedConcepts,
    conceptRelationships,
    semanticElements,
    problems,
    problemConceptLinks,
    problemProgress,
    roadmaps,
    roadmapModules,
    roadmapNodes,
    userRoadmapProgress,
    globalWorkspace,
    conceptNotes,
    blockAnnotations,
    collections,
    collectionItems,
    importQueueItems,
  ];
}

typedef $$RawDocumentsTableCreateCompanionBuilder =
    RawDocumentsCompanion Function({
      Value<int> id,
      required String sourceUri,
      required String rawContent,
      Value<DateTime> fetchedAt,
    });
typedef $$RawDocumentsTableUpdateCompanionBuilder =
    RawDocumentsCompanion Function({
      Value<int> id,
      Value<String> sourceUri,
      Value<String> rawContent,
      Value<DateTime> fetchedAt,
    });

final class $$RawDocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $RawDocumentsTable, RawDocument> {
  $$RawDocumentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $NormalizedDocumentsTable,
    List<NormalizedDocument>
  >
  _normalizedDocumentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.normalizedDocuments,
        aliasName: 'raw_documents__id__normalized_documents__raw_document_id',
      );

  $$NormalizedDocumentsTableProcessedTableManager get normalizedDocumentsRefs {
    final manager = $$NormalizedDocumentsTableTableManager(
      $_db,
      $_db.normalizedDocuments,
    ).filter((f) => f.rawDocumentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _normalizedDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RawDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $RawDocumentsTable> {
  $$RawDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUri => $composableBuilder(
    column: $table.sourceUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawContent => $composableBuilder(
    column: $table.rawContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> normalizedDocumentsRefs(
    Expression<bool> Function($$NormalizedDocumentsTableFilterComposer f) f,
  ) {
    final $$NormalizedDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.normalizedDocuments,
      getReferencedColumn: (t) => t.rawDocumentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NormalizedDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.normalizedDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RawDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $RawDocumentsTable> {
  $$RawDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUri => $composableBuilder(
    column: $table.sourceUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawContent => $composableBuilder(
    column: $table.rawContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RawDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RawDocumentsTable> {
  $$RawDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceUri =>
      $composableBuilder(column: $table.sourceUri, builder: (column) => column);

  GeneratedColumn<String> get rawContent => $composableBuilder(
    column: $table.rawContent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);

  Expression<T> normalizedDocumentsRefs<T extends Object>(
    Expression<T> Function($$NormalizedDocumentsTableAnnotationComposer a) f,
  ) {
    final $$NormalizedDocumentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.normalizedDocuments,
          getReferencedColumn: (t) => t.rawDocumentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NormalizedDocumentsTableAnnotationComposer(
                $db: $db,
                $table: $db.normalizedDocuments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RawDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RawDocumentsTable,
          RawDocument,
          $$RawDocumentsTableFilterComposer,
          $$RawDocumentsTableOrderingComposer,
          $$RawDocumentsTableAnnotationComposer,
          $$RawDocumentsTableCreateCompanionBuilder,
          $$RawDocumentsTableUpdateCompanionBuilder,
          (RawDocument, $$RawDocumentsTableReferences),
          RawDocument,
          PrefetchHooks Function({bool normalizedDocumentsRefs})
        > {
  $$RawDocumentsTableTableManager(_$AppDatabase db, $RawDocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RawDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RawDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RawDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sourceUri = const Value.absent(),
                Value<String> rawContent = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
              }) => RawDocumentsCompanion(
                id: id,
                sourceUri: sourceUri,
                rawContent: rawContent,
                fetchedAt: fetchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sourceUri,
                required String rawContent,
                Value<DateTime> fetchedAt = const Value.absent(),
              }) => RawDocumentsCompanion.insert(
                id: id,
                sourceUri: sourceUri,
                rawContent: rawContent,
                fetchedAt: fetchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RawDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({normalizedDocumentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (normalizedDocumentsRefs) db.normalizedDocuments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (normalizedDocumentsRefs)
                    await $_getPrefetchedData<
                      RawDocument,
                      $RawDocumentsTable,
                      NormalizedDocument
                    >(
                      currentTable: table,
                      referencedTable: $$RawDocumentsTableReferences
                          ._normalizedDocumentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RawDocumentsTableReferences(
                            db,
                            table,
                            p0,
                          ).normalizedDocumentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.rawDocumentId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RawDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RawDocumentsTable,
      RawDocument,
      $$RawDocumentsTableFilterComposer,
      $$RawDocumentsTableOrderingComposer,
      $$RawDocumentsTableAnnotationComposer,
      $$RawDocumentsTableCreateCompanionBuilder,
      $$RawDocumentsTableUpdateCompanionBuilder,
      (RawDocument, $$RawDocumentsTableReferences),
      RawDocument,
      PrefetchHooks Function({bool normalizedDocumentsRefs})
    >;
typedef $$NormalizedDocumentsTableCreateCompanionBuilder =
    NormalizedDocumentsCompanion Function({
      Value<int> id,
      required int rawDocumentId,
      required String title,
      required String content,
      Value<DateTime> normalizedAt,
    });
typedef $$NormalizedDocumentsTableUpdateCompanionBuilder =
    NormalizedDocumentsCompanion Function({
      Value<int> id,
      Value<int> rawDocumentId,
      Value<String> title,
      Value<String> content,
      Value<DateTime> normalizedAt,
    });

final class $$NormalizedDocumentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NormalizedDocumentsTable,
          NormalizedDocument
        > {
  $$NormalizedDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RawDocumentsTable _rawDocumentIdTable(_$AppDatabase db) => db
      .rawDocuments
      .createAlias('normalized_documents__raw_document_id__raw_documents__id');

  $$RawDocumentsTableProcessedTableManager get rawDocumentId {
    final $_column = $_itemColumn<int>('raw_document_id')!;

    final manager = $$RawDocumentsTableTableManager(
      $_db,
      $_db.rawDocuments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rawDocumentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NormalizedDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $NormalizedDocumentsTable> {
  $$NormalizedDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get normalizedAt => $composableBuilder(
    column: $table.normalizedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RawDocumentsTableFilterComposer get rawDocumentId {
    final $$RawDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rawDocumentId,
      referencedTable: $db.rawDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RawDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.rawDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NormalizedDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $NormalizedDocumentsTable> {
  $$NormalizedDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get normalizedAt => $composableBuilder(
    column: $table.normalizedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RawDocumentsTableOrderingComposer get rawDocumentId {
    final $$RawDocumentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rawDocumentId,
      referencedTable: $db.rawDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RawDocumentsTableOrderingComposer(
            $db: $db,
            $table: $db.rawDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NormalizedDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NormalizedDocumentsTable> {
  $$NormalizedDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get normalizedAt => $composableBuilder(
    column: $table.normalizedAt,
    builder: (column) => column,
  );

  $$RawDocumentsTableAnnotationComposer get rawDocumentId {
    final $$RawDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rawDocumentId,
      referencedTable: $db.rawDocuments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RawDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.rawDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NormalizedDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NormalizedDocumentsTable,
          NormalizedDocument,
          $$NormalizedDocumentsTableFilterComposer,
          $$NormalizedDocumentsTableOrderingComposer,
          $$NormalizedDocumentsTableAnnotationComposer,
          $$NormalizedDocumentsTableCreateCompanionBuilder,
          $$NormalizedDocumentsTableUpdateCompanionBuilder,
          (NormalizedDocument, $$NormalizedDocumentsTableReferences),
          NormalizedDocument,
          PrefetchHooks Function({bool rawDocumentId})
        > {
  $$NormalizedDocumentsTableTableManager(
    _$AppDatabase db,
    $NormalizedDocumentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NormalizedDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NormalizedDocumentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NormalizedDocumentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> rawDocumentId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> normalizedAt = const Value.absent(),
              }) => NormalizedDocumentsCompanion(
                id: id,
                rawDocumentId: rawDocumentId,
                title: title,
                content: content,
                normalizedAt: normalizedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int rawDocumentId,
                required String title,
                required String content,
                Value<DateTime> normalizedAt = const Value.absent(),
              }) => NormalizedDocumentsCompanion.insert(
                id: id,
                rawDocumentId: rawDocumentId,
                title: title,
                content: content,
                normalizedAt: normalizedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NormalizedDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rawDocumentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (rawDocumentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.rawDocumentId,
                                referencedTable:
                                    $$NormalizedDocumentsTableReferences
                                        ._rawDocumentIdTable(db),
                                referencedColumn:
                                    $$NormalizedDocumentsTableReferences
                                        ._rawDocumentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NormalizedDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NormalizedDocumentsTable,
      NormalizedDocument,
      $$NormalizedDocumentsTableFilterComposer,
      $$NormalizedDocumentsTableOrderingComposer,
      $$NormalizedDocumentsTableAnnotationComposer,
      $$NormalizedDocumentsTableCreateCompanionBuilder,
      $$NormalizedDocumentsTableUpdateCompanionBuilder,
      (NormalizedDocument, $$NormalizedDocumentsTableReferences),
      NormalizedDocument,
      PrefetchHooks Function({bool rawDocumentId})
    >;
typedef $$KnowledgeCardsTableCreateCompanionBuilder =
    KnowledgeCardsCompanion Function({
      required String id,
      required String title,
      Value<String?> sourceUrl,
      Value<String?> sourceName,
      Value<String?> author,
      Value<String?> publishedDate,
      Value<String?> retrievedAt,
      Value<String?> parserVersion,
      Value<String?> originalHtml,
      Value<String?> blocksJson,
      Value<String?> knowledgeArtifactJson,
      Value<String> importStatus,
      Value<int> schemaVersion,
      Value<int> contentVersion,
      Value<String?> parsingReport,
      required String explanation,
      required String tags,
      required String difficulty,
      Value<String?> timeComplexity,
      Value<String?> spaceComplexity,
      Value<String?> sources,
      Value<String?> revisionNotes,
      Value<int> rowid,
    });
typedef $$KnowledgeCardsTableUpdateCompanionBuilder =
    KnowledgeCardsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> sourceUrl,
      Value<String?> sourceName,
      Value<String?> author,
      Value<String?> publishedDate,
      Value<String?> retrievedAt,
      Value<String?> parserVersion,
      Value<String?> originalHtml,
      Value<String?> blocksJson,
      Value<String?> knowledgeArtifactJson,
      Value<String> importStatus,
      Value<int> schemaVersion,
      Value<int> contentVersion,
      Value<String?> parsingReport,
      Value<String> explanation,
      Value<String> tags,
      Value<String> difficulty,
      Value<String?> timeComplexity,
      Value<String?> spaceComplexity,
      Value<String?> sources,
      Value<String?> revisionNotes,
      Value<int> rowid,
    });

final class $$KnowledgeCardsTableReferences
    extends BaseReferences<_$AppDatabase, $KnowledgeCardsTable, KnowledgeCard> {
  $$KnowledgeCardsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$GraphLinksTable, List<GraphLink>>
  _outgoingLinksTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.graphLinks,
    aliasName: 'knowledge_cards__id__graph_links__source_card_id',
  );

  $$GraphLinksTableProcessedTableManager get outgoingLinks {
    final manager = $$GraphLinksTableTableManager(
      $_db,
      $_db.graphLinks,
    ).filter((f) => f.sourceCardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_outgoingLinksTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GraphLinksTable, List<GraphLink>>
  _incomingLinksTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.graphLinks,
    aliasName: 'knowledge_cards__id__graph_links__target_card_id',
  );

  $$GraphLinksTableProcessedTableManager get incomingLinks {
    final manager = $$GraphLinksTableTableManager(
      $_db,
      $_db.graphLinks,
    ).filter((f) => f.targetCardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomingLinksTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProblemPatternsTable, List<ProblemPattern>>
  _problemPatternsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.problemPatterns,
    aliasName: 'knowledge_cards__id__problem_patterns__card_id',
  );

  $$ProblemPatternsTableProcessedTableManager get problemPatternsRefs {
    final manager = $$ProblemPatternsTableTableManager(
      $_db,
      $_db.problemPatterns,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _problemPatternsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LearningProgressTable, List<LearningProgressData>>
  _learningProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.learningProgress,
    aliasName: 'knowledge_cards__id__learning_progress__card_id',
  );

  $$LearningProgressTableProcessedTableManager get learningProgressRefs {
    final manager = $$LearningProgressTableTableManager(
      $_db,
      $_db.learningProgress,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _learningProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExtractedConceptsTable, List<ExtractedConcept>>
  _extractedConceptsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.extractedConcepts,
        aliasName: 'knowledge_cards__id__extracted_concepts__card_id',
      );

  $$ExtractedConceptsTableProcessedTableManager get extractedConceptsRefs {
    final manager = $$ExtractedConceptsTableTableManager(
      $_db,
      $_db.extractedConcepts,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _extractedConceptsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ConceptRelationshipsTable,
    List<ConceptRelationship>
  >
  _conceptRelationshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.conceptRelationships,
        aliasName: 'knowledge_cards__id__concept_relationships__card_id',
      );

  $$ConceptRelationshipsTableProcessedTableManager
  get conceptRelationshipsRefs {
    final manager = $$ConceptRelationshipsTableTableManager(
      $_db,
      $_db.conceptRelationships,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _conceptRelationshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SemanticElementsTable, List<SemanticElement>>
  _semanticElementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.semanticElements,
    aliasName: 'knowledge_cards__id__semantic_elements__card_id',
  );

  $$SemanticElementsTableProcessedTableManager get semanticElementsRefs {
    final manager = $$SemanticElementsTableTableManager(
      $_db,
      $_db.semanticElements,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _semanticElementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoadmapNodesTable, List<RoadmapNode>>
  _roadmapNodesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.roadmapNodes,
    aliasName: 'knowledge_cards__id__roadmap_nodes__linked_card_id',
  );

  $$RoadmapNodesTableProcessedTableManager get roadmapNodesRefs {
    final manager = $$RoadmapNodesTableTableManager(
      $_db,
      $_db.roadmapNodes,
    ).filter((f) => f.linkedCardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roadmapNodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$KnowledgeCardsTableFilterComposer
    extends Composer<_$AppDatabase, $KnowledgeCardsTable> {
  $$KnowledgeCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parserVersion => $composableBuilder(
    column: $table.parserVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalHtml => $composableBuilder(
    column: $table.originalHtml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blocksJson => $composableBuilder(
    column: $table.blocksJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get knowledgeArtifactJson => $composableBuilder(
    column: $table.knowledgeArtifactJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importStatus => $composableBuilder(
    column: $table.importStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsingReport => $composableBuilder(
    column: $table.parsingReport,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeComplexity => $composableBuilder(
    column: $table.timeComplexity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spaceComplexity => $composableBuilder(
    column: $table.spaceComplexity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revisionNotes => $composableBuilder(
    column: $table.revisionNotes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> outgoingLinks(
    Expression<bool> Function($$GraphLinksTableFilterComposer f) f,
  ) {
    final $$GraphLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.graphLinks,
      getReferencedColumn: (t) => t.sourceCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GraphLinksTableFilterComposer(
            $db: $db,
            $table: $db.graphLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> incomingLinks(
    Expression<bool> Function($$GraphLinksTableFilterComposer f) f,
  ) {
    final $$GraphLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.graphLinks,
      getReferencedColumn: (t) => t.targetCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GraphLinksTableFilterComposer(
            $db: $db,
            $table: $db.graphLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> problemPatternsRefs(
    Expression<bool> Function($$ProblemPatternsTableFilterComposer f) f,
  ) {
    final $$ProblemPatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.problemPatterns,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemPatternsTableFilterComposer(
            $db: $db,
            $table: $db.problemPatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> learningProgressRefs(
    Expression<bool> Function($$LearningProgressTableFilterComposer f) f,
  ) {
    final $$LearningProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.learningProgress,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LearningProgressTableFilterComposer(
            $db: $db,
            $table: $db.learningProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> extractedConceptsRefs(
    Expression<bool> Function($$ExtractedConceptsTableFilterComposer f) f,
  ) {
    final $$ExtractedConceptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.extractedConcepts,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExtractedConceptsTableFilterComposer(
            $db: $db,
            $table: $db.extractedConcepts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> conceptRelationshipsRefs(
    Expression<bool> Function($$ConceptRelationshipsTableFilterComposer f) f,
  ) {
    final $$ConceptRelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conceptRelationships,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConceptRelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.conceptRelationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> semanticElementsRefs(
    Expression<bool> Function($$SemanticElementsTableFilterComposer f) f,
  ) {
    final $$SemanticElementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.semanticElements,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemanticElementsTableFilterComposer(
            $db: $db,
            $table: $db.semanticElements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> roadmapNodesRefs(
    Expression<bool> Function($$RoadmapNodesTableFilterComposer f) f,
  ) {
    final $$RoadmapNodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapNodes,
      getReferencedColumn: (t) => t.linkedCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapNodesTableFilterComposer(
            $db: $db,
            $table: $db.roadmapNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KnowledgeCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $KnowledgeCardsTable> {
  $$KnowledgeCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parserVersion => $composableBuilder(
    column: $table.parserVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalHtml => $composableBuilder(
    column: $table.originalHtml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blocksJson => $composableBuilder(
    column: $table.blocksJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get knowledgeArtifactJson => $composableBuilder(
    column: $table.knowledgeArtifactJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importStatus => $composableBuilder(
    column: $table.importStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsingReport => $composableBuilder(
    column: $table.parsingReport,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeComplexity => $composableBuilder(
    column: $table.timeComplexity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spaceComplexity => $composableBuilder(
    column: $table.spaceComplexity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revisionNotes => $composableBuilder(
    column: $table.revisionNotes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KnowledgeCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KnowledgeCardsTable> {
  $$KnowledgeCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parserVersion => $composableBuilder(
    column: $table.parserVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalHtml => $composableBuilder(
    column: $table.originalHtml,
    builder: (column) => column,
  );

  GeneratedColumn<String> get blocksJson => $composableBuilder(
    column: $table.blocksJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get knowledgeArtifactJson => $composableBuilder(
    column: $table.knowledgeArtifactJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get importStatus => $composableBuilder(
    column: $table.importStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsingReport => $composableBuilder(
    column: $table.parsingReport,
    builder: (column) => column,
  );

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timeComplexity => $composableBuilder(
    column: $table.timeComplexity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get spaceComplexity => $composableBuilder(
    column: $table.spaceComplexity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get revisionNotes => $composableBuilder(
    column: $table.revisionNotes,
    builder: (column) => column,
  );

  Expression<T> outgoingLinks<T extends Object>(
    Expression<T> Function($$GraphLinksTableAnnotationComposer a) f,
  ) {
    final $$GraphLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.graphLinks,
      getReferencedColumn: (t) => t.sourceCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GraphLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.graphLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> incomingLinks<T extends Object>(
    Expression<T> Function($$GraphLinksTableAnnotationComposer a) f,
  ) {
    final $$GraphLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.graphLinks,
      getReferencedColumn: (t) => t.targetCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GraphLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.graphLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> problemPatternsRefs<T extends Object>(
    Expression<T> Function($$ProblemPatternsTableAnnotationComposer a) f,
  ) {
    final $$ProblemPatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.problemPatterns,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemPatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.problemPatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> learningProgressRefs<T extends Object>(
    Expression<T> Function($$LearningProgressTableAnnotationComposer a) f,
  ) {
    final $$LearningProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.learningProgress,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LearningProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.learningProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> extractedConceptsRefs<T extends Object>(
    Expression<T> Function($$ExtractedConceptsTableAnnotationComposer a) f,
  ) {
    final $$ExtractedConceptsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.extractedConcepts,
          getReferencedColumn: (t) => t.cardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExtractedConceptsTableAnnotationComposer(
                $db: $db,
                $table: $db.extractedConcepts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> conceptRelationshipsRefs<T extends Object>(
    Expression<T> Function($$ConceptRelationshipsTableAnnotationComposer a) f,
  ) {
    final $$ConceptRelationshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.conceptRelationships,
          getReferencedColumn: (t) => t.cardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ConceptRelationshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.conceptRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> semanticElementsRefs<T extends Object>(
    Expression<T> Function($$SemanticElementsTableAnnotationComposer a) f,
  ) {
    final $$SemanticElementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.semanticElements,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemanticElementsTableAnnotationComposer(
            $db: $db,
            $table: $db.semanticElements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> roadmapNodesRefs<T extends Object>(
    Expression<T> Function($$RoadmapNodesTableAnnotationComposer a) f,
  ) {
    final $$RoadmapNodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapNodes,
      getReferencedColumn: (t) => t.linkedCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapNodesTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KnowledgeCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KnowledgeCardsTable,
          KnowledgeCard,
          $$KnowledgeCardsTableFilterComposer,
          $$KnowledgeCardsTableOrderingComposer,
          $$KnowledgeCardsTableAnnotationComposer,
          $$KnowledgeCardsTableCreateCompanionBuilder,
          $$KnowledgeCardsTableUpdateCompanionBuilder,
          (KnowledgeCard, $$KnowledgeCardsTableReferences),
          KnowledgeCard,
          PrefetchHooks Function({
            bool outgoingLinks,
            bool incomingLinks,
            bool problemPatternsRefs,
            bool learningProgressRefs,
            bool extractedConceptsRefs,
            bool conceptRelationshipsRefs,
            bool semanticElementsRefs,
            bool roadmapNodesRefs,
          })
        > {
  $$KnowledgeCardsTableTableManager(
    _$AppDatabase db,
    $KnowledgeCardsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> sourceName = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String?> retrievedAt = const Value.absent(),
                Value<String?> parserVersion = const Value.absent(),
                Value<String?> originalHtml = const Value.absent(),
                Value<String?> blocksJson = const Value.absent(),
                Value<String?> knowledgeArtifactJson = const Value.absent(),
                Value<String> importStatus = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<int> contentVersion = const Value.absent(),
                Value<String?> parsingReport = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String?> timeComplexity = const Value.absent(),
                Value<String?> spaceComplexity = const Value.absent(),
                Value<String?> sources = const Value.absent(),
                Value<String?> revisionNotes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeCardsCompanion(
                id: id,
                title: title,
                sourceUrl: sourceUrl,
                sourceName: sourceName,
                author: author,
                publishedDate: publishedDate,
                retrievedAt: retrievedAt,
                parserVersion: parserVersion,
                originalHtml: originalHtml,
                blocksJson: blocksJson,
                knowledgeArtifactJson: knowledgeArtifactJson,
                importStatus: importStatus,
                schemaVersion: schemaVersion,
                contentVersion: contentVersion,
                parsingReport: parsingReport,
                explanation: explanation,
                tags: tags,
                difficulty: difficulty,
                timeComplexity: timeComplexity,
                spaceComplexity: spaceComplexity,
                sources: sources,
                revisionNotes: revisionNotes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> sourceName = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String?> retrievedAt = const Value.absent(),
                Value<String?> parserVersion = const Value.absent(),
                Value<String?> originalHtml = const Value.absent(),
                Value<String?> blocksJson = const Value.absent(),
                Value<String?> knowledgeArtifactJson = const Value.absent(),
                Value<String> importStatus = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<int> contentVersion = const Value.absent(),
                Value<String?> parsingReport = const Value.absent(),
                required String explanation,
                required String tags,
                required String difficulty,
                Value<String?> timeComplexity = const Value.absent(),
                Value<String?> spaceComplexity = const Value.absent(),
                Value<String?> sources = const Value.absent(),
                Value<String?> revisionNotes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeCardsCompanion.insert(
                id: id,
                title: title,
                sourceUrl: sourceUrl,
                sourceName: sourceName,
                author: author,
                publishedDate: publishedDate,
                retrievedAt: retrievedAt,
                parserVersion: parserVersion,
                originalHtml: originalHtml,
                blocksJson: blocksJson,
                knowledgeArtifactJson: knowledgeArtifactJson,
                importStatus: importStatus,
                schemaVersion: schemaVersion,
                contentVersion: contentVersion,
                parsingReport: parsingReport,
                explanation: explanation,
                tags: tags,
                difficulty: difficulty,
                timeComplexity: timeComplexity,
                spaceComplexity: spaceComplexity,
                sources: sources,
                revisionNotes: revisionNotes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$KnowledgeCardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                outgoingLinks = false,
                incomingLinks = false,
                problemPatternsRefs = false,
                learningProgressRefs = false,
                extractedConceptsRefs = false,
                conceptRelationshipsRefs = false,
                semanticElementsRefs = false,
                roadmapNodesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (outgoingLinks) db.graphLinks,
                    if (incomingLinks) db.graphLinks,
                    if (problemPatternsRefs) db.problemPatterns,
                    if (learningProgressRefs) db.learningProgress,
                    if (extractedConceptsRefs) db.extractedConcepts,
                    if (conceptRelationshipsRefs) db.conceptRelationships,
                    if (semanticElementsRefs) db.semanticElements,
                    if (roadmapNodesRefs) db.roadmapNodes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (outgoingLinks)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          GraphLink
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._outgoingLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).outgoingLinks,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceCardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (incomingLinks)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          GraphLink
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._incomingLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).incomingLinks,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.targetCardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (problemPatternsRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          ProblemPattern
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._problemPatternsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).problemPatternsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (learningProgressRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          LearningProgressData
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._learningProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).learningProgressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (extractedConceptsRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          ExtractedConcept
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._extractedConceptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).extractedConceptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (conceptRelationshipsRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          ConceptRelationship
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._conceptRelationshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).conceptRelationshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (semanticElementsRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          SemanticElement
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._semanticElementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).semanticElementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (roadmapNodesRefs)
                        await $_getPrefetchedData<
                          KnowledgeCard,
                          $KnowledgeCardsTable,
                          RoadmapNode
                        >(
                          currentTable: table,
                          referencedTable: $$KnowledgeCardsTableReferences
                              ._roadmapNodesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$KnowledgeCardsTableReferences(
                                db,
                                table,
                                p0,
                              ).roadmapNodesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.linkedCardId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$KnowledgeCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KnowledgeCardsTable,
      KnowledgeCard,
      $$KnowledgeCardsTableFilterComposer,
      $$KnowledgeCardsTableOrderingComposer,
      $$KnowledgeCardsTableAnnotationComposer,
      $$KnowledgeCardsTableCreateCompanionBuilder,
      $$KnowledgeCardsTableUpdateCompanionBuilder,
      (KnowledgeCard, $$KnowledgeCardsTableReferences),
      KnowledgeCard,
      PrefetchHooks Function({
        bool outgoingLinks,
        bool incomingLinks,
        bool problemPatternsRefs,
        bool learningProgressRefs,
        bool extractedConceptsRefs,
        bool conceptRelationshipsRefs,
        bool semanticElementsRefs,
        bool roadmapNodesRefs,
      })
    >;
typedef $$GraphLinksTableCreateCompanionBuilder =
    GraphLinksCompanion Function({
      required String sourceCardId,
      required String targetCardId,
      required String relationshipType,
      Value<int> rowid,
    });
typedef $$GraphLinksTableUpdateCompanionBuilder =
    GraphLinksCompanion Function({
      Value<String> sourceCardId,
      Value<String> targetCardId,
      Value<String> relationshipType,
      Value<int> rowid,
    });

final class $$GraphLinksTableReferences
    extends BaseReferences<_$AppDatabase, $GraphLinksTable, GraphLink> {
  $$GraphLinksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $KnowledgeCardsTable _sourceCardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('graph_links__source_card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get sourceCardId {
    final $_column = $_itemColumn<String>('source_card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $KnowledgeCardsTable _targetCardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('graph_links__target_card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get targetCardId {
    final $_column = $_itemColumn<String>('target_card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_targetCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GraphLinksTableFilterComposer
    extends Composer<_$AppDatabase, $GraphLinksTable> {
  $$GraphLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get sourceCardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableFilterComposer get targetCardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GraphLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $GraphLinksTable> {
  $$GraphLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get sourceCardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableOrderingComposer get targetCardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GraphLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $GraphLinksTable> {
  $$GraphLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => column,
  );

  $$KnowledgeCardsTableAnnotationComposer get sourceCardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableAnnotationComposer get targetCardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GraphLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GraphLinksTable,
          GraphLink,
          $$GraphLinksTableFilterComposer,
          $$GraphLinksTableOrderingComposer,
          $$GraphLinksTableAnnotationComposer,
          $$GraphLinksTableCreateCompanionBuilder,
          $$GraphLinksTableUpdateCompanionBuilder,
          (GraphLink, $$GraphLinksTableReferences),
          GraphLink,
          PrefetchHooks Function({bool sourceCardId, bool targetCardId})
        > {
  $$GraphLinksTableTableManager(_$AppDatabase db, $GraphLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GraphLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GraphLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GraphLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sourceCardId = const Value.absent(),
                Value<String> targetCardId = const Value.absent(),
                Value<String> relationshipType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GraphLinksCompanion(
                sourceCardId: sourceCardId,
                targetCardId: targetCardId,
                relationshipType: relationshipType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sourceCardId,
                required String targetCardId,
                required String relationshipType,
                Value<int> rowid = const Value.absent(),
              }) => GraphLinksCompanion.insert(
                sourceCardId: sourceCardId,
                targetCardId: targetCardId,
                relationshipType: relationshipType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GraphLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sourceCardId = false, targetCardId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sourceCardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceCardId,
                                    referencedTable: $$GraphLinksTableReferences
                                        ._sourceCardIdTable(db),
                                    referencedColumn:
                                        $$GraphLinksTableReferences
                                            ._sourceCardIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (targetCardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.targetCardId,
                                    referencedTable: $$GraphLinksTableReferences
                                        ._targetCardIdTable(db),
                                    referencedColumn:
                                        $$GraphLinksTableReferences
                                            ._targetCardIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$GraphLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GraphLinksTable,
      GraphLink,
      $$GraphLinksTableFilterComposer,
      $$GraphLinksTableOrderingComposer,
      $$GraphLinksTableAnnotationComposer,
      $$GraphLinksTableCreateCompanionBuilder,
      $$GraphLinksTableUpdateCompanionBuilder,
      (GraphLink, $$GraphLinksTableReferences),
      GraphLink,
      PrefetchHooks Function({bool sourceCardId, bool targetCardId})
    >;
typedef $$ProblemPatternsTableCreateCompanionBuilder =
    ProblemPatternsCompanion Function({
      required String id,
      required String cardId,
      required String name,
      required String explanation,
      Value<String?> recognitionTips,
      Value<String?> commonMistakes,
      required String problemsJson,
      Value<String?> difficulty,
      Value<int> rowid,
    });
typedef $$ProblemPatternsTableUpdateCompanionBuilder =
    ProblemPatternsCompanion Function({
      Value<String> id,
      Value<String> cardId,
      Value<String> name,
      Value<String> explanation,
      Value<String?> recognitionTips,
      Value<String?> commonMistakes,
      Value<String> problemsJson,
      Value<String?> difficulty,
      Value<int> rowid,
    });

final class $$ProblemPatternsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProblemPatternsTable, ProblemPattern> {
  $$ProblemPatternsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeCardsTable _cardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('problem_patterns__card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProblemPatternsTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemPatternsTable> {
  $$ProblemPatternsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recognitionTips => $composableBuilder(
    column: $table.recognitionTips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemsJson => $composableBuilder(
    column: $table.problemsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get cardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemPatternsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemPatternsTable> {
  $$ProblemPatternsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recognitionTips => $composableBuilder(
    column: $table.recognitionTips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemsJson => $composableBuilder(
    column: $table.problemsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get cardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemPatternsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemPatternsTable> {
  $$ProblemPatternsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recognitionTips => $composableBuilder(
    column: $table.recognitionTips,
    builder: (column) => column,
  );

  GeneratedColumn<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get problemsJson => $composableBuilder(
    column: $table.problemsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  $$KnowledgeCardsTableAnnotationComposer get cardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemPatternsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemPatternsTable,
          ProblemPattern,
          $$ProblemPatternsTableFilterComposer,
          $$ProblemPatternsTableOrderingComposer,
          $$ProblemPatternsTableAnnotationComposer,
          $$ProblemPatternsTableCreateCompanionBuilder,
          $$ProblemPatternsTableUpdateCompanionBuilder,
          (ProblemPattern, $$ProblemPatternsTableReferences),
          ProblemPattern,
          PrefetchHooks Function({bool cardId})
        > {
  $$ProblemPatternsTableTableManager(
    _$AppDatabase db,
    $ProblemPatternsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemPatternsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemPatternsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProblemPatternsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String?> recognitionTips = const Value.absent(),
                Value<String?> commonMistakes = const Value.absent(),
                Value<String> problemsJson = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemPatternsCompanion(
                id: id,
                cardId: cardId,
                name: name,
                explanation: explanation,
                recognitionTips: recognitionTips,
                commonMistakes: commonMistakes,
                problemsJson: problemsJson,
                difficulty: difficulty,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cardId,
                required String name,
                required String explanation,
                Value<String?> recognitionTips = const Value.absent(),
                Value<String?> commonMistakes = const Value.absent(),
                required String problemsJson,
                Value<String?> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemPatternsCompanion.insert(
                id: id,
                cardId: cardId,
                name: name,
                explanation: explanation,
                recognitionTips: recognitionTips,
                commonMistakes: commonMistakes,
                problemsJson: problemsJson,
                difficulty: difficulty,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemPatternsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable:
                                    $$ProblemPatternsTableReferences
                                        ._cardIdTable(db),
                                referencedColumn:
                                    $$ProblemPatternsTableReferences
                                        ._cardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProblemPatternsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemPatternsTable,
      ProblemPattern,
      $$ProblemPatternsTableFilterComposer,
      $$ProblemPatternsTableOrderingComposer,
      $$ProblemPatternsTableAnnotationComposer,
      $$ProblemPatternsTableCreateCompanionBuilder,
      $$ProblemPatternsTableUpdateCompanionBuilder,
      (ProblemPattern, $$ProblemPatternsTableReferences),
      ProblemPattern,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$LearningProgressTableCreateCompanionBuilder =
    LearningProgressCompanion Function({
      required String cardId,
      Value<String> status,
      Value<int> confidenceLevel,
      Value<DateTime?> lastRevisedAt,
      Value<DateTime?> nextRevisionAt,
      Value<DateTime?> lastOpenedAt,
      Value<double> readingPosition,
      Value<int> rowid,
    });
typedef $$LearningProgressTableUpdateCompanionBuilder =
    LearningProgressCompanion Function({
      Value<String> cardId,
      Value<String> status,
      Value<int> confidenceLevel,
      Value<DateTime?> lastRevisedAt,
      Value<DateTime?> nextRevisionAt,
      Value<DateTime?> lastOpenedAt,
      Value<double> readingPosition,
      Value<int> rowid,
    });

final class $$LearningProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LearningProgressTable,
          LearningProgressData
        > {
  $$LearningProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeCardsTable _cardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('learning_progress__card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LearningProgressTableFilterComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRevisedAt => $composableBuilder(
    column: $table.lastRevisedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get readingPosition => $composableBuilder(
    column: $table.readingPosition,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get cardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LearningProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRevisedAt => $composableBuilder(
    column: $table.lastRevisedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get readingPosition => $composableBuilder(
    column: $table.readingPosition,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get cardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LearningProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastRevisedAt => $composableBuilder(
    column: $table.lastRevisedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get readingPosition => $composableBuilder(
    column: $table.readingPosition,
    builder: (column) => column,
  );

  $$KnowledgeCardsTableAnnotationComposer get cardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LearningProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LearningProgressTable,
          LearningProgressData,
          $$LearningProgressTableFilterComposer,
          $$LearningProgressTableOrderingComposer,
          $$LearningProgressTableAnnotationComposer,
          $$LearningProgressTableCreateCompanionBuilder,
          $$LearningProgressTableUpdateCompanionBuilder,
          (LearningProgressData, $$LearningProgressTableReferences),
          LearningProgressData,
          PrefetchHooks Function({bool cardId})
        > {
  $$LearningProgressTableTableManager(
    _$AppDatabase db,
    $LearningProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cardId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> confidenceLevel = const Value.absent(),
                Value<DateTime?> lastRevisedAt = const Value.absent(),
                Value<DateTime?> nextRevisionAt = const Value.absent(),
                Value<DateTime?> lastOpenedAt = const Value.absent(),
                Value<double> readingPosition = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningProgressCompanion(
                cardId: cardId,
                status: status,
                confidenceLevel: confidenceLevel,
                lastRevisedAt: lastRevisedAt,
                nextRevisionAt: nextRevisionAt,
                lastOpenedAt: lastOpenedAt,
                readingPosition: readingPosition,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cardId,
                Value<String> status = const Value.absent(),
                Value<int> confidenceLevel = const Value.absent(),
                Value<DateTime?> lastRevisedAt = const Value.absent(),
                Value<DateTime?> nextRevisionAt = const Value.absent(),
                Value<DateTime?> lastOpenedAt = const Value.absent(),
                Value<double> readingPosition = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningProgressCompanion.insert(
                cardId: cardId,
                status: status,
                confidenceLevel: confidenceLevel,
                lastRevisedAt: lastRevisedAt,
                nextRevisionAt: nextRevisionAt,
                lastOpenedAt: lastOpenedAt,
                readingPosition: readingPosition,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LearningProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable:
                                    $$LearningProgressTableReferences
                                        ._cardIdTable(db),
                                referencedColumn:
                                    $$LearningProgressTableReferences
                                        ._cardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LearningProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LearningProgressTable,
      LearningProgressData,
      $$LearningProgressTableFilterComposer,
      $$LearningProgressTableOrderingComposer,
      $$LearningProgressTableAnnotationComposer,
      $$LearningProgressTableCreateCompanionBuilder,
      $$LearningProgressTableUpdateCompanionBuilder,
      (LearningProgressData, $$LearningProgressTableReferences),
      LearningProgressData,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$ExtractedConceptsTableCreateCompanionBuilder =
    ExtractedConceptsCompanion Function({
      required String id,
      required String cardId,
      required String name,
      Value<String> conceptType,
      Value<String?> category,
      Value<String?> language,
      required double confidence,
      Value<int> rowid,
    });
typedef $$ExtractedConceptsTableUpdateCompanionBuilder =
    ExtractedConceptsCompanion Function({
      Value<String> id,
      Value<String> cardId,
      Value<String> name,
      Value<String> conceptType,
      Value<String?> category,
      Value<String?> language,
      Value<double> confidence,
      Value<int> rowid,
    });

final class $$ExtractedConceptsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExtractedConceptsTable,
          ExtractedConcept
        > {
  $$ExtractedConceptsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeCardsTable _cardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('extracted_concepts__card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExtractedConceptsTableFilterComposer
    extends Composer<_$AppDatabase, $ExtractedConceptsTable> {
  $$ExtractedConceptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conceptType => $composableBuilder(
    column: $table.conceptType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get cardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExtractedConceptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExtractedConceptsTable> {
  $$ExtractedConceptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conceptType => $composableBuilder(
    column: $table.conceptType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get cardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExtractedConceptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExtractedConceptsTable> {
  $$ExtractedConceptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get conceptType => $composableBuilder(
    column: $table.conceptType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  $$KnowledgeCardsTableAnnotationComposer get cardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExtractedConceptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExtractedConceptsTable,
          ExtractedConcept,
          $$ExtractedConceptsTableFilterComposer,
          $$ExtractedConceptsTableOrderingComposer,
          $$ExtractedConceptsTableAnnotationComposer,
          $$ExtractedConceptsTableCreateCompanionBuilder,
          $$ExtractedConceptsTableUpdateCompanionBuilder,
          (ExtractedConcept, $$ExtractedConceptsTableReferences),
          ExtractedConcept,
          PrefetchHooks Function({bool cardId})
        > {
  $$ExtractedConceptsTableTableManager(
    _$AppDatabase db,
    $ExtractedConceptsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExtractedConceptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExtractedConceptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExtractedConceptsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> conceptType = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExtractedConceptsCompanion(
                id: id,
                cardId: cardId,
                name: name,
                conceptType: conceptType,
                category: category,
                language: language,
                confidence: confidence,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cardId,
                required String name,
                Value<String> conceptType = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> language = const Value.absent(),
                required double confidence,
                Value<int> rowid = const Value.absent(),
              }) => ExtractedConceptsCompanion.insert(
                id: id,
                cardId: cardId,
                name: name,
                conceptType: conceptType,
                category: category,
                language: language,
                confidence: confidence,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExtractedConceptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable:
                                    $$ExtractedConceptsTableReferences
                                        ._cardIdTable(db),
                                referencedColumn:
                                    $$ExtractedConceptsTableReferences
                                        ._cardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExtractedConceptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExtractedConceptsTable,
      ExtractedConcept,
      $$ExtractedConceptsTableFilterComposer,
      $$ExtractedConceptsTableOrderingComposer,
      $$ExtractedConceptsTableAnnotationComposer,
      $$ExtractedConceptsTableCreateCompanionBuilder,
      $$ExtractedConceptsTableUpdateCompanionBuilder,
      (ExtractedConcept, $$ExtractedConceptsTableReferences),
      ExtractedConcept,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$ConceptRelationshipsTableCreateCompanionBuilder =
    ConceptRelationshipsCompanion Function({
      required String id,
      required String cardId,
      required String targetConceptName,
      required String relationshipType,
      required double confidence,
      required String ruleUsed,
      Value<int> rowid,
    });
typedef $$ConceptRelationshipsTableUpdateCompanionBuilder =
    ConceptRelationshipsCompanion Function({
      Value<String> id,
      Value<String> cardId,
      Value<String> targetConceptName,
      Value<String> relationshipType,
      Value<double> confidence,
      Value<String> ruleUsed,
      Value<int> rowid,
    });

final class $$ConceptRelationshipsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ConceptRelationshipsTable,
          ConceptRelationship
        > {
  $$ConceptRelationshipsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeCardsTable _cardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('concept_relationships__card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ConceptRelationshipsTableFilterComposer
    extends Composer<_$AppDatabase, $ConceptRelationshipsTable> {
  $$ConceptRelationshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetConceptName => $composableBuilder(
    column: $table.targetConceptName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleUsed => $composableBuilder(
    column: $table.ruleUsed,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get cardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConceptRelationshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConceptRelationshipsTable> {
  $$ConceptRelationshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetConceptName => $composableBuilder(
    column: $table.targetConceptName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleUsed => $composableBuilder(
    column: $table.ruleUsed,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get cardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConceptRelationshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConceptRelationshipsTable> {
  $$ConceptRelationshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetConceptName => $composableBuilder(
    column: $table.targetConceptName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ruleUsed =>
      $composableBuilder(column: $table.ruleUsed, builder: (column) => column);

  $$KnowledgeCardsTableAnnotationComposer get cardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConceptRelationshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConceptRelationshipsTable,
          ConceptRelationship,
          $$ConceptRelationshipsTableFilterComposer,
          $$ConceptRelationshipsTableOrderingComposer,
          $$ConceptRelationshipsTableAnnotationComposer,
          $$ConceptRelationshipsTableCreateCompanionBuilder,
          $$ConceptRelationshipsTableUpdateCompanionBuilder,
          (ConceptRelationship, $$ConceptRelationshipsTableReferences),
          ConceptRelationship,
          PrefetchHooks Function({bool cardId})
        > {
  $$ConceptRelationshipsTableTableManager(
    _$AppDatabase db,
    $ConceptRelationshipsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConceptRelationshipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConceptRelationshipsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConceptRelationshipsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<String> targetConceptName = const Value.absent(),
                Value<String> relationshipType = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> ruleUsed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConceptRelationshipsCompanion(
                id: id,
                cardId: cardId,
                targetConceptName: targetConceptName,
                relationshipType: relationshipType,
                confidence: confidence,
                ruleUsed: ruleUsed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cardId,
                required String targetConceptName,
                required String relationshipType,
                required double confidence,
                required String ruleUsed,
                Value<int> rowid = const Value.absent(),
              }) => ConceptRelationshipsCompanion.insert(
                id: id,
                cardId: cardId,
                targetConceptName: targetConceptName,
                relationshipType: relationshipType,
                confidence: confidence,
                ruleUsed: ruleUsed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConceptRelationshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable:
                                    $$ConceptRelationshipsTableReferences
                                        ._cardIdTable(db),
                                referencedColumn:
                                    $$ConceptRelationshipsTableReferences
                                        ._cardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ConceptRelationshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConceptRelationshipsTable,
      ConceptRelationship,
      $$ConceptRelationshipsTableFilterComposer,
      $$ConceptRelationshipsTableOrderingComposer,
      $$ConceptRelationshipsTableAnnotationComposer,
      $$ConceptRelationshipsTableCreateCompanionBuilder,
      $$ConceptRelationshipsTableUpdateCompanionBuilder,
      (ConceptRelationship, $$ConceptRelationshipsTableReferences),
      ConceptRelationship,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$SemanticElementsTableCreateCompanionBuilder =
    SemanticElementsCompanion Function({
      required String id,
      required String cardId,
      required String blockId,
      required String elementType,
      required String contentSummary,
      required double confidence,
      required String ruleUsed,
      Value<int> rowid,
    });
typedef $$SemanticElementsTableUpdateCompanionBuilder =
    SemanticElementsCompanion Function({
      Value<String> id,
      Value<String> cardId,
      Value<String> blockId,
      Value<String> elementType,
      Value<String> contentSummary,
      Value<double> confidence,
      Value<String> ruleUsed,
      Value<int> rowid,
    });

final class $$SemanticElementsTableReferences
    extends
        BaseReferences<_$AppDatabase, $SemanticElementsTable, SemanticElement> {
  $$SemanticElementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KnowledgeCardsTable _cardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('semantic_elements__card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SemanticElementsTableFilterComposer
    extends Composer<_$AppDatabase, $SemanticElementsTable> {
  $$SemanticElementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get elementType => $composableBuilder(
    column: $table.elementType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentSummary => $composableBuilder(
    column: $table.contentSummary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleUsed => $composableBuilder(
    column: $table.ruleUsed,
    builder: (column) => ColumnFilters(column),
  );

  $$KnowledgeCardsTableFilterComposer get cardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SemanticElementsTableOrderingComposer
    extends Composer<_$AppDatabase, $SemanticElementsTable> {
  $$SemanticElementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get elementType => $composableBuilder(
    column: $table.elementType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentSummary => $composableBuilder(
    column: $table.contentSummary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleUsed => $composableBuilder(
    column: $table.ruleUsed,
    builder: (column) => ColumnOrderings(column),
  );

  $$KnowledgeCardsTableOrderingComposer get cardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SemanticElementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SemanticElementsTable> {
  $$SemanticElementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get blockId =>
      $composableBuilder(column: $table.blockId, builder: (column) => column);

  GeneratedColumn<String> get elementType => $composableBuilder(
    column: $table.elementType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentSummary => $composableBuilder(
    column: $table.contentSummary,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ruleUsed =>
      $composableBuilder(column: $table.ruleUsed, builder: (column) => column);

  $$KnowledgeCardsTableAnnotationComposer get cardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SemanticElementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SemanticElementsTable,
          SemanticElement,
          $$SemanticElementsTableFilterComposer,
          $$SemanticElementsTableOrderingComposer,
          $$SemanticElementsTableAnnotationComposer,
          $$SemanticElementsTableCreateCompanionBuilder,
          $$SemanticElementsTableUpdateCompanionBuilder,
          (SemanticElement, $$SemanticElementsTableReferences),
          SemanticElement,
          PrefetchHooks Function({bool cardId})
        > {
  $$SemanticElementsTableTableManager(
    _$AppDatabase db,
    $SemanticElementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SemanticElementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SemanticElementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SemanticElementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<String> blockId = const Value.absent(),
                Value<String> elementType = const Value.absent(),
                Value<String> contentSummary = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> ruleUsed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SemanticElementsCompanion(
                id: id,
                cardId: cardId,
                blockId: blockId,
                elementType: elementType,
                contentSummary: contentSummary,
                confidence: confidence,
                ruleUsed: ruleUsed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cardId,
                required String blockId,
                required String elementType,
                required String contentSummary,
                required double confidence,
                required String ruleUsed,
                Value<int> rowid = const Value.absent(),
              }) => SemanticElementsCompanion.insert(
                id: id,
                cardId: cardId,
                blockId: blockId,
                elementType: elementType,
                contentSummary: contentSummary,
                confidence: confidence,
                ruleUsed: ruleUsed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SemanticElementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable:
                                    $$SemanticElementsTableReferences
                                        ._cardIdTable(db),
                                referencedColumn:
                                    $$SemanticElementsTableReferences
                                        ._cardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SemanticElementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SemanticElementsTable,
      SemanticElement,
      $$SemanticElementsTableFilterComposer,
      $$SemanticElementsTableOrderingComposer,
      $$SemanticElementsTableAnnotationComposer,
      $$SemanticElementsTableCreateCompanionBuilder,
      $$SemanticElementsTableUpdateCompanionBuilder,
      (SemanticElement, $$SemanticElementsTableReferences),
      SemanticElement,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$ProblemsTableCreateCompanionBuilder =
    ProblemsCompanion Function({
      required String id,
      required String title,
      Value<String?> platform,
      Value<String?> difficulty,
      Value<String?> sourceUrl,
      Value<int?> estimatedTimeMinutes,
      Value<double?> frequency,
      Value<int> rowid,
    });
typedef $$ProblemsTableUpdateCompanionBuilder =
    ProblemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> platform,
      Value<String?> difficulty,
      Value<String?> sourceUrl,
      Value<int?> estimatedTimeMinutes,
      Value<double?> frequency,
      Value<int> rowid,
    });

final class $$ProblemsTableReferences
    extends BaseReferences<_$AppDatabase, $ProblemsTable, Problem> {
  $$ProblemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ProblemConceptLinksTable,
    List<ProblemConceptLink>
  >
  _problemConceptLinksRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.problemConceptLinks,
        aliasName: 'problems__id__problem_concept_links__problem_id',
      );

  $$ProblemConceptLinksTableProcessedTableManager get problemConceptLinksRefs {
    final manager = $$ProblemConceptLinksTableTableManager(
      $_db,
      $_db.problemConceptLinks,
    ).filter((f) => f.problemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _problemConceptLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProblemProgressTable, List<ProblemProgressData>>
  _problemProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.problemProgress,
    aliasName: 'problems__id__problem_progress__problem_id',
  );

  $$ProblemProgressTableProcessedTableManager get problemProgressRefs {
    final manager = $$ProblemProgressTableTableManager(
      $_db,
      $_db.problemProgress,
    ).filter((f) => f.problemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _problemProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProblemsTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedTimeMinutes => $composableBuilder(
    column: $table.estimatedTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> problemConceptLinksRefs(
    Expression<bool> Function($$ProblemConceptLinksTableFilterComposer f) f,
  ) {
    final $$ProblemConceptLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.problemConceptLinks,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemConceptLinksTableFilterComposer(
            $db: $db,
            $table: $db.problemConceptLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> problemProgressRefs(
    Expression<bool> Function($$ProblemProgressTableFilterComposer f) f,
  ) {
    final $$ProblemProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.problemProgress,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemProgressTableFilterComposer(
            $db: $db,
            $table: $db.problemProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProblemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedTimeMinutes => $composableBuilder(
    column: $table.estimatedTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProblemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<int> get estimatedTimeMinutes => $composableBuilder(
    column: $table.estimatedTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  Expression<T> problemConceptLinksRefs<T extends Object>(
    Expression<T> Function($$ProblemConceptLinksTableAnnotationComposer a) f,
  ) {
    final $$ProblemConceptLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.problemConceptLinks,
          getReferencedColumn: (t) => t.problemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProblemConceptLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.problemConceptLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> problemProgressRefs<T extends Object>(
    Expression<T> Function($$ProblemProgressTableAnnotationComposer a) f,
  ) {
    final $$ProblemProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.problemProgress,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.problemProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProblemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemsTable,
          Problem,
          $$ProblemsTableFilterComposer,
          $$ProblemsTableOrderingComposer,
          $$ProblemsTableAnnotationComposer,
          $$ProblemsTableCreateCompanionBuilder,
          $$ProblemsTableUpdateCompanionBuilder,
          (Problem, $$ProblemsTableReferences),
          Problem,
          PrefetchHooks Function({
            bool problemConceptLinksRefs,
            bool problemProgressRefs,
          })
        > {
  $$ProblemsTableTableManager(_$AppDatabase db, $ProblemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProblemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> platform = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<int?> estimatedTimeMinutes = const Value.absent(),
                Value<double?> frequency = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemsCompanion(
                id: id,
                title: title,
                platform: platform,
                difficulty: difficulty,
                sourceUrl: sourceUrl,
                estimatedTimeMinutes: estimatedTimeMinutes,
                frequency: frequency,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> platform = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<int?> estimatedTimeMinutes = const Value.absent(),
                Value<double?> frequency = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemsCompanion.insert(
                id: id,
                title: title,
                platform: platform,
                difficulty: difficulty,
                sourceUrl: sourceUrl,
                estimatedTimeMinutes: estimatedTimeMinutes,
                frequency: frequency,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({problemConceptLinksRefs = false, problemProgressRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (problemConceptLinksRefs) db.problemConceptLinks,
                    if (problemProgressRefs) db.problemProgress,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (problemConceptLinksRefs)
                        await $_getPrefetchedData<
                          Problem,
                          $ProblemsTable,
                          ProblemConceptLink
                        >(
                          currentTable: table,
                          referencedTable: $$ProblemsTableReferences
                              ._problemConceptLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProblemsTableReferences(
                                db,
                                table,
                                p0,
                              ).problemConceptLinksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.problemId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (problemProgressRefs)
                        await $_getPrefetchedData<
                          Problem,
                          $ProblemsTable,
                          ProblemProgressData
                        >(
                          currentTable: table,
                          referencedTable: $$ProblemsTableReferences
                              ._problemProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProblemsTableReferences(
                                db,
                                table,
                                p0,
                              ).problemProgressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.problemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProblemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemsTable,
      Problem,
      $$ProblemsTableFilterComposer,
      $$ProblemsTableOrderingComposer,
      $$ProblemsTableAnnotationComposer,
      $$ProblemsTableCreateCompanionBuilder,
      $$ProblemsTableUpdateCompanionBuilder,
      (Problem, $$ProblemsTableReferences),
      Problem,
      PrefetchHooks Function({
        bool problemConceptLinksRefs,
        bool problemProgressRefs,
      })
    >;
typedef $$ProblemConceptLinksTableCreateCompanionBuilder =
    ProblemConceptLinksCompanion Function({
      required String problemId,
      required String conceptName,
      Value<int> rowid,
    });
typedef $$ProblemConceptLinksTableUpdateCompanionBuilder =
    ProblemConceptLinksCompanion Function({
      Value<String> problemId,
      Value<String> conceptName,
      Value<int> rowid,
    });

final class $$ProblemConceptLinksTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProblemConceptLinksTable,
          ProblemConceptLink
        > {
  $$ProblemConceptLinksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProblemsTable _problemIdTable(_$AppDatabase db) => db.problems
      .createAlias('problem_concept_links__problem_id__problems__id');

  $$ProblemsTableProcessedTableManager get problemId {
    final $_column = $_itemColumn<String>('problem_id')!;

    final manager = $$ProblemsTableTableManager(
      $_db,
      $_db.problems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_problemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProblemConceptLinksTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemConceptLinksTable> {
  $$ProblemConceptLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnFilters(column),
  );

  $$ProblemsTableFilterComposer get problemId {
    final $$ProblemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableFilterComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemConceptLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemConceptLinksTable> {
  $$ProblemConceptLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProblemsTableOrderingComposer get problemId {
    final $$ProblemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableOrderingComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemConceptLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemConceptLinksTable> {
  $$ProblemConceptLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => column,
  );

  $$ProblemsTableAnnotationComposer get problemId {
    final $$ProblemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableAnnotationComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemConceptLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemConceptLinksTable,
          ProblemConceptLink,
          $$ProblemConceptLinksTableFilterComposer,
          $$ProblemConceptLinksTableOrderingComposer,
          $$ProblemConceptLinksTableAnnotationComposer,
          $$ProblemConceptLinksTableCreateCompanionBuilder,
          $$ProblemConceptLinksTableUpdateCompanionBuilder,
          (ProblemConceptLink, $$ProblemConceptLinksTableReferences),
          ProblemConceptLink,
          PrefetchHooks Function({bool problemId})
        > {
  $$ProblemConceptLinksTableTableManager(
    _$AppDatabase db,
    $ProblemConceptLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemConceptLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemConceptLinksTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProblemConceptLinksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> problemId = const Value.absent(),
                Value<String> conceptName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemConceptLinksCompanion(
                problemId: problemId,
                conceptName: conceptName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String problemId,
                required String conceptName,
                Value<int> rowid = const Value.absent(),
              }) => ProblemConceptLinksCompanion.insert(
                problemId: problemId,
                conceptName: conceptName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemConceptLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (problemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.problemId,
                                referencedTable:
                                    $$ProblemConceptLinksTableReferences
                                        ._problemIdTable(db),
                                referencedColumn:
                                    $$ProblemConceptLinksTableReferences
                                        ._problemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProblemConceptLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemConceptLinksTable,
      ProblemConceptLink,
      $$ProblemConceptLinksTableFilterComposer,
      $$ProblemConceptLinksTableOrderingComposer,
      $$ProblemConceptLinksTableAnnotationComposer,
      $$ProblemConceptLinksTableCreateCompanionBuilder,
      $$ProblemConceptLinksTableUpdateCompanionBuilder,
      (ProblemConceptLink, $$ProblemConceptLinksTableReferences),
      ProblemConceptLink,
      PrefetchHooks Function({bool problemId})
    >;
typedef $$ProblemProgressTableCreateCompanionBuilder =
    ProblemProgressCompanion Function({
      required String problemId,
      Value<String> status,
      Value<int> confidenceLevel,
      Value<DateTime?> lastAttemptedAt,
      Value<DateTime?> nextRevisionAt,
      Value<int> rowid,
    });
typedef $$ProblemProgressTableUpdateCompanionBuilder =
    ProblemProgressCompanion Function({
      Value<String> problemId,
      Value<String> status,
      Value<int> confidenceLevel,
      Value<DateTime?> lastAttemptedAt,
      Value<DateTime?> nextRevisionAt,
      Value<int> rowid,
    });

final class $$ProblemProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProblemProgressTable,
          ProblemProgressData
        > {
  $$ProblemProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProblemsTable _problemIdTable(_$AppDatabase db) =>
      db.problems.createAlias('problem_progress__problem_id__problems__id');

  $$ProblemsTableProcessedTableManager get problemId {
    final $_column = $_itemColumn<String>('problem_id')!;

    final manager = $$ProblemsTableTableManager(
      $_db,
      $_db.problems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_problemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProblemProgressTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemProgressTable> {
  $$ProblemProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProblemsTableFilterComposer get problemId {
    final $$ProblemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableFilterComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemProgressTable> {
  $$ProblemProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProblemsTableOrderingComposer get problemId {
    final $$ProblemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableOrderingComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemProgressTable> {
  $$ProblemProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get confidenceLevel => $composableBuilder(
    column: $table.confidenceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextRevisionAt => $composableBuilder(
    column: $table.nextRevisionAt,
    builder: (column) => column,
  );

  $$ProblemsTableAnnotationComposer get problemId {
    final $$ProblemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableAnnotationComposer(
            $db: $db,
            $table: $db.problems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemProgressTable,
          ProblemProgressData,
          $$ProblemProgressTableFilterComposer,
          $$ProblemProgressTableOrderingComposer,
          $$ProblemProgressTableAnnotationComposer,
          $$ProblemProgressTableCreateCompanionBuilder,
          $$ProblemProgressTableUpdateCompanionBuilder,
          (ProblemProgressData, $$ProblemProgressTableReferences),
          ProblemProgressData,
          PrefetchHooks Function({bool problemId})
        > {
  $$ProblemProgressTableTableManager(
    _$AppDatabase db,
    $ProblemProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProblemProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> problemId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> confidenceLevel = const Value.absent(),
                Value<DateTime?> lastAttemptedAt = const Value.absent(),
                Value<DateTime?> nextRevisionAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemProgressCompanion(
                problemId: problemId,
                status: status,
                confidenceLevel: confidenceLevel,
                lastAttemptedAt: lastAttemptedAt,
                nextRevisionAt: nextRevisionAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String problemId,
                Value<String> status = const Value.absent(),
                Value<int> confidenceLevel = const Value.absent(),
                Value<DateTime?> lastAttemptedAt = const Value.absent(),
                Value<DateTime?> nextRevisionAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemProgressCompanion.insert(
                problemId: problemId,
                status: status,
                confidenceLevel: confidenceLevel,
                lastAttemptedAt: lastAttemptedAt,
                nextRevisionAt: nextRevisionAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (problemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.problemId,
                                referencedTable:
                                    $$ProblemProgressTableReferences
                                        ._problemIdTable(db),
                                referencedColumn:
                                    $$ProblemProgressTableReferences
                                        ._problemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProblemProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemProgressTable,
      ProblemProgressData,
      $$ProblemProgressTableFilterComposer,
      $$ProblemProgressTableOrderingComposer,
      $$ProblemProgressTableAnnotationComposer,
      $$ProblemProgressTableCreateCompanionBuilder,
      $$ProblemProgressTableUpdateCompanionBuilder,
      (ProblemProgressData, $$ProblemProgressTableReferences),
      ProblemProgressData,
      PrefetchHooks Function({bool problemId})
    >;
typedef $$RoadmapsTableCreateCompanionBuilder =
    RoadmapsCompanion Function({
      required String id,
      required String title,
      Value<String?> description,
      Value<String?> category,
      Value<String> roadmapType,
      Value<int> rowid,
    });
typedef $$RoadmapsTableUpdateCompanionBuilder =
    RoadmapsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> description,
      Value<String?> category,
      Value<String> roadmapType,
      Value<int> rowid,
    });

final class $$RoadmapsTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapsTable, Roadmap> {
  $$RoadmapsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoadmapModulesTable, List<RoadmapModule>>
  _roadmapModulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.roadmapModules,
    aliasName: 'roadmaps__id__roadmap_modules__roadmap_id',
  );

  $$RoadmapModulesTableProcessedTableManager get roadmapModulesRefs {
    final manager = $$RoadmapModulesTableTableManager(
      $_db,
      $_db.roadmapModules,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roadmapModulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UserRoadmapProgressTable,
    List<UserRoadmapProgressData>
  >
  _userRoadmapProgressRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userRoadmapProgress,
        aliasName: 'roadmaps__id__user_roadmap_progress__roadmap_id',
      );

  $$UserRoadmapProgressTableProcessedTableManager get userRoadmapProgressRefs {
    final manager = $$UserRoadmapProgressTableTableManager(
      $_db,
      $_db.userRoadmapProgress,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userRoadmapProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoadmapsTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roadmapType => $composableBuilder(
    column: $table.roadmapType,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roadmapModulesRefs(
    Expression<bool> Function($$RoadmapModulesTableFilterComposer f) f,
  ) {
    final $$RoadmapModulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapModules,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapModulesTableFilterComposer(
            $db: $db,
            $table: $db.roadmapModules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userRoadmapProgressRefs(
    Expression<bool> Function($$UserRoadmapProgressTableFilterComposer f) f,
  ) {
    final $$UserRoadmapProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userRoadmapProgress,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserRoadmapProgressTableFilterComposer(
            $db: $db,
            $table: $db.userRoadmapProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roadmapType => $composableBuilder(
    column: $table.roadmapType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoadmapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get roadmapType => $composableBuilder(
    column: $table.roadmapType,
    builder: (column) => column,
  );

  Expression<T> roadmapModulesRefs<T extends Object>(
    Expression<T> Function($$RoadmapModulesTableAnnotationComposer a) f,
  ) {
    final $$RoadmapModulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapModules,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapModulesTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapModules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userRoadmapProgressRefs<T extends Object>(
    Expression<T> Function($$UserRoadmapProgressTableAnnotationComposer a) f,
  ) {
    final $$UserRoadmapProgressTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userRoadmapProgress,
          getReferencedColumn: (t) => t.roadmapId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserRoadmapProgressTableAnnotationComposer(
                $db: $db,
                $table: $db.userRoadmapProgress,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoadmapsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapsTable,
          Roadmap,
          $$RoadmapsTableFilterComposer,
          $$RoadmapsTableOrderingComposer,
          $$RoadmapsTableAnnotationComposer,
          $$RoadmapsTableCreateCompanionBuilder,
          $$RoadmapsTableUpdateCompanionBuilder,
          (Roadmap, $$RoadmapsTableReferences),
          Roadmap,
          PrefetchHooks Function({
            bool roadmapModulesRefs,
            bool userRoadmapProgressRefs,
          })
        > {
  $$RoadmapsTableTableManager(_$AppDatabase db, $RoadmapsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String> roadmapType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                roadmapType: roadmapType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String> roadmapType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                roadmapType: roadmapType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoadmapsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({roadmapModulesRefs = false, userRoadmapProgressRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roadmapModulesRefs) db.roadmapModules,
                    if (userRoadmapProgressRefs) db.userRoadmapProgress,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roadmapModulesRefs)
                        await $_getPrefetchedData<
                          Roadmap,
                          $RoadmapsTable,
                          RoadmapModule
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._roadmapModulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).roadmapModulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userRoadmapProgressRefs)
                        await $_getPrefetchedData<
                          Roadmap,
                          $RoadmapsTable,
                          UserRoadmapProgressData
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._userRoadmapProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).userRoadmapProgressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoadmapsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapsTable,
      Roadmap,
      $$RoadmapsTableFilterComposer,
      $$RoadmapsTableOrderingComposer,
      $$RoadmapsTableAnnotationComposer,
      $$RoadmapsTableCreateCompanionBuilder,
      $$RoadmapsTableUpdateCompanionBuilder,
      (Roadmap, $$RoadmapsTableReferences),
      Roadmap,
      PrefetchHooks Function({
        bool roadmapModulesRefs,
        bool userRoadmapProgressRefs,
      })
    >;
typedef $$RoadmapModulesTableCreateCompanionBuilder =
    RoadmapModulesCompanion Function({
      required String id,
      required String roadmapId,
      required String title,
      required int orderIndex,
      Value<String> moduleType,
      Value<int> rowid,
    });
typedef $$RoadmapModulesTableUpdateCompanionBuilder =
    RoadmapModulesCompanion Function({
      Value<String> id,
      Value<String> roadmapId,
      Value<String> title,
      Value<int> orderIndex,
      Value<String> moduleType,
      Value<int> rowid,
    });

final class $$RoadmapModulesTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapModulesTable, RoadmapModule> {
  $$RoadmapModulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) =>
      db.roadmaps.createAlias('roadmap_modules__roadmap_id__roadmaps__id');

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RoadmapNodesTable, List<RoadmapNode>>
  _roadmapNodesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.roadmapNodes,
    aliasName: 'roadmap_modules__id__roadmap_nodes__module_id',
  );

  $$RoadmapNodesTableProcessedTableManager get roadmapNodesRefs {
    final manager = $$RoadmapNodesTableTableManager(
      $_db,
      $_db.roadmapNodes,
    ).filter((f) => f.moduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roadmapNodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoadmapModulesTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapModulesTable> {
  $$RoadmapModulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moduleType => $composableBuilder(
    column: $table.moduleType,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> roadmapNodesRefs(
    Expression<bool> Function($$RoadmapNodesTableFilterComposer f) f,
  ) {
    final $$RoadmapNodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapNodes,
      getReferencedColumn: (t) => t.moduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapNodesTableFilterComposer(
            $db: $db,
            $table: $db.roadmapNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapModulesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapModulesTable> {
  $$RoadmapModulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moduleType => $composableBuilder(
    column: $table.moduleType,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoadmapModulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapModulesTable> {
  $$RoadmapModulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moduleType => $composableBuilder(
    column: $table.moduleType,
    builder: (column) => column,
  );

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> roadmapNodesRefs<T extends Object>(
    Expression<T> Function($$RoadmapNodesTableAnnotationComposer a) f,
  ) {
    final $$RoadmapNodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapNodes,
      getReferencedColumn: (t) => t.moduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapNodesTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapNodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapModulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapModulesTable,
          RoadmapModule,
          $$RoadmapModulesTableFilterComposer,
          $$RoadmapModulesTableOrderingComposer,
          $$RoadmapModulesTableAnnotationComposer,
          $$RoadmapModulesTableCreateCompanionBuilder,
          $$RoadmapModulesTableUpdateCompanionBuilder,
          (RoadmapModule, $$RoadmapModulesTableReferences),
          RoadmapModule,
          PrefetchHooks Function({bool roadmapId, bool roadmapNodesRefs})
        > {
  $$RoadmapModulesTableTableManager(
    _$AppDatabase db,
    $RoadmapModulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapModulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapModulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapModulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roadmapId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> moduleType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapModulesCompanion(
                id: id,
                roadmapId: roadmapId,
                title: title,
                orderIndex: orderIndex,
                moduleType: moduleType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roadmapId,
                required String title,
                required int orderIndex,
                Value<String> moduleType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapModulesCompanion.insert(
                id: id,
                roadmapId: roadmapId,
                title: title,
                orderIndex: orderIndex,
                moduleType: moduleType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoadmapModulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({roadmapId = false, roadmapNodesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roadmapNodesRefs) db.roadmapNodes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roadmapId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roadmapId,
                                    referencedTable:
                                        $$RoadmapModulesTableReferences
                                            ._roadmapIdTable(db),
                                    referencedColumn:
                                        $$RoadmapModulesTableReferences
                                            ._roadmapIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roadmapNodesRefs)
                        await $_getPrefetchedData<
                          RoadmapModule,
                          $RoadmapModulesTable,
                          RoadmapNode
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapModulesTableReferences
                              ._roadmapNodesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapModulesTableReferences(
                                db,
                                table,
                                p0,
                              ).roadmapNodesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.moduleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoadmapModulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapModulesTable,
      RoadmapModule,
      $$RoadmapModulesTableFilterComposer,
      $$RoadmapModulesTableOrderingComposer,
      $$RoadmapModulesTableAnnotationComposer,
      $$RoadmapModulesTableCreateCompanionBuilder,
      $$RoadmapModulesTableUpdateCompanionBuilder,
      (RoadmapModule, $$RoadmapModulesTableReferences),
      RoadmapModule,
      PrefetchHooks Function({bool roadmapId, bool roadmapNodesRefs})
    >;
typedef $$RoadmapNodesTableCreateCompanionBuilder =
    RoadmapNodesCompanion Function({
      required String id,
      required String moduleId,
      required String conceptName,
      Value<String?> linkedCardId,
      required int orderIndex,
      Value<bool> isCheckpoint,
      Value<int> rowid,
    });
typedef $$RoadmapNodesTableUpdateCompanionBuilder =
    RoadmapNodesCompanion Function({
      Value<String> id,
      Value<String> moduleId,
      Value<String> conceptName,
      Value<String?> linkedCardId,
      Value<int> orderIndex,
      Value<bool> isCheckpoint,
      Value<int> rowid,
    });

final class $$RoadmapNodesTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapNodesTable, RoadmapNode> {
  $$RoadmapNodesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoadmapModulesTable _moduleIdTable(_$AppDatabase db) => db
      .roadmapModules
      .createAlias('roadmap_nodes__module_id__roadmap_modules__id');

  $$RoadmapModulesTableProcessedTableManager get moduleId {
    final $_column = $_itemColumn<String>('module_id')!;

    final manager = $$RoadmapModulesTableTableManager(
      $_db,
      $_db.roadmapModules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $KnowledgeCardsTable _linkedCardIdTable(_$AppDatabase db) => db
      .knowledgeCards
      .createAlias('roadmap_nodes__linked_card_id__knowledge_cards__id');

  $$KnowledgeCardsTableProcessedTableManager? get linkedCardId {
    final $_column = $_itemColumn<String>('linked_card_id');
    if ($_column == null) return null;
    final manager = $$KnowledgeCardsTableTableManager(
      $_db,
      $_db.knowledgeCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_linkedCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoadmapNodesTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapNodesTable> {
  $$RoadmapNodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCheckpoint => $composableBuilder(
    column: $table.isCheckpoint,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapModulesTableFilterComposer get moduleId {
    final $$RoadmapModulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.roadmapModules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapModulesTableFilterComposer(
            $db: $db,
            $table: $db.roadmapModules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableFilterComposer get linkedCardId {
    final $$KnowledgeCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableFilterComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoadmapNodesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapNodesTable> {
  $$RoadmapNodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCheckpoint => $composableBuilder(
    column: $table.isCheckpoint,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapModulesTableOrderingComposer get moduleId {
    final $$RoadmapModulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.roadmapModules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapModulesTableOrderingComposer(
            $db: $db,
            $table: $db.roadmapModules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableOrderingComposer get linkedCardId {
    final $$KnowledgeCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableOrderingComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoadmapNodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapNodesTable> {
  $$RoadmapNodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCheckpoint => $composableBuilder(
    column: $table.isCheckpoint,
    builder: (column) => column,
  );

  $$RoadmapModulesTableAnnotationComposer get moduleId {
    final $$RoadmapModulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.roadmapModules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapModulesTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapModules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KnowledgeCardsTableAnnotationComposer get linkedCardId {
    final $$KnowledgeCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedCardId,
      referencedTable: $db.knowledgeCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KnowledgeCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.knowledgeCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoadmapNodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapNodesTable,
          RoadmapNode,
          $$RoadmapNodesTableFilterComposer,
          $$RoadmapNodesTableOrderingComposer,
          $$RoadmapNodesTableAnnotationComposer,
          $$RoadmapNodesTableCreateCompanionBuilder,
          $$RoadmapNodesTableUpdateCompanionBuilder,
          (RoadmapNode, $$RoadmapNodesTableReferences),
          RoadmapNode,
          PrefetchHooks Function({bool moduleId, bool linkedCardId})
        > {
  $$RoadmapNodesTableTableManager(_$AppDatabase db, $RoadmapNodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapNodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapNodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapNodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> moduleId = const Value.absent(),
                Value<String> conceptName = const Value.absent(),
                Value<String?> linkedCardId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<bool> isCheckpoint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapNodesCompanion(
                id: id,
                moduleId: moduleId,
                conceptName: conceptName,
                linkedCardId: linkedCardId,
                orderIndex: orderIndex,
                isCheckpoint: isCheckpoint,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String moduleId,
                required String conceptName,
                Value<String?> linkedCardId = const Value.absent(),
                required int orderIndex,
                Value<bool> isCheckpoint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapNodesCompanion.insert(
                id: id,
                moduleId: moduleId,
                conceptName: conceptName,
                linkedCardId: linkedCardId,
                orderIndex: orderIndex,
                isCheckpoint: isCheckpoint,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoadmapNodesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({moduleId = false, linkedCardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (moduleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.moduleId,
                                referencedTable: $$RoadmapNodesTableReferences
                                    ._moduleIdTable(db),
                                referencedColumn: $$RoadmapNodesTableReferences
                                    ._moduleIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (linkedCardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.linkedCardId,
                                referencedTable: $$RoadmapNodesTableReferences
                                    ._linkedCardIdTable(db),
                                referencedColumn: $$RoadmapNodesTableReferences
                                    ._linkedCardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoadmapNodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapNodesTable,
      RoadmapNode,
      $$RoadmapNodesTableFilterComposer,
      $$RoadmapNodesTableOrderingComposer,
      $$RoadmapNodesTableAnnotationComposer,
      $$RoadmapNodesTableCreateCompanionBuilder,
      $$RoadmapNodesTableUpdateCompanionBuilder,
      (RoadmapNode, $$RoadmapNodesTableReferences),
      RoadmapNode,
      PrefetchHooks Function({bool moduleId, bool linkedCardId})
    >;
typedef $$UserRoadmapProgressTableCreateCompanionBuilder =
    UserRoadmapProgressCompanion Function({
      required String roadmapId,
      Value<String?> activeNodeId,
      Value<DateTime?> lastAccessedAt,
      Value<int> rowid,
    });
typedef $$UserRoadmapProgressTableUpdateCompanionBuilder =
    UserRoadmapProgressCompanion Function({
      Value<String> roadmapId,
      Value<String?> activeNodeId,
      Value<DateTime?> lastAccessedAt,
      Value<int> rowid,
    });

final class $$UserRoadmapProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserRoadmapProgressTable,
          UserRoadmapProgressData
        > {
  $$UserRoadmapProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) => db.roadmaps
      .createAlias('user_roadmap_progress__roadmap_id__roadmaps__id');

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserRoadmapProgressTableFilterComposer
    extends Composer<_$AppDatabase, $UserRoadmapProgressTable> {
  $$UserRoadmapProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get activeNodeId => $composableBuilder(
    column: $table.activeNodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRoadmapProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $UserRoadmapProgressTable> {
  $$UserRoadmapProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get activeNodeId => $composableBuilder(
    column: $table.activeNodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRoadmapProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserRoadmapProgressTable> {
  $$UserRoadmapProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get activeNodeId => $composableBuilder(
    column: $table.activeNodeId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => column,
  );

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserRoadmapProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserRoadmapProgressTable,
          UserRoadmapProgressData,
          $$UserRoadmapProgressTableFilterComposer,
          $$UserRoadmapProgressTableOrderingComposer,
          $$UserRoadmapProgressTableAnnotationComposer,
          $$UserRoadmapProgressTableCreateCompanionBuilder,
          $$UserRoadmapProgressTableUpdateCompanionBuilder,
          (UserRoadmapProgressData, $$UserRoadmapProgressTableReferences),
          UserRoadmapProgressData,
          PrefetchHooks Function({bool roadmapId})
        > {
  $$UserRoadmapProgressTableTableManager(
    _$AppDatabase db,
    $UserRoadmapProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserRoadmapProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserRoadmapProgressTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UserRoadmapProgressTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> roadmapId = const Value.absent(),
                Value<String?> activeNodeId = const Value.absent(),
                Value<DateTime?> lastAccessedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserRoadmapProgressCompanion(
                roadmapId: roadmapId,
                activeNodeId: activeNodeId,
                lastAccessedAt: lastAccessedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String roadmapId,
                Value<String?> activeNodeId = const Value.absent(),
                Value<DateTime?> lastAccessedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserRoadmapProgressCompanion.insert(
                roadmapId: roadmapId,
                activeNodeId: activeNodeId,
                lastAccessedAt: lastAccessedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserRoadmapProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roadmapId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roadmapId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roadmapId,
                                referencedTable:
                                    $$UserRoadmapProgressTableReferences
                                        ._roadmapIdTable(db),
                                referencedColumn:
                                    $$UserRoadmapProgressTableReferences
                                        ._roadmapIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserRoadmapProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserRoadmapProgressTable,
      UserRoadmapProgressData,
      $$UserRoadmapProgressTableFilterComposer,
      $$UserRoadmapProgressTableOrderingComposer,
      $$UserRoadmapProgressTableAnnotationComposer,
      $$UserRoadmapProgressTableCreateCompanionBuilder,
      $$UserRoadmapProgressTableUpdateCompanionBuilder,
      (UserRoadmapProgressData, $$UserRoadmapProgressTableReferences),
      UserRoadmapProgressData,
      PrefetchHooks Function({bool roadmapId})
    >;
typedef $$GlobalWorkspaceTableCreateCompanionBuilder =
    GlobalWorkspaceCompanion Function({
      Value<int> id,
      Value<String> content,
      Value<DateTime> updatedAt,
    });
typedef $$GlobalWorkspaceTableUpdateCompanionBuilder =
    GlobalWorkspaceCompanion Function({
      Value<int> id,
      Value<String> content,
      Value<DateTime> updatedAt,
    });

class $$GlobalWorkspaceTableFilterComposer
    extends Composer<_$AppDatabase, $GlobalWorkspaceTable> {
  $$GlobalWorkspaceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GlobalWorkspaceTableOrderingComposer
    extends Composer<_$AppDatabase, $GlobalWorkspaceTable> {
  $$GlobalWorkspaceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GlobalWorkspaceTableAnnotationComposer
    extends Composer<_$AppDatabase, $GlobalWorkspaceTable> {
  $$GlobalWorkspaceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GlobalWorkspaceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GlobalWorkspaceTable,
          GlobalWorkspaceData,
          $$GlobalWorkspaceTableFilterComposer,
          $$GlobalWorkspaceTableOrderingComposer,
          $$GlobalWorkspaceTableAnnotationComposer,
          $$GlobalWorkspaceTableCreateCompanionBuilder,
          $$GlobalWorkspaceTableUpdateCompanionBuilder,
          (
            GlobalWorkspaceData,
            BaseReferences<
              _$AppDatabase,
              $GlobalWorkspaceTable,
              GlobalWorkspaceData
            >,
          ),
          GlobalWorkspaceData,
          PrefetchHooks Function()
        > {
  $$GlobalWorkspaceTableTableManager(
    _$AppDatabase db,
    $GlobalWorkspaceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GlobalWorkspaceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GlobalWorkspaceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GlobalWorkspaceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GlobalWorkspaceCompanion(
                id: id,
                content: content,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GlobalWorkspaceCompanion.insert(
                id: id,
                content: content,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GlobalWorkspaceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GlobalWorkspaceTable,
      GlobalWorkspaceData,
      $$GlobalWorkspaceTableFilterComposer,
      $$GlobalWorkspaceTableOrderingComposer,
      $$GlobalWorkspaceTableAnnotationComposer,
      $$GlobalWorkspaceTableCreateCompanionBuilder,
      $$GlobalWorkspaceTableUpdateCompanionBuilder,
      (
        GlobalWorkspaceData,
        BaseReferences<
          _$AppDatabase,
          $GlobalWorkspaceTable,
          GlobalWorkspaceData
        >,
      ),
      GlobalWorkspaceData,
      PrefetchHooks Function()
    >;
typedef $$ConceptNotesTableCreateCompanionBuilder =
    ConceptNotesCompanion Function({
      required String conceptName,
      Value<String> content,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ConceptNotesTableUpdateCompanionBuilder =
    ConceptNotesCompanion Function({
      Value<String> conceptName,
      Value<String> content,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ConceptNotesTableFilterComposer
    extends Composer<_$AppDatabase, $ConceptNotesTable> {
  $$ConceptNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConceptNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $ConceptNotesTable> {
  $$ConceptNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConceptNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConceptNotesTable> {
  $$ConceptNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ConceptNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConceptNotesTable,
          ConceptNote,
          $$ConceptNotesTableFilterComposer,
          $$ConceptNotesTableOrderingComposer,
          $$ConceptNotesTableAnnotationComposer,
          $$ConceptNotesTableCreateCompanionBuilder,
          $$ConceptNotesTableUpdateCompanionBuilder,
          (
            ConceptNote,
            BaseReferences<_$AppDatabase, $ConceptNotesTable, ConceptNote>,
          ),
          ConceptNote,
          PrefetchHooks Function()
        > {
  $$ConceptNotesTableTableManager(_$AppDatabase db, $ConceptNotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConceptNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConceptNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConceptNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> conceptName = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConceptNotesCompanion(
                conceptName: conceptName,
                content: content,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String conceptName,
                Value<String> content = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConceptNotesCompanion.insert(
                conceptName: conceptName,
                content: content,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConceptNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConceptNotesTable,
      ConceptNote,
      $$ConceptNotesTableFilterComposer,
      $$ConceptNotesTableOrderingComposer,
      $$ConceptNotesTableAnnotationComposer,
      $$ConceptNotesTableCreateCompanionBuilder,
      $$ConceptNotesTableUpdateCompanionBuilder,
      (
        ConceptNote,
        BaseReferences<_$AppDatabase, $ConceptNotesTable, ConceptNote>,
      ),
      ConceptNote,
      PrefetchHooks Function()
    >;
typedef $$BlockAnnotationsTableCreateCompanionBuilder =
    BlockAnnotationsCompanion Function({
      required String blockId,
      required String noteText,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$BlockAnnotationsTableUpdateCompanionBuilder =
    BlockAnnotationsCompanion Function({
      Value<String> blockId,
      Value<String> noteText,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$BlockAnnotationsTableFilterComposer
    extends Composer<_$AppDatabase, $BlockAnnotationsTable> {
  $$BlockAnnotationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteText => $composableBuilder(
    column: $table.noteText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BlockAnnotationsTableOrderingComposer
    extends Composer<_$AppDatabase, $BlockAnnotationsTable> {
  $$BlockAnnotationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteText => $composableBuilder(
    column: $table.noteText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BlockAnnotationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BlockAnnotationsTable> {
  $$BlockAnnotationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get blockId =>
      $composableBuilder(column: $table.blockId, builder: (column) => column);

  GeneratedColumn<String> get noteText =>
      $composableBuilder(column: $table.noteText, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BlockAnnotationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BlockAnnotationsTable,
          BlockAnnotation,
          $$BlockAnnotationsTableFilterComposer,
          $$BlockAnnotationsTableOrderingComposer,
          $$BlockAnnotationsTableAnnotationComposer,
          $$BlockAnnotationsTableCreateCompanionBuilder,
          $$BlockAnnotationsTableUpdateCompanionBuilder,
          (
            BlockAnnotation,
            BaseReferences<
              _$AppDatabase,
              $BlockAnnotationsTable,
              BlockAnnotation
            >,
          ),
          BlockAnnotation,
          PrefetchHooks Function()
        > {
  $$BlockAnnotationsTableTableManager(
    _$AppDatabase db,
    $BlockAnnotationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlockAnnotationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlockAnnotationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlockAnnotationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> blockId = const Value.absent(),
                Value<String> noteText = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BlockAnnotationsCompanion(
                blockId: blockId,
                noteText: noteText,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String blockId,
                required String noteText,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BlockAnnotationsCompanion.insert(
                blockId: blockId,
                noteText: noteText,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BlockAnnotationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BlockAnnotationsTable,
      BlockAnnotation,
      $$BlockAnnotationsTableFilterComposer,
      $$BlockAnnotationsTableOrderingComposer,
      $$BlockAnnotationsTableAnnotationComposer,
      $$BlockAnnotationsTableCreateCompanionBuilder,
      $$BlockAnnotationsTableUpdateCompanionBuilder,
      (
        BlockAnnotation,
        BaseReferences<_$AppDatabase, $BlockAnnotationsTable, BlockAnnotation>,
      ),
      BlockAnnotation,
      PrefetchHooks Function()
    >;
typedef $$CollectionsTableCreateCompanionBuilder =
    CollectionsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$CollectionsTableUpdateCompanionBuilder =
    CollectionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CollectionsTableReferences
    extends BaseReferences<_$AppDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionItemsTable, List<CollectionItem>>
  _collectionItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionItems,
    aliasName: 'collections__id__collection_items__collection_id',
  );

  $$CollectionItemsTableProcessedTableManager get collectionItemsRefs {
    final manager = $$CollectionItemsTableTableManager(
      $_db,
      $_db.collectionItems,
    ).filter((f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _collectionItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> collectionItemsRefs(
    Expression<bool> Function($$CollectionItemsTableFilterComposer f) f,
  ) {
    final $$CollectionItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableFilterComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> collectionItemsRefs<T extends Object>(
    Expression<T> Function($$CollectionItemsTableAnnotationComposer a) f,
  ) {
    final $$CollectionItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionItems,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionsTable,
          Collection,
          $$CollectionsTableFilterComposer,
          $$CollectionsTableOrderingComposer,
          $$CollectionsTableAnnotationComposer,
          $$CollectionsTableCreateCompanionBuilder,
          $$CollectionsTableUpdateCompanionBuilder,
          (Collection, $$CollectionsTableReferences),
          Collection,
          PrefetchHooks Function({bool collectionItemsRefs})
        > {
  $$CollectionsTableTableManager(_$AppDatabase db, $CollectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionItemsRefs) db.collectionItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionItemsRefs)
                    await $_getPrefetchedData<
                      Collection,
                      $CollectionsTable,
                      CollectionItem
                    >(
                      currentTable: table,
                      referencedTable: $$CollectionsTableReferences
                          ._collectionItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CollectionsTableReferences(
                            db,
                            table,
                            p0,
                          ).collectionItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.collectionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionsTable,
      Collection,
      $$CollectionsTableFilterComposer,
      $$CollectionsTableOrderingComposer,
      $$CollectionsTableAnnotationComposer,
      $$CollectionsTableCreateCompanionBuilder,
      $$CollectionsTableUpdateCompanionBuilder,
      (Collection, $$CollectionsTableReferences),
      Collection,
      PrefetchHooks Function({bool collectionItemsRefs})
    >;
typedef $$CollectionItemsTableCreateCompanionBuilder =
    CollectionItemsCompanion Function({
      required String collectionId,
      required String conceptName,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });
typedef $$CollectionItemsTableUpdateCompanionBuilder =
    CollectionItemsCompanion Function({
      Value<String> collectionId,
      Value<String> conceptName,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

final class $$CollectionItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CollectionItemsTable, CollectionItem> {
  $$CollectionItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CollectionsTable _collectionIdTable(_$AppDatabase db) => db
      .collections
      .createAlias('collection_items__collection_id__collections__id');

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager = $$CollectionsTableTableManager(
      $_db,
      $_db.collections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CollectionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableFilterComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableOrderingComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get conceptName => $composableBuilder(
    column: $table.conceptName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionItemsTable,
          CollectionItem,
          $$CollectionItemsTableFilterComposer,
          $$CollectionItemsTableOrderingComposer,
          $$CollectionItemsTableAnnotationComposer,
          $$CollectionItemsTableCreateCompanionBuilder,
          $$CollectionItemsTableUpdateCompanionBuilder,
          (CollectionItem, $$CollectionItemsTableReferences),
          CollectionItem,
          PrefetchHooks Function({bool collectionId})
        > {
  $$CollectionItemsTableTableManager(
    _$AppDatabase db,
    $CollectionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> collectionId = const Value.absent(),
                Value<String> conceptName = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionItemsCompanion(
                collectionId: collectionId,
                conceptName: conceptName,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String collectionId,
                required String conceptName,
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionItemsCompanion.insert(
                collectionId: collectionId,
                conceptName: conceptName,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CollectionItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (collectionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.collectionId,
                                referencedTable:
                                    $$CollectionItemsTableReferences
                                        ._collectionIdTable(db),
                                referencedColumn:
                                    $$CollectionItemsTableReferences
                                        ._collectionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CollectionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionItemsTable,
      CollectionItem,
      $$CollectionItemsTableFilterComposer,
      $$CollectionItemsTableOrderingComposer,
      $$CollectionItemsTableAnnotationComposer,
      $$CollectionItemsTableCreateCompanionBuilder,
      $$CollectionItemsTableUpdateCompanionBuilder,
      (CollectionItem, $$CollectionItemsTableReferences),
      CollectionItem,
      PrefetchHooks Function({bool collectionId})
    >;
typedef $$ImportQueueItemsTableCreateCompanionBuilder =
    ImportQueueItemsCompanion Function({
      required String id,
      required String url,
      Value<String?> batchName,
      Value<String> importMode,
      Value<int> depth,
      Value<String?> parentId,
      Value<String?> crawlSessionId,
      Value<String> status,
      Value<double> progress,
      Value<String?> error,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });
typedef $$ImportQueueItemsTableUpdateCompanionBuilder =
    ImportQueueItemsCompanion Function({
      Value<String> id,
      Value<String> url,
      Value<String?> batchName,
      Value<String> importMode,
      Value<int> depth,
      Value<String?> parentId,
      Value<String?> crawlSessionId,
      Value<String> status,
      Value<double> progress,
      Value<String?> error,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

class $$ImportQueueItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ImportQueueItemsTable> {
  $$ImportQueueItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchName => $composableBuilder(
    column: $table.batchName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importMode => $composableBuilder(
    column: $table.importMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get depth => $composableBuilder(
    column: $table.depth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crawlSessionId => $composableBuilder(
    column: $table.crawlSessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImportQueueItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ImportQueueItemsTable> {
  $$ImportQueueItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchName => $composableBuilder(
    column: $table.batchName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importMode => $composableBuilder(
    column: $table.importMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get depth => $composableBuilder(
    column: $table.depth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crawlSessionId => $composableBuilder(
    column: $table.crawlSessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImportQueueItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImportQueueItemsTable> {
  $$ImportQueueItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get batchName =>
      $composableBuilder(column: $table.batchName, builder: (column) => column);

  GeneratedColumn<String> get importMode => $composableBuilder(
    column: $table.importMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get depth =>
      $composableBuilder(column: $table.depth, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get crawlSessionId => $composableBuilder(
    column: $table.crawlSessionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$ImportQueueItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImportQueueItemsTable,
          ImportQueueItem,
          $$ImportQueueItemsTableFilterComposer,
          $$ImportQueueItemsTableOrderingComposer,
          $$ImportQueueItemsTableAnnotationComposer,
          $$ImportQueueItemsTableCreateCompanionBuilder,
          $$ImportQueueItemsTableUpdateCompanionBuilder,
          (
            ImportQueueItem,
            BaseReferences<
              _$AppDatabase,
              $ImportQueueItemsTable,
              ImportQueueItem
            >,
          ),
          ImportQueueItem,
          PrefetchHooks Function()
        > {
  $$ImportQueueItemsTableTableManager(
    _$AppDatabase db,
    $ImportQueueItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImportQueueItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImportQueueItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImportQueueItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> batchName = const Value.absent(),
                Value<String> importMode = const Value.absent(),
                Value<int> depth = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String?> crawlSessionId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImportQueueItemsCompanion(
                id: id,
                url: url,
                batchName: batchName,
                importMode: importMode,
                depth: depth,
                parentId: parentId,
                crawlSessionId: crawlSessionId,
                status: status,
                progress: progress,
                error: error,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String url,
                Value<String?> batchName = const Value.absent(),
                Value<String> importMode = const Value.absent(),
                Value<int> depth = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String?> crawlSessionId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImportQueueItemsCompanion.insert(
                id: id,
                url: url,
                batchName: batchName,
                importMode: importMode,
                depth: depth,
                parentId: parentId,
                crawlSessionId: crawlSessionId,
                status: status,
                progress: progress,
                error: error,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImportQueueItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImportQueueItemsTable,
      ImportQueueItem,
      $$ImportQueueItemsTableFilterComposer,
      $$ImportQueueItemsTableOrderingComposer,
      $$ImportQueueItemsTableAnnotationComposer,
      $$ImportQueueItemsTableCreateCompanionBuilder,
      $$ImportQueueItemsTableUpdateCompanionBuilder,
      (
        ImportQueueItem,
        BaseReferences<_$AppDatabase, $ImportQueueItemsTable, ImportQueueItem>,
      ),
      ImportQueueItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RawDocumentsTableTableManager get rawDocuments =>
      $$RawDocumentsTableTableManager(_db, _db.rawDocuments);
  $$NormalizedDocumentsTableTableManager get normalizedDocuments =>
      $$NormalizedDocumentsTableTableManager(_db, _db.normalizedDocuments);
  $$KnowledgeCardsTableTableManager get knowledgeCards =>
      $$KnowledgeCardsTableTableManager(_db, _db.knowledgeCards);
  $$GraphLinksTableTableManager get graphLinks =>
      $$GraphLinksTableTableManager(_db, _db.graphLinks);
  $$ProblemPatternsTableTableManager get problemPatterns =>
      $$ProblemPatternsTableTableManager(_db, _db.problemPatterns);
  $$LearningProgressTableTableManager get learningProgress =>
      $$LearningProgressTableTableManager(_db, _db.learningProgress);
  $$ExtractedConceptsTableTableManager get extractedConcepts =>
      $$ExtractedConceptsTableTableManager(_db, _db.extractedConcepts);
  $$ConceptRelationshipsTableTableManager get conceptRelationships =>
      $$ConceptRelationshipsTableTableManager(_db, _db.conceptRelationships);
  $$SemanticElementsTableTableManager get semanticElements =>
      $$SemanticElementsTableTableManager(_db, _db.semanticElements);
  $$ProblemsTableTableManager get problems =>
      $$ProblemsTableTableManager(_db, _db.problems);
  $$ProblemConceptLinksTableTableManager get problemConceptLinks =>
      $$ProblemConceptLinksTableTableManager(_db, _db.problemConceptLinks);
  $$ProblemProgressTableTableManager get problemProgress =>
      $$ProblemProgressTableTableManager(_db, _db.problemProgress);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db, _db.roadmaps);
  $$RoadmapModulesTableTableManager get roadmapModules =>
      $$RoadmapModulesTableTableManager(_db, _db.roadmapModules);
  $$RoadmapNodesTableTableManager get roadmapNodes =>
      $$RoadmapNodesTableTableManager(_db, _db.roadmapNodes);
  $$UserRoadmapProgressTableTableManager get userRoadmapProgress =>
      $$UserRoadmapProgressTableTableManager(_db, _db.userRoadmapProgress);
  $$GlobalWorkspaceTableTableManager get globalWorkspace =>
      $$GlobalWorkspaceTableTableManager(_db, _db.globalWorkspace);
  $$ConceptNotesTableTableManager get conceptNotes =>
      $$ConceptNotesTableTableManager(_db, _db.conceptNotes);
  $$BlockAnnotationsTableTableManager get blockAnnotations =>
      $$BlockAnnotationsTableTableManager(_db, _db.blockAnnotations);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$CollectionItemsTableTableManager get collectionItems =>
      $$CollectionItemsTableTableManager(_db, _db.collectionItems);
  $$ImportQueueItemsTableTableManager get importQueueItems =>
      $$ImportQueueItemsTableTableManager(_db, _db.importQueueItems);
}
