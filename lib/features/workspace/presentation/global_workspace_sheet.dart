import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:drift/drift.dart' as drift;
import '../../../engines/storage/database.dart';
import '../../../di/injection.dart' as di;

class GlobalWorkspaceSheet extends StatefulWidget {
  const GlobalWorkspaceSheet({super.key});

  @override
  State<GlobalWorkspaceSheet> createState() => _GlobalWorkspaceSheetState();
}

class _GlobalWorkspaceSheetState extends State<GlobalWorkspaceSheet> {
  final _db = di.getIt<AppDatabase>();
  final _controller = TextEditingController();
  bool _isEditing = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final ws = await (_db.select(_db.globalWorkspace)..where((t) => t.id.equals(1))).getSingleOrNull();
    if (ws != null) {
      _controller.text = ws.content;
    }
  }

  Future<void> _save() async {
    await _db.into(_db.globalWorkspace).insertOnConflictUpdate(
      GlobalWorkspaceCompanion.insert(id: const drift.Value(1), content: drift.Value(_controller.text), updatedAt: drift.Value(DateTime.now())),
    );
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
              const Text('Global Workspace', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      hintText: 'Type markdown notes here...',
                    ),
                    style: const TextStyle(fontFamily: 'Consolas', fontSize: 14),
                  )
                : Markdown(data: _controller.text),
          ),
        ],
      ),
    );
  }
}
