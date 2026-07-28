import 'package:flutter/material.dart';
import '../../../../engines/storage/database.dart';
import '../../../../di/injection.dart' as di;

class SourceViewerWidget extends StatelessWidget {
  final String conceptName;

  const SourceViewerWidget({super.key, required this.conceptName});

  @override
  Widget build(BuildContext context) {
    final db = di.getIt<AppDatabase>();
    return FutureBuilder<List<ExtractedConcept>>(
      // Find all extracted concepts with this name
      future: (db.select(db.extractedConcepts)..where((t) => t.name.equals(conceptName))).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const SizedBox.shrink();
        
        final cardIds = snapshot.data!.map((c) => c.cardId).toList();
        
        return FutureBuilder<List<KnowledgeCard>>(
          future: (db.select(db.knowledgeCards)..where((t) => t.id.isIn(cardIds))).get(),
          builder: (context, cardSnapshot) {
             if (!cardSnapshot.hasData || cardSnapshot.data!.isEmpty) return const SizedBox.shrink();
             
             final cards = cardSnapshot.data!;
             return Card(
               margin: const EdgeInsets.symmetric(vertical: 16),
               child: Padding(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Enriched from ${cards.length} sources:', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                     const SizedBox(height: 8),
                     ...cards.map((c) => ListTile(
                       leading: const Icon(Icons.source),
                       title: Text(c.sourceName ?? 'Unknown Source'),
                       subtitle: Text('Imported on ${c.retrievedAt?.split("T")[0] ?? "Unknown"}', style: const TextStyle(fontSize: 12)),
                       dense: true,
                     )),
                   ],
                 ),
               ),
             );
          }
        );
      }
    );
  }
}
