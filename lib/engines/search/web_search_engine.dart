import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'dart:convert';

class WebSearchResult {
  final String title;
  final String url;
  final String snippet;

  WebSearchResult({required this.title, required this.url, required this.snippet});
}

class WebSearchEngine {
  /// Searches DuckDuckGo for the query restricted to our target sites.
  Future<List<WebSearchResult>> search(String query) async {
    final cleanQuery = query.trim();
    final isLikelyDomain = !cleanQuery.contains(' ') && cleanQuery.contains('.');
    if (cleanQuery.startsWith('http://') || cleanQuery.startsWith('https://') || cleanQuery.startsWith('www.') || isLikelyDomain) {
      String finalUrl = cleanQuery;
      if (!finalUrl.startsWith('http')) finalUrl = 'https://$finalUrl';
      return [
        WebSearchResult(
          title: 'Direct Link',
          url: finalUrl,
          snippet: 'Import directly from the provided URL.',
        )
      ];
    }

    // Restrict search to known high-quality documentation sites
    final sites = [
      'site:developer.mozilla.org',
      'site:learncpp.com',
      'site:cppreference.com',
      'site:learn.microsoft.com',
      'site:docs.python.org'
    ];
    
    final siteQuery = sites.join(' OR ');
    final searchQuery = '$siteQuery $cleanQuery';
    final targetUrl = kIsWeb ? Uri.parse('https://corsproxy.io/?url=${Uri.encodeComponent('https://html.duckduckgo.com/html/?q=${Uri.encodeComponent(searchQuery)}')}') : Uri.parse('https://html.duckduckgo.com/html/?q=${Uri.encodeComponent(searchQuery)}');

    try {
      final response = await http.get(targetUrl, headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
      }).timeout(const Duration(seconds: 8));
      
      if (response.statusCode == 200) {
        if (response.body.contains('error-lite@duckduckgo.com') || response.body.contains('Images not loading?')) {
          throw Exception('Search blocked by DuckDuckGo (bot detection). Please paste a direct URL into the search bar.');
        }
        
        final document = html_parser.parse(response.body);
        final results = <WebSearchResult>[];
        
        final resultNodes = document.querySelectorAll('.result__body');
        for (var node in resultNodes) {
          final titleNode = node.querySelector('.result__title a');
          final snippetNode = node.querySelector('.result__snippet');
          final urlNode = node.querySelector('.result__url');
          
          if (titleNode != null && urlNode != null) {
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

            results.add(WebSearchResult(
              title: titleNode.text.trim(),
              url: link,
              snippet: snippetNode?.text.trim() ?? '',
            ));
          }
        }
        
        return results;
      }
    } catch (e) {
      print('Web search error: $e');
    }
    
    return [];
  }
}
