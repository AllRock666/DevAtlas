import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../../../engines/registry/source_registry.dart';
import '../../../engines/import_queue/import_queue_manager.dart';
import '../../../engines/storage/database.dart';
import '../../../di/injection.dart' as di;

class ConceptResolutionScreen extends StatefulWidget {
  final String nodeId;
  final String conceptName;
  final String roadmapContext;

  const ConceptResolutionScreen({
    super.key,
    required this.nodeId,
    required this.conceptName,
    required this.roadmapContext,
  });

  @override
  State<ConceptResolutionScreen> createState() => _ConceptResolutionScreenState();
}

class _ConceptResolutionScreenState extends State<ConceptResolutionScreen> {
  late List<DocProvider> _providers;
  bool _isResolving = false;
  bool _isImporting = false;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _providers = SourceRegistry.getProvidersForContext(widget.conceptName, widget.roadmapContext);
  }

  Future<void> _startImport(DocProvider provider) async {
    setState(() {
      _isResolving = true;
      _statusMessage = 'Resolving URL with ${provider.name}...';
    });

    final url = await provider.resolveUrl(widget.conceptName);
    
    if (url == null || url.isEmpty) {
      if (mounted) {
        setState(() {
          _isResolving = false;
          _statusMessage = 'Failed to resolve URL using ${provider.name}.';
        });
      }
      return;
    }

    setState(() {
      _isResolving = false;
      _isImporting = true;
      _statusMessage = 'Importing from $url...';
    });

    final queue = di.getIt<ImportQueueManager>();
    await queue.addJob(url, importMode: 'page');
    
    _pollForCompletion(url);
  }

  Future<void> _pollForCompletion(String url) async {
    final db = di.getIt<AppDatabase>();
    final queue = di.getIt<ImportQueueManager>();
    
    while (_isImporting && mounted) {
      final job = await (db.select(db.importQueueItems)..where((t) => t.url.equals(url))).getSingleOrNull();
      if (job != null) {
        if (job.status == 'completed') {
          // Find the newly created card
          final card = await (db.select(db.knowledgeCards)
            ..where((t) => t.sourceUrl.equals(url))
            ..orderBy([(t) => drift.OrderingTerm(expression: t.retrievedAt, mode: drift.OrderingMode.desc)])
            ..limit(1)
          ).getSingleOrNull();
          
          if (card != null) {
            // Link node
            await (db.update(db.roadmapNodes)..where((t) => t.id.equals(widget.nodeId)))
                .write(RoadmapNodesCompanion(linkedCardId: drift.Value(card.id)));
            
            if (mounted) {
              context.replace('/study/${card.id}');
            }
            return;
          }
        } else if (job.status == 'failed') {
          if (mounted) {
            setState(() {
              _isImporting = false;
              _statusMessage = 'Import failed: ${job.error}';
            });
          }
          return;
        } else {
          // Update status based on progress
          if (mounted) {
            setState(() {
              _statusMessage = 'Processing documentation...';
            });
          }
        }
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resolve Concept')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.conceptName}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This concept has not yet been imported into your library. You can explicitly choose a trusted documentation source to import it from.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            
            if (_isResolving || _isImporting)
              Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(_statusMessage, textAlign: TextAlign.center),
                  ],
                ),
              )
            else ...[
              const Text('Available sources:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _providers.length,
                  itemBuilder: (context, index) {
                    final p = _providers[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.menu_book, color: Colors.blue),
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(p.baseUrl),
                        trailing: ElevatedButton(
                          onPressed: () => _startImport(p),
                          child: const Text('Import'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
