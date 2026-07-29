import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../engines/knowledge_query/knowledge_query_engine.dart';
import '../../../engines/knowledge_query/models/knowledge_query_response.dart';
import '../../../engines/storage/database.dart';
import '../../../di/injection.dart' as di;
import '../../study/presentation/widgets/study_blocks.dart';
import '../../study/presentation/widgets/learning_progress_widget.dart';
import '../../../engines/study_page_builder/rendered_document.dart';
import 'widgets/source_viewer_widget.dart';
import 'widgets/web_search_results_widget.dart';

class KnowledgeSearchScreen extends StatefulWidget {
  final String? initialQuery;
  const KnowledgeSearchScreen({super.key, this.initialQuery});

  @override
  State<KnowledgeSearchScreen> createState() => _KnowledgeSearchScreenState();
}

class _KnowledgeSearchScreenState extends State<KnowledgeSearchScreen> {
  final _searchController = TextEditingController();
  late final KnowledgeQueryEngine _engine;
  
  KnowledgeQueryResponse? _response;
  bool _isLoading = false;
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _engine = RuleBasedKnowledgeQueryEngine(di.getIt<AppDatabase>());
    if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
      _searchController.text = widget.initialQuery!;
      // delay search slightly to allow build to finish
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _performSearch(widget.initialQuery!);
      });
    }
  }

  void _onSearchChanged(String query) async {
    if (query.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }
    final suggestions = await _engine.getSuggestions(query);
    setState(() => _suggestions = suggestions);
  }

  void _performSearch(String query) async {
    if (query.trim().isEmpty) return;
    setState(() {
      _isLoading = true;
      _suggestions = [];
    });
    
    try {
      final response = await _engine.query(query, const SearchFilters());
      
      // Inject personal notes into the response if available
      if (response.primaryConcept.isNotEmpty) {
        final db = di.getIt<AppDatabase>();
        final note = await (db.select(db.conceptNotes)..where((t) => t.conceptName.equals(response.primaryConcept))).getSingleOrNull();
        if (note != null && note.content.isNotEmpty) {
          response.genericBlocks.insertAll(0, [
            StudySectionBlock(id: 'notes-sec', heading: 'Personal Notes (${response.primaryConcept})'),
            StudyParagraphBlock(id: 'notes-p', text: note.content),
            DividerBlock(id: 'notes-div'),
          ]);
        }
      }

      // Check if query matches global workspace
      if (response.genericBlocks.isNotEmpty && response.genericBlocks.first.id == 'err') {
        final db = di.getIt<AppDatabase>();
        final ws = await (db.select(db.globalWorkspace)..where((t) => t.id.equals(1))).getSingleOrNull();
        if (ws != null && ws.content.toLowerCase().contains(query.toLowerCase())) {
          setState(() {
            _response = KnowledgeQueryResponse(
              query: query,
              intentDetected: 'workspace_lookup',
              primaryConcept: 'Workspace',
              genericBlocks: [
                StudyTitleBlock(id: 'ws-title', title: 'Global Workspace Match'),
                StudyParagraphBlock(id: 'ws-content', text: ws.content),
              ],
              navigationActions: [],
            );
            _isLoading = false;
          });
          return;
        }
      }

      setState(() {
        _response = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _response = KnowledgeQueryResponse(
          query: query,
          intentDetected: 'error',
          primaryConcept: '',
          genericBlocks: [
            StudyTitleBlock(id: 'err-title', title: 'Knowledge Not Found'),
            StudyParagraphBlock(id: 'err-text', text: 'No local knowledge found for "$query". You can search the web and import it directly into your DevAtlas library below.'),
          ],
          navigationActions: [],
        );
        _isLoading = false;
      });
    }
  }

  Widget _buildBlock(StudyBlock block) {
    if (block is StudyTitleBlock) return StudyTitleWidget(block: block);
    if (block is StudySectionBlock) return StudySectionWidget(block: block);
    if (block is StudyParagraphBlock) return StudyParagraphWidget(block: block);
    if (block is CodeBlock) return CodeBlockWidget(block: block);
    if (block is ImageBlock) return ImageBlockWidget(block: block);
    if (block is QuoteBlock) return QuoteBlockWidget(block: block);
    if (block is ListBlock) return ListBlockWidget(block: block);
    if (block is DividerBlock) return DividerBlockWidget(block: block);
    if (block is TableBlock) return TableBlockWidget(block: block);
    if (block is CalloutBlock) return CalloutBlockWidget(block: block);
    return const SizedBox.shrink();
  }

  void _handleNavigation(KnowledgeNavigationAction action) {
    if (action.type == KnowledgeNavigationType.viewStudyPage) {
      context.push('/study/${action.targetId}');
    } else if (action.type == KnowledgeNavigationType.viewRelatedConcept) {
      _searchController.text = action.targetId;
      _performSearch(action.targetId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Knowledge Query')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Ask DevAtlas (e.g. "What is a linked list?")...',
              onChanged: _onSearchChanged,
              onSubmitted: _performSearch,
              leading: const Icon(Icons.search),
            ),
          ),
          if (_suggestions.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.lightbulb_outline),
                  title: Text(_suggestions[index]),
                  onTap: () {
                    _searchController.text = _suggestions[index];
                    _performSearch(_suggestions[index]);
                  },
                ),
              ),
            ),
          if (_isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator())),
          if (!_isLoading && _response != null && _suggestions.isEmpty)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  Text('Intent: ${_response!.intentDetected}', style: Theme.of(context).textTheme.labelSmall),
                  const Divider(),
                  ..._response!.genericBlocks.map((b) => _buildBlock(b)),
                  if (_response!.intentDetected == 'error' || _response!.intentDetected == 'web_search')
                    WebSearchResultsWidget(query: _response!.query)
                  else ...[
                    const Divider(height: 48),
                    Builder(builder: (c) {
                      return SourceViewerWidget(conceptName: _response!.primaryConcept);
                    }),
                    const SizedBox(height: 32),
                  ],
                  if (_response!.navigationActions.any((a) => a.type == KnowledgeNavigationType.viewStudyPage))
                    Builder(builder: (c) {
                      final viewAction = _response!.navigationActions.where((a) => a.type == KnowledgeNavigationType.viewStudyPage).firstOrNull ?? _response!.navigationActions.firstWhere((a) => a.type == KnowledgeNavigationType.viewStudyPage);
                      return LearningProgressWidget(cardId: viewAction.targetId);
                    }),
                  const SizedBox(height: 16),
                  const Divider(),
                  const Text('Continue Learning', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Builder(builder: (c) {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _response!.navigationActions.map((action) => ActionChip(
                        label: Text(action.label),
                        onPressed: () => _handleNavigation(action),
                        avatar: Icon(action.type == KnowledgeNavigationType.viewStudyPage ? Icons.book : Icons.explore),
                      )).toList(),
                    );
                  })
                ],
              ),
            ),
        ],
      ),
    );
  }
}
