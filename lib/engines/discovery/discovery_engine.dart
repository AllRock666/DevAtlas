import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'discovery_models.dart';
import '../pipeline/url_normalizer.dart';

class DiscoveryEngine extends ChangeNotifier {
  DiscoverySession? _currentSession;
  
  DiscoverySession? get currentSession => _currentSession;
  
  bool _isRunning = false;
  bool get isRunning => _isRunning;

  void startDiscovery(String url, String importMode, {int maxPages = 500}) {
    _currentSession = DiscoverySession(
      rootUrl: UrlNormalizer.normalize(url),
      importMode: importMode,
      maxPages: maxPages,
    );
    _isRunning = true;
    notifyListeners();
    _crawl();
  }
  
  void cancelDiscovery() {
    _isRunning = false;
    if (_currentSession != null) {
       _currentSession!.isComplete = true;
    }
    notifyListeners();
  }

  Future<void> _crawl() async {
    if (_currentSession == null || !_isRunning) return;
    
    final session = _currentSession!;
    final queue = Queue<String>();
    
    // Initial node
    session.nodes[session.rootUrl] = DiscoveryNode(url: session.rootUrl);
    queue.add(session.rootUrl);
    
    while (queue.isNotEmpty && _isRunning && session.nodes.length <= session.maxPages) {
      final currentUrl = queue.removeFirst();
      final node = session.nodes[currentUrl]!;
      
      if (node.status != DiscoveryStatus.pending) continue;
      
      try {
        final proxyUrl = Uri.parse('https://corsproxy.io/?url=${Uri.encodeComponent(currentUrl)}');
        final response = await http.get(proxyUrl);
        
        if (response.statusCode != 200) {
          node.status = DiscoveryStatus.blocked;
          node.errorReason = 'HTTP \${response.statusCode}';
          node.isSelected = false;
        } else {
          final document = html_parser.parse(response.body);
          final title = document.querySelector('title')?.text.trim() ?? 'Untitled';
          
          if (_isBotChallenge(title, response.body)) {
            node.status = DiscoveryStatus.blocked;
            node.errorReason = 'Bot Challenge Detected';
            node.isSelected = false;
            node.title = title;
          } else {
            node.status = DiscoveryStatus.success;
            node.title = title;
            
            // Extract links if mode is not 'page'
            if (session.importMode != 'page') {
              final links = document.querySelectorAll('a').map((a) => a.attributes['href']).where((href) => href != null).cast<String>().toList();
              
              for (var href in links) {
                if (session.nodes.length >= session.maxPages) break;
                
                final normalizedLink = UrlNormalizer.normalize(href, baseUrlStr: currentUrl);
                
                if (session.nodes.containsKey(normalizedLink)) continue;
                
                bool isExternal = !UrlNormalizer.isSameDomain(session.rootUrl, normalizedLink);
                bool shouldCrawl = false;
                
                if (session.importMode == 'section') {
                  shouldCrawl = UrlNormalizer.isSameSection(session.rootUrl, normalizedLink);
                } else if (session.importMode == 'site') {
                  shouldCrawl = !isExternal;
                }
                
                if (isExternal) {
                  // Track it but don't queue
                  session.nodes[normalizedLink] = DiscoveryNode(
                    url: normalizedLink,
                    parentUrl: currentUrl,
                    status: DiscoveryStatus.external,
                    isSelected: false,
                  );
                } else if (shouldCrawl) {
                  session.nodes[normalizedLink] = DiscoveryNode(
                    url: normalizedLink,
                    parentUrl: currentUrl,
                  );
                  queue.add(normalizedLink);
                }
              }
            }
          }
        }
      } catch (e) {
        node.status = DiscoveryStatus.blocked;
        node.errorReason = 'Network Error';
        node.isSelected = false;
      }
      
      notifyListeners();
      
      // Polite delay
      await Future.delayed(const Duration(milliseconds: 500));
    }
    
    _isRunning = false;
    session.isComplete = true;
    notifyListeners();
  }
  
  bool _isBotChallenge(String title, String body) {
    title = title.toLowerCase();
    if (title.contains('just a moment') || title.contains('attention required') || title.contains('security check') || title.contains('cloudflare')) {
      return true;
    }
    if (body.contains('cf-browser-verification') || body.contains('cf-challenge')) {
      return true;
    }
    return false;
  }
}
