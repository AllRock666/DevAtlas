import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/storage/database.dart';
import 'package:drift/drift.dart' show OrderingTerm, OrderingMode;
import '../../../di/injection.dart' as di;
import '../../../engines/revision/revision_engine.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _db = di.getIt<AppDatabase>();
  final _revisionEngine = RevisionEngine();
  
  DailyRevisionQueue? _revisionQueue;
  List<ExtractedConcept> _continueReading = [];
  List<KnowledgeCard> _recentlyImported = [];
  int _masteredCount = 0;
  
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    final queue = await _revisionEngine.generateDailyQueue();
    
    // Continue reading (based on lastOpenedAt in LearningProgress)
    final progress = await (_db.select(_db.learningProgress)
      ..orderBy([(t) => OrderingTerm(expression: t.lastOpenedAt, mode: OrderingMode.desc)])
      ..limit(3)).get();
      
    final cardIds = progress.map((p) => p.cardId).toList();
    if (cardIds.isNotEmpty) {
      _continueReading = await (_db.select(_db.extractedConcepts)..where((t) => t.cardId.isIn(cardIds))).get();
    }
    
    // Recently imported
    _recentlyImported = await (_db.select(_db.knowledgeCards)
      ..orderBy([(t) => OrderingTerm(expression: t.retrievedAt, mode: OrderingMode.desc)])
      ..limit(5)).get();
      
    // Stats
    final mastered = await (_db.select(_db.learningProgress)..where((t) => t.status.equals('mastered'))).get();
    _masteredCount = mastered.length;

    if (mounted) {
      setState(() {
        _revisionQueue = queue;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('DevAtlas Workspace'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () => context.push('/search')),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadDashboard,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            // Daily Stats
            Row(
              children: [
                Expanded(child: _StatCard(title: 'Mastered', value: '$_masteredCount', icon: Icons.workspace_premium)),
                const SizedBox(width: 16),
                Expanded(child: _StatCard(title: 'To Review', value: '${_revisionQueue!.activities.length}', icon: Icons.replay)),
              ],
            ),
            const SizedBox(height: 32),
            
            // Today's Revision
            const Text("Today's Revision", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                title: Text('${_revisionQueue!.activities.length} activities pending'),
                subtitle: const Text('Keep your streak alive!'),
                trailing: ElevatedButton(
                  onPressed: _revisionQueue!.activities.isEmpty ? null : () => context.push('/recall', extra: _revisionQueue!),
                  child: const Text('Start'),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Continue Reading
            if (_continueReading.isNotEmpty) ...[
              const Text('Continue Reading', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ..._continueReading.map((c) => ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(c.name),
                subtitle: Text(c.conceptType),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => context.push('/study/${c.cardId}'),
              )),
              const SizedBox(height: 32),
            ],
            
            // Recently Imported
            const Text('Recently Imported', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ..._recentlyImported.map((c) => ListTile(
              leading: const Icon(Icons.download_done),
              title: Text(c.title),
              subtitle: Text(c.sourceName ?? ''),
              onTap: () => context.push('/study/${c.id}'),
            )),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
