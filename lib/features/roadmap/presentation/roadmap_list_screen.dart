import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/storage/database.dart';
import '../../../engines/roadmap/roadmap_engine.dart';
import '../../../di/injection.dart' as di;

class RoadmapListScreen extends StatefulWidget {
  const RoadmapListScreen({super.key});

  @override
  State<RoadmapListScreen> createState() => _RoadmapListScreenState();
}

class _RoadmapListScreenState extends State<RoadmapListScreen> {
  final RoadmapEngine _engine = di.getIt<RoadmapEngine>();
  List<Roadmap> _roadmaps = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _engine.seedRoadmaps();
    final roadmaps = await _engine.getAllRoadmaps();
    setState(() {
      _roadmaps = roadmaps;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roadmaps')),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _roadmaps.length,
            itemBuilder: (context, index) {
              final r = _roadmaps[index];
              final isCurated = r.roadmapType == 'curated';
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Row(
                    children: [
                      Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isCurated ? Colors.blue.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: isCurated ? Colors.blue : Colors.orange),
                        ),
                        child: Text(
                          isCurated ? 'CURATED' : 'DYNAMIC',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isCurated ? Colors.blue : Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(r.description ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isCurated)
                        PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'rename') {
                              final newTitle = await _showRenameDialog(context, r.title);
                              if (newTitle != null && newTitle.trim().isNotEmpty) {
                                await _engine.updateRoadmapTitle(r.id, newTitle.trim());
                                _loadData();
                              }
                            } else if (value == 'delete') {
                              final confirm = await _showDeleteConfirm(context);
                              if (confirm == true) {
                                await _engine.deleteRoadmap(r.id);
                                _loadData();
                              }
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'rename',
                              child: Text('Rename'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  onTap: () {
                    context.push('/roadmap/${r.id}');
                  },
                ),
              );
            },
          ),
    );
  }

  Future<String?> _showRenameDialog(BuildContext context, String currentTitle) {
    final controller = TextEditingController(text: currentTitle);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename Roadmap'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Roadmap Title'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Roadmap?'),
        content: const Text('Are you sure you want to delete this dynamic roadmap? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
