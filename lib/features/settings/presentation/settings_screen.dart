import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _exportDatabase(BuildContext context) async {
    try {
      final docDir = await getApplicationDocumentsDirectory();
      final dbFile = File(p.join(docDir.path, 'devatlas.sqlite'));
      
      if (!await dbFile.exists()) {
        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Database not found')));
        return;
      }
      
      final downloadDir = await getDownloadsDirectory();
      if (downloadDir == null) throw Exception('Downloads directory not found');
      
      final exportPath = p.join(downloadDir.path, 'devatlas_backup_${DateTime.now().millisecondsSinceEpoch}.sqlite');
      await dbFile.copy(exportPath);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Exported to $exportPath')));
      }
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Export failed: $e')));
    }
  }

  Future<void> _exportPortable(BuildContext context) async {
    // Scaffold out the portable JSON export for now
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Portable JSON export not yet implemented')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Data Management', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Backup Database'),
            subtitle: const Text('Export a full snapshot of your DevAtlas workspace'),
            onTap: () => _exportDatabase(context),
          ),
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Restore Database'),
            subtitle: const Text('Overwrite current workspace with a backup file'),
            onTap: () {
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File picker required for restore')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_copy),
            title: const Text('Portable Export'),
            subtitle: const Text('Export notes, collections, and artifacts as JSON'),
            onTap: () => _exportPortable(context),
          ),
          
          const SizedBox(height: 32),
          const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          const ListTile(
            title: Text('Version'),
            trailing: Text('2.0.0'),
          )
        ],
      ),
    );
  }
}
