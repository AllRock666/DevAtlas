import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;

class BlockAnnotationSheet extends StatefulWidget {
  final String blockId;

  const BlockAnnotationSheet({super.key, required this.blockId});

  @override
  State<BlockAnnotationSheet> createState() => _BlockAnnotationSheetState();
}

class _BlockAnnotationSheetState extends State<BlockAnnotationSheet> {
  final _db = di.getIt<AppDatabase>();
  final _controller = TextEditingController();
  bool _isEditing = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final note = await (_db.select(_db.blockAnnotations)..where((t) => t.blockId.equals(widget.blockId))).getSingleOrNull();
    if (note != null) {
      setState(() {
        _controller.text = note.noteText;
        _isEditing = false;
      });
    }
  }

  Future<void> _save() async {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      await (_db.delete(_db.blockAnnotations)..where((t) => t.blockId.equals(widget.blockId))).go();
    } else {
      await _db.into(_db.blockAnnotations).insertOnConflictUpdate(
        BlockAnnotationsCompanion.insert(blockId: widget.blockId, noteText: text, updatedAt: drift.Value(DateTime.now())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Block Annotation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(_isEditing ? Icons.save : Icons.edit),
                      onPressed: () {
                        if (_isEditing) _save();
                        setState(() => _isEditing = !_isEditing);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: _isEditing
                  ? TextField(
                      controller: _controller,
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add an annotation (markdown supported)...',
                      ),
                    )
                  : Markdown(data: _controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
