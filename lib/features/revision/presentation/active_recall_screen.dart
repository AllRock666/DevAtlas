import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../engines/revision/revision_engine.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';

class ActiveRecallScreen extends StatefulWidget {
  final DailyRevisionQueue queue;
  const ActiveRecallScreen({super.key, required this.queue});

  @override
  State<ActiveRecallScreen> createState() => _ActiveRecallScreenState();
}

class _ActiveRecallScreenState extends State<ActiveRecallScreen> {
  final RevisionEngine _engine = di.getIt<RevisionEngine>();
  int _currentIndex = 0;
  bool _showAnswer = false;

  void _submitScore(int score) async {
    final activity = widget.queue.activities[_currentIndex];
    await _engine.logActivityResult(activity.conceptName, score);
    
    if (_currentIndex < widget.queue.activities.length - 1) {
      setState(() {
        _currentIndex++;
        _showAnswer = false;
      });
    } else {
      // Done
      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Daily Revision Complete!')));
      }
    }
  }

  Widget _buildCard(RevisionActivity activity) {
    if (activity.type == ActivityType.quickRevision) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(activity.conceptName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(activity.metadata?['summary'] ?? '', style: const TextStyle(fontSize: 16, height: 1.5)),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _submitScore(5), // Just a quick review
            child: const Text('Mark as Reviewed'),
          )
        ],
      );
    }
    
    if (activity.type == ActivityType.codeRecall) {
       return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Code Recall: ${activity.conceptName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Mentally reconstruct the missing parts of this code:'),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: HighlightView(
                _showAnswer ? activity.answer! : activity.question!,
                language: 'cpp',
                theme: atomOneDarkTheme,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
          if (!_showAnswer)
            ElevatedButton(
              onPressed: () => setState(() => _showAnswer = true),
              child: const Text('Reveal Code'),
            ),
          if (_showAnswer)
            _buildScoreButtons(),
        ],
      );
    }

    // Default Active Recall / Relationship Recall
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(activity.type == ActivityType.relationshipRecall ? 'Graph Recall' : 'Active Recall', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: 8),
        Text(activity.question ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Spacer(),
        if (!_showAnswer)
          ElevatedButton(
            onPressed: () => setState(() => _showAnswer = true),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('Reveal Answer', style: TextStyle(fontSize: 18)),
          ),
        if (_showAnswer) ...[
          const Divider(),
          const Text('Answer:', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(activity.answer ?? '', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          _buildScoreButtons(),
        ]
      ],
    );
  }

  Widget _buildScoreButtons() {
    return Column(
      children: [
        const Text('How well did you remember this?', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ScoreBtn(label: 'Again', color: Colors.red, score: 0, onTap: () => _submitScore(0)),
            _ScoreBtn(label: 'Hard', color: Colors.orange, score: 3, onTap: () => _submitScore(3)),
            _ScoreBtn(label: 'Good', color: Colors.blue, score: 4, onTap: () => _submitScore(4)),
            _ScoreBtn(label: 'Easy', color: Colors.green, score: 5, onTap: () => _submitScore(5)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.queue.activities.isEmpty) return const Scaffold(body: Center(child: Text('No activities')));
    
    final activity = widget.queue.activities[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Revision (${_currentIndex + 1}/${widget.queue.activities.length})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildCard(activity),
      ),
    );
  }
}

class _ScoreBtn extends StatelessWidget {
  final String label;
  final Color color;
  final int score;
  final VoidCallback onTap;

  const _ScoreBtn({required this.label, required this.color, required this.score, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.2),
        foregroundColor: color,
        elevation: 0,
      ),
      child: Text(label),
    );
  }
}
