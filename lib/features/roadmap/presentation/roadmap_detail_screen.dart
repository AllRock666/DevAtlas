import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/storage/database.dart';
import '../../../engines/roadmap/roadmap_engine.dart';
import '../../../di/injection.dart' as di;

class RoadmapDetailScreen extends StatefulWidget {
  final String roadmapId;
  const RoadmapDetailScreen({super.key, required this.roadmapId});

  @override
  State<RoadmapDetailScreen> createState() => _RoadmapDetailScreenState();
}

class _RoadmapDetailScreenState extends State<RoadmapDetailScreen> {
  final RoadmapEngine _engine = di.getIt<RoadmapEngine>();
  List<RoadmapModuleState> _modules = [];
  Roadmap? _roadmap;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final roadmap = await (di.getIt<AppDatabase>().select(di.getIt<AppDatabase>().roadmaps)..where((t) => t.id.equals(widget.roadmapId))).getSingleOrNull();
    await _engine.startRoadmap(widget.roadmapId);
    final modules = await _engine.getRoadmapState(widget.roadmapId);
    setState(() {
      _roadmap = roadmap;
      _modules = modules;
      _isLoading = false;
    });
  }

  IconData _getIconForStatus(String status) {
    switch(status) {
      case 'locked': return Icons.lock;
      case 'available': return Icons.circle_outlined;
      case 'in_progress': return Icons.incomplete_circle;
      case 'understood': return Icons.check_circle_outline;
      case 'practiced': return Icons.library_add_check;
      case 'mastered': return Icons.workspace_premium;
      default: return Icons.circle;
    }
  }

  Color _getColorForStatus(String status, BuildContext context) {
    switch(status) {
      case 'locked': return Colors.grey;
      case 'available': return Theme.of(context).colorScheme.primary;
      case 'in_progress': return Colors.blue;
      case 'mastered': return Colors.green;
      default: return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCurated = _roadmap?.roadmapType == 'curated';
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(_roadmap?.title ?? 'Learning Path'),
            if (_roadmap != null) const SizedBox(width: 8),
            if (_roadmap != null)
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
        )
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _modules.length,
            itemBuilder: (context, index) {
              final modState = _modules[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('Module ${modState.module.orderIndex}: ${modState.module.title}', 
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ),
                  ...modState.nodes.map((nodeState) => Card(
                    child: ListTile(
                      leading: Icon(
                        _getIconForStatus(nodeState.status),
                        color: _getColorForStatus(nodeState.status, context)
                      ),
                      title: Text(nodeState.node.conceptName),
                      subtitle: Text(nodeState.status.toUpperCase(), style: const TextStyle(fontSize: 10)),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () async {
                        if (nodeState.node.linkedCardId != null && nodeState.status != 'locked') {
                          context.push('/study/${nodeState.node.linkedCardId}');
                        } else {
                          final resolvedCardId = await _engine.resolveLocalNodeLink(nodeState.node.id, nodeState.node.conceptName);
                          if (resolvedCardId != null && mounted) {
                            context.push('/study/$resolvedCardId');
                            _loadData();
                          } else if (mounted) {
                            final encodedContext = Uri.encodeComponent(_roadmap?.title ?? '');
                            final encodedConcept = Uri.encodeComponent(nodeState.node.conceptName);
                            context.push('/resolve_concept/${nodeState.node.id}/$encodedConcept/$encodedContext');
                          }
                        }
                      },
                    ),
                  )),
                ],
              );
            },
          ),
    );
  }
}
