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
      _status = 'Fetching documentation (this may take up to 30 seconds)...';
    });

    try {
      final targetUrl = kIsWeb ? 'https://corsproxy.io/?$url' : url;
      final response = await http.get(
        Uri.parse(targetUrl),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.5',
        },
      ).timeout(const Duration(seconds: 45));
      
      if (response.statusCode != 200 && response.statusCode != 403) {
        throw Exception('Failed to load page: HTTP ${response.statusCode}');
      }

      setState(() {
        _status = 'Analyzing structural elements...';
      });

      final document = html_parser.parse(response.body);
      List<Map<String, dynamic>> structuredData = [];

      // Look for standard navigation/TOC elements
      final sidebars = document.querySelectorAll('nav, aside, .sidebar, .toc, #toc, ul.nav, ul.menu, .summary');
      List<String> rawNodes = [];

      if (sidebars.isNotEmpty) {
        // Extract links from the largest sidebar/nav element
        var bestSidebar = sidebars.reduce((a, b) => a.text.length > b.text.length ? a : b);
        final links = bestSidebar.querySelectorAll('a');
        rawNodes = links.map((e) => e.text.trim()).where((t) => t.isNotEmpty && t.length > 2 && t.length < 60).toList();
      } else {
        // Fallback: extract all headers and links
        final elements = document.querySelectorAll('h2, h3, a');
        rawNodes = elements.map((e) => e.text.trim()).where((t) => t.isNotEmpty && t.length > 2 && t.length < 60).toSet().toList();
      }

      // Group into modules
      if (rawNodes.isNotEmpty) {
        int index = 0;
        int moduleNumber = 1;
        while (index < rawNodes.length) {
          final mod = {
            'title': 'Module $moduleNumber',
            'nodes': <String>[]
          };
          // Put 5-8 concepts per module
          int chunkSize = 6;
          for (int i = 0; i < chunkSize && index < rawNodes.length; i++) {
            (mod['nodes'] as List<String>).add(rawNodes[index]);
            index++;
          }
          if ((mod['nodes'] as List).isNotEmpty) {
            structuredData.add(mod);
            moduleNumber++;
          }
          if (moduleNumber > 10) break; // Don't create overwhelmingly massive roadmaps
        }
      }

      // Absolute fallback if scraping totally fails (e.g. JS-only SPA like DevDocs)
      if (structuredData.isEmpty) {
        structuredData = [
          {'title': '1. $topic Essentials', 'nodes': ['Getting Started', 'Basic Syntax', 'Core Types', 'Hello World']},
          {'title': '2. Intermediate Concepts', 'nodes': ['Data Structures', 'Functions & Methods', 'Object Orientation', 'Error Handling']},
          {'title': '3. Advanced Topics', 'nodes': ['Concurrency', 'Memory Management', 'Design Patterns', 'Performance']},
        ];
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
        _status = 'Error: $e\n\nTip: SPAs like devdocs.io load via Javascript. Try using a direct tutorial URL like learncpp.com instead!';
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
              child: const Text(
                'Provide a target URL and DevAtlas will automatically scrape its Table of Contents to build a personalized curriculum. Note: Use standard documentation sites (like python.org or learncpp.com). Javascript-only sites may fail to parse.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(
                labelText: 'Roadmap Subject',
                hintText: 'e.g. Modern C++',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Official Documentation URL',
                hintText: 'e.g. https://learncpp.com/',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
            ),
            const SizedBox(height: 32),
            if (_isGenerating)
              Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 24),
                  Text(_status, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16), textAlign: TextAlign.center),
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
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(_status, style: const TextStyle(color: Colors.red, height: 1.5, fontSize: 14)),
                ),
            ]
          ],
        ),
      ),
    );
  }
}
