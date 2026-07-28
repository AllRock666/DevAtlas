import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;

class LearningProgressWidget extends StatefulWidget {
  final String cardId;
  const LearningProgressWidget({super.key, required this.cardId});

  @override
  State<LearningProgressWidget> createState() => _LearningProgressWidgetState();
}

class _LearningProgressWidgetState extends State<LearningProgressWidget> {
  final AppDatabase _db = di.getIt<AppDatabase>();
  String _currentStatus = 'not_started';

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  @override
  void didUpdateWidget(covariant LearningProgressWidget oldWidget) {
    if (oldWidget.cardId != widget.cardId) _loadStatus();
    super.didUpdateWidget(oldWidget);
  }

  void _loadStatus() async {
    final record = await (_db.select(_db.learningProgress)..where((t) => t.cardId.equals(widget.cardId))).getSingleOrNull();
    if (mounted) {
      setState(() {
        _currentStatus = record?.status ?? 'not_started';
      });
    }
  }

  void _updateStatus(String newStatus) async {
    await _db.into(_db.learningProgress).insertOnConflictUpdate(
      LearningProgressCompanion.insert(
        cardId: widget.cardId,
        status: drift.Value(newStatus),
      ),
    );
    setState(() => _currentStatus = newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mastery Level', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChip('Not Started', 'not_started', Colors.grey),
                _buildChip('Reading', 'reading', Colors.blue),
                _buildChip('Understood', 'understood', Colors.orange),
                _buildChip('Practiced', 'practiced', Colors.purple),
                _buildChip('Mastered', 'mastered', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, String value, MaterialColor color) {
    final isSelected = _currentStatus == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: color.withOpacity(0.2),
      onSelected: (selected) {
        if (selected) _updateStatus(value);
      },
    );
  }
}
