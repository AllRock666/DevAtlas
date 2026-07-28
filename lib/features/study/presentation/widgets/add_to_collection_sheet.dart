import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;
import 'package:uuid/uuid.dart';

class AddToCollectionSheet extends StatefulWidget {
  final String conceptName;

  const AddToCollectionSheet({super.key, required this.conceptName});

  @override
  State<AddToCollectionSheet> createState() => _AddToCollectionSheetState();
}

class _AddToCollectionSheetState extends State<AddToCollectionSheet> {
  final _db = di.getIt<AppDatabase>();
  List<Collection> _allCollections = [];
  Set<String> _selectedCollectionIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final collections = await _db.select(_db.collections).get();
    final items = await (_db.select(_db.collectionItems)..where((t) => t.conceptName.equals(widget.conceptName))).get();
    
    if (mounted) {
      setState(() {
        _allCollections = collections;
        _selectedCollectionIds = items.map((e) => e.collectionId).toSet();
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleCollection(Collection col, bool isSelected) async {
    if (isSelected) {
      await _db.into(_db.collectionItems).insertOnConflictUpdate(
        CollectionItemsCompanion.insert(
          collectionId: col.id, 
          conceptName: widget.conceptName, 
          addedAt: drift.Value(DateTime.now())
        )
      );
      setState(() => _selectedCollectionIds.add(col.id));
    } else {
      await (_db.delete(_db.collectionItems)
            ..where((t) => t.collectionId.equals(col.id))
            ..where((t) => t.conceptName.equals(widget.conceptName))).go();
      setState(() => _selectedCollectionIds.remove(col.id));
    }
  }

  Future<void> _createNewCollection(String name) async {
    if (name.trim().isEmpty) return;
    
    final id = const Uuid().v4();
    await _db.into(_db.collections).insert(
      CollectionsCompanion.insert(id: id, name: name, createdAt: drift.Value(DateTime.now()))
    );
    
    await _load();
  }

  void _promptNewCollection() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Collection'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'e.g. Interview Prep'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _createNewCollection(controller.text);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox(height: 200, child: Center(child: CircularProgressIndicator()));

    return Container(
      padding: const EdgeInsets.all(16.0),
      constraints: const BoxConstraints(maxHeight: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Add to Collection', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: _promptNewCollection, child: const Text('New Collection')),
            ],
          ),
          const Divider(),
          if (_allCollections.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(child: Text('No collections yet.', style: TextStyle(color: Colors.grey))),
            )
          else
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _allCollections.length,
                itemBuilder: (context, index) {
                  final col = _allCollections[index];
                  final isSelected = _selectedCollectionIds.contains(col.id);
                  
                  return CheckboxListTile(
                    title: Text(col.name),
                    value: isSelected,
                    onChanged: (val) => _toggleCollection(col, val ?? false),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
