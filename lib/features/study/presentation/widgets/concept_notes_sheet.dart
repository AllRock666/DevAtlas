import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;

class ConceptNotesSheet extends StatefulWidget {
  final String conceptName;

  const ConceptNotesSheet({super.key, required this.conceptName});

  @override
  State<ConceptNotesSheet> createState() => _ConceptNotesSheetState();
}

class _ConceptNotesSheetState extends State<ConceptNotesSheet> {
  final _db = di.getIt<AppDatabase>();
  final _controller = TextEditingController();
  bool _isEditing = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final note = await (_db.select(_db.conceptNotes)..where((t) => t.conceptName.equals(widget.conceptName))).getSingleOrNull();
    if (note != null && note.content.isNotEmpty) {
      setState(() {
        _controller.text = note.content;
        _isEditing = false;
      });
    }
  }

  Future<void> _save() async {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      await (_db.delete(_db.conceptNotes)..where((t) => t.conceptName.equals(widget.conceptName))).go();
    } else {
      await _db.into(_db.conceptNotes).insertOnConflictUpdate(
        ConceptNotesCompanion.insert(conceptName: widget.conceptName, content: drift.Value(text), updatedAt: drift.Value(DateTime.now())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.conceptName} Notes', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(_isEditing ? Icons.visibility : Icons.edit),
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
                      hintText: 'Add permanent concept notes here (markdown supported)...',
                    ),
                  )
                : Markdown(data: _controller.text),
          ),
        ],
      ),
    );
  }
}
