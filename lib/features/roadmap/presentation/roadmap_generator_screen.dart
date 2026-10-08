import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:go_router/go_router.dart';
import '../../../../di/injection.dart' as di;
import '../../../../engines/roadmap/roadmap_engine.dart';
import 'package:flutter/foundation.dart';

class RoadmapGeneratorScreen extends StatefulWidget {
  const RoadmapGeneratorScreen({super.key});

  @override
  State<RoadmapGeneratorScreen> createState() => _RoadmapGeneratorScreenState();
}

class _RoadmapGeneratorScreenState extends State<RoadmapGeneratorScreen> {
  final _topicController = TextEditingController();
  final _urlController = TextEditingController();
  bool _isGenerating = false;
  String _status = '';

  Future<void> _generateRoadmap() async {
    final topic = _topicController.text.trim();
    final url = _urlController.text.trim();

    if (topic.isEmpty || url.isEmpty) return;

    setState(() {
      _isGenerating = true;
      _status = 'Fetching documentation...';
    });

    try {
      final targetUrl = kIsWeb ? 'https://corsproxy.io/?$url' : url;
      final response = await http.get(Uri.parse(targetUrl)).timeout(const Duration(seconds: 15));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load page: ${response.statusCode}');
      }

      setState(() {
        _status = 'Parsing official structure...';
      });

      final document = html_parser.parse(response.body);
      
      List<Map<String, dynamic>> structuredData = [];
      Map<String, dynamic>? currentModule;

      // Extract all h2 and h3
      final headings = document.querySelectorAll('h2, h3');
      for (var h in headings) {
        final text = h.text.trim();
        if (text.isEmpty || text.length < 3) continue;

        if (h.localName == 'h2') {
          currentModule = {
            'title': text,
            'nodes': <String>[]
          };
          structuredData.add(currentModule);
        } else if (h.localName == 'h3' && currentModule != null) {
          (currentModule['nodes'] as List<String>).add(text);
        }
      }

      // Fallback: if we didn't find nested h3s, try to find links near h2s
      if (structuredData.every((m) => (m['nodes'] as List).isEmpty)) {
         structuredData.clear();
         final h2s = document.querySelectorAll('h2');
         for (var h2 in h2s) {
            final mod = {
               'title': h2.text.trim(),
               'nodes': <String>[]
            };
            var next = h2.nextElementSibling;
            while (next != null && next.localName != 'h2') {
               if (next.localName == 'ul' || next.localName == 'ol') {
                  final lis = next.querySelectorAll('li');
                  for (var li in lis) {
                     if (li.text.trim().isNotEmpty) {
                        (mod['nodes'] as List<String>).add(li.text.trim());
                     }
                  }
               }
               next = next.nextElementSibling;
            }
            if ((mod['nodes'] as List).isNotEmpty) {
              structuredData.add(mod);
            }
         }
      }

      // If still empty, chunk all headings into 5 modules
      if (structuredData.isEmpty || structuredData.every((m) => (m['nodes'] as List).isEmpty)) {
         structuredData.clear();
         final allHeadings = document.querySelectorAll('h2, h3, .nav-item, .toc-item, a')
            .map((e) => e.text.trim())
            .where((t) => t.isNotEmpty && t.length > 3 && t.length < 50)
            .toSet()
            .toList();
         
         if (allHeadings.isEmpty) {
            structuredData = [
              {
                'title': '$topic Basics',
                'nodes': ['Introduction to $topic', 'Core Concepts', 'Basic Syntax']
              },
              {
                'title': 'Intermediate $topic',
                'nodes': ['Advanced Data Structures', 'Error Handling', 'Patterns']
              },
              {
                'title': 'Advanced $topic',
                'nodes': ['Architecture', 'Optimization', 'Concurrency']
              },
            ];
         } else {
           int index = 0;
           while (index < allHeadings.length) {
              final mod = {
                 'title': 'Module ${(index / 5).floor() + 1}',
                 'nodes': <String>[]
              };
              for (int i = 0; i < 5 && index < allHeadings.length; i++) {
                 (mod['nodes'] as List<String>).add(allHeadings[index]);
                 index++;
              }
              structuredData.add(mod);
           }
         }
      }

      setState(() {
        _status = 'Curating Custom Roadmap...';
      });

      final engine = di.getIt<RoadmapEngine>();
      await engine.createDynamicRoadmap(topic, 'Custom roadmap auto-curated from $url', structuredData);

      if (mounted) {
        context.pop(); // Go back
      }
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto-Curate Roadmap')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Answer these questions and we will automatically parse official documentation to build your curriculum.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(
                labelText: 'What do you want to learn?',
                hintText: 'e.g. Flutter, React, Advanced C++',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Official Documentation URL',
                hintText: 'e.g. https://docs.flutter.dev/reference/tutorials',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            if (_isGenerating)
              Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(_status, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              )
            else ...[
              ElevatedButton.icon(
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Generate Custom Roadmap', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: _generateRoadmap,
              ),
              if (_status.startsWith('Error'))
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(_status, style: const TextStyle(color: Colors.red)),
                ),
            ]
          ],
        ),
      ),
    );
  }
}
