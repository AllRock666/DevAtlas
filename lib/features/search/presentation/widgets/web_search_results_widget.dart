import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../engines/search/web_search_engine.dart';
import '../../../../engines/import_queue/import_queue_manager.dart';
import '../../../../di/injection.dart' as di;

class WebSearchResultsWidget extends StatefulWidget {
  final String query;

  const WebSearchResultsWidget({super.key, required this.query});

  @override
  State<WebSearchResultsWidget> createState() => _WebSearchResultsWidgetState();
}

class _WebSearchResultsWidgetState extends State<WebSearchResultsWidget> {
  final WebSearchEngine _engine = WebSearchEngine();
  List<WebSearchResult>? _results;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _performSearch();
  }

  @override
  void didUpdateWidget(covariant WebSearchResultsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query) {
      _performSearch();
    }
  }

  String? _errorMessage;

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
      _results = null;
      _errorMessage = null;
    });
    
    try {
      final results = await _engine.search(widget.query);
      if (mounted) {
        setState(() {
          _results = results;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _importUrl(String url) {
    final queueManager = di.getIt<ImportQueueManager>();
    queueManager.addJob(url);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Import started. Check Library queue.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    
    if (_errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            _errorMessage!,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (_results == null || _results!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(child: Text('No web results found.')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Text('Search the Web', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: _results!.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final res = _results![index];
            return ListTile(
              title: Text(res.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(res.url, style: const TextStyle(color: Colors.green, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(res.snippet, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Import'),
                onPressed: () => _importUrl(res.url),
              ),
            );
          },
        ),
      ],
    );
  }
}
