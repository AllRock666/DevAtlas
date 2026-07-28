class UrlNormalizer {
  static String normalize(String urlStr, {String? baseUrlStr}) {
    Uri? uri = Uri.tryParse(urlStr);
    if (uri == null) return urlStr;

    if (!uri.hasScheme && baseUrlStr != null) {
      final baseUri = Uri.tryParse(baseUrlStr);
      if (baseUri != null) {
        uri = baseUri.resolveUri(uri);
      }
    }

    // Strip fragments and common tracking parameters
    final queryParams = Map<String, String>.from(uri.queryParameters);
    queryParams.removeWhere((key, value) => 
      key.startsWith('utm_') || 
      key == 'fbclid' || 
      key == 'gclid' ||
      key == 'ref'
    );

    // Rebuild URI without fragment and cleaned query params
    uri = uri.replace(
      fragment: '',
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );

    String normalized = uri.toString();
    // Normalize trailing slashes (except for root domain)
    if (normalized.endsWith('/') && uri.path != '/') {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    
    // Strip 'www.'
    if (uri.host.startsWith('www.')) {
      final newHost = uri.host.substring(4);
      uri = uri.replace(host: newHost);
      normalized = uri.toString();
      if (normalized.endsWith('/') && uri.path != '/') {
        normalized = normalized.substring(0, normalized.length - 1);
      }
    }

    return normalized;
  }

  static bool isSameDomain(String url1, String url2) {
    final u1 = Uri.tryParse(normalize(url1));
    final u2 = Uri.tryParse(normalize(url2));
    if (u1 == null || u2 == null) return false;
    return u1.host == u2.host;
  }

  static bool isSameSection(String parentUrl, String childUrl) {
    if (!isSameDomain(parentUrl, childUrl)) return false;
    
    final u1 = Uri.tryParse(normalize(parentUrl));
    final u2 = Uri.tryParse(normalize(childUrl));
    
    if (u1 == null || u2 == null) return false;

    final parentSegments = u1.pathSegments.where((s) => s.isNotEmpty).toList();
    final childSegments = u2.pathSegments.where((s) => s.isNotEmpty).toList();

    if (parentSegments.isEmpty) return true;
    
    int matchCount = parentSegments.length - 1;
    if (matchCount < 0) matchCount = 0;
    
    if (childSegments.length < matchCount) return false;
    
    for (int i = 0; i < matchCount; i++) {
      if (parentSegments[i] != childSegments[i]) return false;
    }
    
    return true;
  }

  static List<String> extractLinks(dynamic document, String baseUrlStr) {
    final discoveredLinks = <String>{};
    final aTags = document.querySelectorAll('a[href]');
    for (var a in aTags) {
      final href = a.attributes['href'];
      if (href != null && href.isNotEmpty && !href.startsWith('#') && !href.startsWith('mailto:') && !href.startsWith('javascript:')) {
        final normalized = normalize(href, baseUrlStr: baseUrlStr);
        if (isSameDomain(baseUrlStr, normalized)) {
          discoveredLinks.add(normalized);
        }
      }
    }
    return discoveredLinks.toList();
  }
}
