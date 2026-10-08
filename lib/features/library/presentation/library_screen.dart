import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/import_queue/import_queue_manager.dart';
import '../../../di/injection.dart' as di;
import '../../../engines/storage/database.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _urlController = TextEditingController();
  final _queueManager = di.getIt<ImportQueueManager>();
  final _db = di.getIt<AppDatabase>();
  
  String _importMode = 'page';

  @override
  void initState() {
    super.initState();
    _queueManager.addListener(_onQueueChanged);
  }

  @override
  void dispose() {
    _queueManager.removeListener(_onQueueChanged);
    super.dispose();
  }

  void _onQueueChanged() {
    setState(() {});
  }

  void _addJob() {
    final url = _urlController.text.trim();
    if (url.isEmpty) return;
    
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid absolute URL (starting with http:// or https://)')),
      );
      return;
    }
    
    if (_importMode == 'page') {
      _queueManager.addJob(url, importMode: 'page');
    } else {
      context.push(Uri(path: '/discovery', queryParameters: {'url': url, 'mode': _importMode}).toString());
    }
    _urlController.clear();
  }

  Widget _buildQueuePanel() {
    final jobs = _queueManager.jobs.where((j) => j.status != 'completed' && j.status != 'cancelled').toList();
    if (jobs.isEmpty) return const SizedBox.shrink();

    // Group jobs by crawlSessionId for aggregate stats
    final pendingCount = jobs.where((j) => j.status == 'queued').length;
    final runningJob = jobs.where((j) => j.status == 'running').firstOrNull;
    final failedCount = jobs.where((j) => j.status == 'failed').length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Import Queue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                if (_queueManager.isPaused)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Resume'),
                    onPressed: () => _queueManager.resume(),
                  )
                else
                  ElevatedButton.icon(
                    icon: const Icon(Icons.pause),
                    label: const Text('Pause'),
                    onPressed: () => _queueManager.pause(),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text("Processing: ${runningJob?.url ?? 'Waiting'}"),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: runningJob != null ? null : 0.0),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$pendingCount items remaining'),
                if (failedCount > 0)
                  Text('$failedCount failed', style: const TextStyle(color: Colors.red)),
              ],
            ),
            const SizedBox(height: 8),
            if (jobs.length < 50)
              ...jobs.take(10).map((job) {
                return ListTile(
                  dense: true,
                  title: Text(job.url, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(job.status),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (job.status == 'failed')
                        IconButton(
                          icon: const Icon(Icons.refresh, color: Colors.blue),
                          onPressed: () => _queueManager.retry(job.id),
                        ),
                      IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.grey),
                        onPressed: () => _queueManager.cancel(job.id),
                      ),
                    ],
                  ),
                );
              }),
            if (jobs.length > 10)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('+ ${jobs.length - 10} more in queue...', style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'Article URL (e.g. LearnCpp, MDN, Microsoft Learn)',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _addJob(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: DropdownButtonFormField<String>(
                  value: _importMode,
                  decoration: const InputDecoration(
                    labelText: 'Import Scope',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'page', child: Text('Current Page')),
                    DropdownMenuItem(value: 'section', child: Text('Current Section')),
                    DropdownMenuItem(value: 'site', child: Text('Entire Site')),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _importMode = val;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                ),
                onPressed: _addJob,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildQueuePanel(),
          const Divider(height: 48),
          Expanded(
            child: StreamBuilder<List<KnowledgeCard>>(
              stream: _db.select(_db.knowledgeCards).watch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                final cards = snapshot.data ?? [];
                if (cards.isEmpty) return const Center(child: Text('No saved articles yet.'));
                return ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return ListTile(
                      title: Text(card.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(card.sourceName ?? 'Unknown Source'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/study/${card.id}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionsTab() {
    return StreamBuilder<List<Collection>>(
      stream: _db.select(_db.collections).watch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        final cols = snapshot.data ?? [];
        if (cols.isEmpty) return const Center(child: Text('No collections yet. Use "Add to Collection" when reading a concept.'));
        
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: cols.length,
          itemBuilder: (context, index) {
            final col = cols[index];
            return ExpansionTile(
              leading: const Icon(Icons.folder),
              title: Text(col.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                FutureBuilder<List<CollectionItem>>(
                  future: (_db.select(_db.collectionItems)..where((t) => t.collectionId.equals(col.id))).get(),
                  builder: (context, itemSnap) {
                    if (!itemSnap.hasData) return const SizedBox.shrink();
                    final items = itemSnap.data!;
                    if (items.isEmpty) return const Padding(padding: EdgeInsets.all(16), child: Text('Empty collection'));
                    return Column(
                      children: items.map((i) => ListTile(
                        leading: const Icon(Icons.description, size: 16),
                        title: Text(i.conceptName),
                        onTap: () => context.push('/search', extra: i.conceptName),
                      )).toList(),
                    );
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Library'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Articles'),
              Tab(text: 'Collections'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildArticlesTab(),
            _buildCollectionsTab(),
          ],
        ),
      ),
    );
  }
}
