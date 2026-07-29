import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/revision/revision_engine.dart';
import '../../../di/injection.dart' as di;

class DailyRevisionScreen extends StatefulWidget {
  const DailyRevisionScreen({super.key});

  @override
  State<DailyRevisionScreen> createState() => _DailyRevisionScreenState();
}

class _DailyRevisionScreenState extends State<DailyRevisionScreen> {
  final RevisionEngine _engine = di.getIt<RevisionEngine>();
  DailyRevisionQueue? _queue;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final q = await _engine.generateDailyQueue();
    setState(() {
      _queue = q;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final q = _queue!;

    return Scaffold(
      appBar: AppBar(title: const Text("Today's Revision")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Welcome Back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('You have ${q.activities.length} activities scheduled for today.', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 32),
            
            if (q.activities.isNotEmpty)
              ElevatedButton.icon(
                onPressed: () {
                  context.push('/recall', extra: q);
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Daily Revision', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              
            const SizedBox(height: 32),
            const Text('Concepts to Review', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            if (q.conceptsToReview.isEmpty) const Text('No concepts due for review.', style: TextStyle(color: Colors.grey)),
            ...q.conceptsToReview.map((c) => ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(c),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push('/search', extra: c),
            )),
            
            const SizedBox(height: 32),
            const Text('Problems to Revisit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            if (q.problemsToRevisit.isEmpty) const Text('No problems due for revisit.', style: TextStyle(color: Colors.grey)),
            ...q.problemsToRevisit.map((p) => ListTile(
              leading: const Icon(Icons.code),
              title: Text(p),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            )),
          ],
        ),
      ),
    );
  }
}
