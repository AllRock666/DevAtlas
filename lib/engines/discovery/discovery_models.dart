class DiscoveryNode {
  final String url;
  final String? parentUrl;
  String title;
  DiscoveryStatus status;
  String? errorReason;
  bool isSelected;

  DiscoveryNode({
    required this.url,
    this.parentUrl,
    this.title = 'Pending...',
    this.status = DiscoveryStatus.pending,
    this.errorReason,
    this.isSelected = true, // By default selected if successful
  });
}

enum DiscoveryStatus {
  pending,
  success,
  blocked,
  duplicate,
  external,
}

class DiscoverySession {
  final String rootUrl;
  final String importMode;
  final int maxPages;
  
  final Map<String, DiscoveryNode> nodes = {};
  
  int get totalDiscovered => nodes.length;
  int get selectedCount => nodes.values.where((n) => n.isSelected && n.status == DiscoveryStatus.success).length;
  int get blockedCount => nodes.values.where((n) => n.status == DiscoveryStatus.blocked).length;
  int get duplicateCount => nodes.values.where((n) => n.status == DiscoveryStatus.duplicate).length;
  int get externalCount => nodes.values.where((n) => n.status == DiscoveryStatus.external).length;
  int get successCount => nodes.values.where((n) => n.status == DiscoveryStatus.success).length;

  bool isComplete = false;

  DiscoverySession({
    required this.rootUrl,
    required this.importMode,
    this.maxPages = 500,
  });
}
