import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart' as html_parser;

abstract class DocProvider {
  String get name;
  String get baseUrl;
  List<String> get supportedTopics;
  int get priority;
  
  /// Resolves the given concept to a direct documentation URL
  Future<String?> resolveUrl(String concept);
}

class SourceRegistry {
  static final List<DocProvider> _providers = [
    MDNProvider(),
    CppReferenceProvider(),
    LearnCppProvider(),
    PythonDocsProvider(),
  ];

  static List<DocProvider> getProvidersForContext(String concept, String? contextHint) {
    // Basic contextual filtering (e.g. if roadmap context is 'C++', prefer C++ providers)
    final lowerContext = (contextHint ?? '').toLowerCase();
    
    return _providers.where((p) {
      if (lowerContext.isEmpty) return true;
      return p.supportedTopics.any((t) => lowerContext.contains(t) || t.contains(lowerContext));
    }).toList()..sort((a, b) => b.priority.compareTo(a.priority));
  }
}

// ---------------------------------------------------------------------------
// Provider Implementations
// ---------------------------------------------------------------------------

class MDNProvider extends DocProvider {
  @override
  String get name => 'MDN Web Docs';
  
  @override
  String get baseUrl => 'developer.mozilla.org';
  
  @override
  List<String> get supportedTopics => ['html', 'css', 'javascript', 'web', 'front-end', 'backend', 'internet', 'react'];
  
  @override
  int get priority => 10;

  @override
  Future<String?> resolveUrl(String concept) async {
    // Scoped search using DuckDuckGo HTML internally, just to grab the URL.
    return _searchDuckDuckGo('site:developer.mozilla.org $concept');
  }
}

class CppReferenceProvider extends DocProvider {
  @override
  String get name => 'cppreference.com';
  
  @override
  String get baseUrl => 'en.cppreference.com';
  
  @override
  List<String> get supportedTopics => ['c++', 'cpp', 'c'];
  
  @override
  int get priority => 9;

  @override
  Future<String?> resolveUrl(String concept) async {
    return _searchDuckDuckGo('site:en.cppreference.com $concept');
  }
}

class LearnCppProvider extends DocProvider {
  @override
  String get name => 'LearnCpp.com';
  
  @override
  String get baseUrl => 'learncpp.com';
  
  @override
  List<String> get supportedTopics => ['c++', 'cpp'];
  
  @override
  int get priority => 8;

  @override
  Future<String?> resolveUrl(String concept) async {
    return _searchDuckDuckGo('site:learncpp.com $concept');
  }
}

class PythonDocsProvider extends DocProvider {
  @override
  String get name => 'Python Documentation';
  
  @override
  String get baseUrl => 'docs.python.org';
  
  @override
  List<String> get supportedTopics => ['python'];
  
  @override
  int get priority => 9;

  @override
  Future<String?> resolveUrl(String concept) async {
    return _searchDuckDuckGo('site:docs.python.org $concept');
  }
}

Future<String?> _searchDuckDuckGo(String query) async {
  final targetUrl = kIsWeb ? Uri.parse('https://corsproxy.io/?url=${Uri.encodeComponent('https://html.duckduckgo.com/html/?q=${Uri.encodeComponent(query)}')}') : Uri.parse('https://html.duckduckgo.com/html/?q=${Uri.encodeComponent(query)}');

  try {
    final response = await http.get(targetUrl, headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
    }).timeout(const Duration(seconds: 8));
    
    if (response.statusCode == 200) {
      final document = html_parser.parse(response.body);
      final resultNodes = document.querySelectorAll('.result__body');
      for (var node in resultNodes) {
        final urlNode = node.querySelector('.result__url');
        if (urlNode != null) {
          String href = urlNode.attributes['href'] ?? '';
          String link = '';
          if (href.contains('uddg=')) {
            if (href.startsWith('//')) {
              href = 'https:$href';
            }
            final uri = Uri.tryParse(href);
            link = uri?.queryParameters['uddg'] ?? '';
          }
          if (link.isEmpty) {
             link = urlNode.text.trim().replaceAll(' › ', '/');
             if (!link.startsWith('http')) link = 'https://$link';
          }
          return link; // return first match
        }
      }
    }
  } catch (e) {
    print('Internal resolver error: $e');
  }
  return null;
}
