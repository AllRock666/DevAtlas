import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../di/injection.dart' as di;
import '../discovery_engine.dart';
import '../discovery_models.dart';
import '../../import_queue/import_queue_manager.dart';

class DiscoveryScreen extends StatefulWidget {
  final String url;
  final String importMode;
  
  const DiscoveryScreen({super.key, required this.url, required this.importMode});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final _engine = di.getIt<DiscoveryEngine>();
  final _queueManager = di.getIt<ImportQueueManager>();
  String _searchQuery = '';
  
  @override
  void initState() {
    super.initState();
    _engine.addListener(_onEngineUpdate);
    
    // Start discovery if there is no active session for this URL
    if (_engine.currentSession?.rootUrl != widget.url || _engine.currentSession?.importMode != widget.importMode) {
      // Delay to avoid build conflicts
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _engine.startDiscovery(widget.url, widget.importMode);
      });
    }
  }

  @override
  void dispose() {
    _engine.removeListener(_onEngineUpdate);
    super.dispose();
  }
  
  void _onEngineUpdate() {
    setState(() {});
  }

  void _importSelected() {
    final session = _engine.currentSession;
    if (session == null) return;
    
    final selectedNodes = session.nodes.values.where((n) => n.isSelected && n.status == DiscoveryStatus.success).toList();
    
    final batchName = session.nodes[session.rootUrl]?.title ?? 'Batch Import';
    
    _queueManager.addBatch(batchName, selectedNodes.map((n) => n.url).toList());
    
    if (context.mounted) {
      context.go('/library');
    }
  }
  
  List<DiscoveryNode> get _filteredNodes {
    final session = _engine.currentSession;
    if (session == null) return [];
    
    if (_searchQuery.isEmpty) {
      return session.nodes.values.toList();
    }
    
    return session.nodes.values.where((n) => 
      n.url.toLowerCase().contains(_searchQuery.toLowerCase()) || 
      n.title.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final session = _engine.currentSession;
    
    if (session == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    final nodes = _filteredNodes;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Documentation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_engine.isRunning) _engine.cancelDiscovery();
            context.go('/library');
          },
        ),
      ),
      body: Column(
        children: [
          _buildSummary(session),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search discovered pages...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nodes.length,
              itemBuilder: (context, index) {
                final node = nodes[index];
                
                IconData icon = Icons.description;
                Color iconColor = Colors.grey;
                if (node.status == DiscoveryStatus.pending) {
                  icon = Icons.hourglass_empty;
                } else if (node.status == DiscoveryStatus.blocked) {
                  icon = Icons.block;
                  iconColor = Colors.red;
                } else if (node.status == DiscoveryStatus.external) {
                  icon = Icons.open_in_new;
                  iconColor = Colors.blue;
                } else if (node.status == DiscoveryStatus.success) {
                  iconColor = Colors.green;
                }

                return CheckboxListTile(
                  value: node.isSelected,
                  onChanged: (node.status == DiscoveryStatus.success || node.status == DiscoveryStatus.pending) 
                    ? (val) {
                        setState(() {
                          node.isSelected = val ?? false;
                        });
                      }
                    : null,
                  secondary: Icon(icon, color: iconColor),
                  title: Text(node.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                    node.errorReason != null ? '${node.url} - ${node.errorReason}' : node.url,
                    style: TextStyle(
                      color: node.errorReason != null ? Colors.red : Colors.grey,
                      fontSize: 12
                    ),
                    maxLines: 1, 
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_engine.isRunning)
                ElevatedButton.icon(
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop Discovery'),
                  onPressed: () => _engine.cancelDiscovery(),
                )
              else
                Text('${session.selectedCount} pages selected'),
                
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Import Selected'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onPressed: _engine.isRunning ? null : _importSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSummary(DiscoverySession session) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_engine.isRunning) ...[
            const Text('Crawling in progress...', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const LinearProgressIndicator(),
            const SizedBox(height: 16),
          ],
          Text('Discovered: ${session.totalDiscovered} pages'),
          Text('Selected: ${session.selectedCount} pages', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          Text('Blocked: ${session.blockedCount} pages', style: const TextStyle(color: Colors.red)),
          Text('External Links Ignored: ${session.externalCount}'),
        ],
      ),
    );
  }
}
