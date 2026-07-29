import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../engines/study_page_builder/rendered_document.dart';
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;
import 'widgets/study_blocks.dart';

import 'widgets/block_annotation_sheet.dart';
import 'widgets/concept_notes_sheet.dart';
import 'widgets/add_to_collection_sheet.dart';
import '../../settings/presentation/preferences_provider.dart';
import '../../settings/domain/reader_preferences.dart';
import 'package:drift/drift.dart' as drift;
import 'widgets/learning_progress_widget.dart';
class StudyViewerScreen extends ConsumerStatefulWidget {
  final RenderedStudyDocument document;

  const StudyViewerScreen({super.key, required this.document});

  @override
  ConsumerState<StudyViewerScreen> createState() => _StudyViewerScreenState();
}

class _StudyViewerScreenState extends ConsumerState<StudyViewerScreen> {
  final _db = di.getIt<AppDatabase>();
  final ScrollController _scrollController = ScrollController();
  bool _isFocusMode = false;
  Map<String, bool> _annotatedBlocks = {};

  @override
  void initState() {
    super.initState();
    _loadAnnotations();
    _seedInitialProgress();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _seedInitialProgress() async {
    final prog = await (_db.select(_db.learningProgress)..where((t) => t.cardId.equals(widget.document.cardId))).getSingleOrNull();
    if (prog == null) {
      await _db.into(_db.learningProgress).insertOnConflictUpdate(
        LearningProgressCompanion.insert(
          cardId: widget.document.cardId,
          status: drift.Value('not_started'),
          confidenceLevel: const drift.Value(0),
          lastRevisedAt: drift.Value(DateTime.now()),
          nextRevisionAt: drift.Value(DateTime.now().add(const Duration(days: 1))),
        )
      );
    }
  }

  @override
  void dispose() {
    if (_isFocusMode) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Debounce saving the reading position
    // In a real app we'd use a timer, but for this milestone simple updates are okay.
    // _db.into(_db.learningProgress).insertOnConflictUpdate(...)
  }

  Future<void> _loadAnnotations() async {
    final blockIds = widget.document.blocks.whereType<StudyBlock>().map((b) => _generateStableId(b)).toList();
    final annotations = await (_db.select(_db.blockAnnotations)..where((t) => t.blockId.isIn(blockIds))).get();
    
    if (mounted) {
      setState(() {
        _annotatedBlocks = { for (var a in annotations) a.blockId : true };
      });
    }
  }

  String _generateStableId(StudyBlock block) {
    return block.id; 
  }

  void _toggleFocusMode() {
    setState(() {
      _isFocusMode = !_isFocusMode;
    });
    if (_isFocusMode) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }


  void _showConceptNotes() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: ConceptNotesSheet(conceptName: widget.document.conceptName),
      ),
    );
  }

  void _handleBlockLongPress(StudyBlock block) async {
    final blockId = _generateStableId(block);
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => BlockAnnotationSheet(blockId: blockId),
    );
    // Reload annotations when sheet closes
    _loadAnnotations();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(readerPreferencesProvider);
    final bgColor = prefs.theme.backgroundColor;
    final fgColor = prefs.theme.textColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: _isFocusMode ? null : AppBar(
        title: Text(widget.document.title),
        backgroundColor: prefs.theme.surfaceColor,
        foregroundColor: fgColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_add_outlined),
            tooltip: 'Add to Collection',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddToCollectionSheet(conceptName: widget.document.conceptName),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.note_add),
            tooltip: 'Concept Notes',
            onPressed: _showConceptNotes,
          ),
          IconButton(
            icon: const Icon(Icons.fullscreen),
            tooltip: 'Focus Mode',
            onPressed: _toggleFocusMode,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: LearningProgressWidget(cardId: widget.document.cardId),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          if (_isFocusMode) _toggleFocusMode();
        },
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: _isFocusMode ? 64.0 : 24.0),
              itemCount: widget.document.blocks.length,
              itemBuilder: (context, index) {
                final block = widget.document.blocks[index];
                final blockId = _generateStableId(block);
                final isAnnotated = _annotatedBlocks[blockId] == true;

                return GestureDetector(
                  onLongPress: () => _handleBlockLongPress(block),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      buildStudyBlockWidget(block),
                      if (isAnnotated)
                        Positioned(
                          right: -16,
                          top: 8,
                          child: Icon(Icons.sticky_note_2, color: Theme.of(context).colorScheme.primary, size: 16),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
