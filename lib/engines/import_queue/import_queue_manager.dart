import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../di/injection.dart' as di;
import '../pipeline/content_source_engine.dart';
import '../storage/database.dart';
import '../pipeline/url_normalizer.dart';
import 'package:drift/drift.dart' as drift;

class ImportQueueManager extends ChangeNotifier {
  final ContentSourceEngine _engine = di.getIt<ContentSourceEngine>();
  final AppDatabase _db = di.getIt<AppDatabase>();
  
  List<ImportQueueItem> _jobs = [];
  ImportQueueItem? _currentJob;
  bool _isPaused = false;
  
  List<ImportQueueItem> get jobs => List.unmodifiable(_jobs);
  ImportQueueItem? get currentJob => _currentJob;
  bool get isPaused => _isPaused;

  ImportQueueManager() {
    _loadJobs();
    // Auto-resume on startup if not explicitly paused
    // Optionally wait a bit before starting
    Future.delayed(const Duration(seconds: 2), () {
      if (!_isPaused) {
        _processQueue();
      }
    });
  }

  void _loadJobs() {
    _db.select(_db.importQueueItems).watch().listen((dbJobs) {
      _jobs = dbJobs;
      notifyListeners();
      if (!_isPaused && _currentJob == null) {
        _processQueue();
      }
    });
  }
  
  Future<void> addJob(String url, {
    String? batchName, 
    String importMode = 'page', 
    String? parentId,
    int depth = 0,
    String? crawlSessionId,
  }) async {
    final normalizedUrl = UrlNormalizer.normalize(url);
    
    // Check if already in queue or completed
    final existing = await (_db.select(_db.importQueueItems)
      ..where((tbl) => tbl.url.equals(normalizedUrl))
    ).getSingleOrNull();

    if (existing != null) {
      if (existing.status == 'completed' || existing.status == 'queued' || existing.status == 'running') {
        return; // Already processed or in queue
      }
    }

    final job = ImportQueueItemsCompanion.insert(
      id: const Uuid().v4(),
      url: normalizedUrl,
      batchName: drift.Value(batchName),
      importMode: drift.Value(importMode),
      parentId: drift.Value(parentId),
      depth: drift.Value(depth),
      crawlSessionId: drift.Value(crawlSessionId ?? const Uuid().v4()),
      status: const drift.Value('queued'),
      addedAt: drift.Value(DateTime.now()),
    );
    
    await _db.into(_db.importQueueItems).insertOnConflictUpdate(job);
  }
  
  Future<void> addBatch(String batchName, List<String> urls) async {
    for (var url in urls) {
      await addJob(url, batchName: batchName);
    }
  }

  void pause() {
    _isPaused = true;
    notifyListeners();
  }

  void resume() {
    _isPaused = false;
    notifyListeners();
    _processQueue();
  }

  Future<void> cancel(String jobId) async {
    await (_db.update(_db.importQueueItems)..where((tbl) => tbl.id.equals(jobId)))
        .write(const ImportQueueItemsCompanion(status: drift.Value('cancelled')));
  }
  
  Future<void> retry(String jobId) async {
    await (_db.update(_db.importQueueItems)..where((tbl) => tbl.id.equals(jobId)))
        .write(const ImportQueueItemsCompanion(status: drift.Value('queued'), error: drift.Value(null)));
    if (!_isPaused) _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isPaused || _currentJob != null) return;
    
    final queuedJobs = await (_db.select(_db.importQueueItems)
      ..where((tbl) => tbl.status.equals('queued'))
      ..orderBy([(t) => drift.OrderingTerm(expression: t.addedAt)])
      ..limit(1)
    ).get();

    if (queuedJobs.isEmpty) return;
    
    _currentJob = queuedJobs.first;
    
    await (_db.update(_db.importQueueItems)..where((tbl) => tbl.id.equals(_currentJob!.id)))
        .write(const ImportQueueItemsCompanion(status: drift.Value('running')));
        
    notifyListeners();
    
    try {
        final document = await _engine.ingestFromUrl(_currentJob!.url);
        
        // Polite crawl delay
        await Future.delayed(const Duration(milliseconds: 1000));
        
        // Handle crawling logic based on mode
        // NOTE: Recursive crawling has been moved to DiscoveryEngine.
        // ImportQueueManager now only processes individual pages queued by the user.
        
        await (_db.update(_db.importQueueItems)..where((tbl) => tbl.id.equals(_currentJob!.id)))
          .write(const ImportQueueItemsCompanion(
            status: drift.Value('completed'),
            progress: drift.Value(1.0)
          ));

    } catch (e) {
        await (_db.update(_db.importQueueItems)..where((tbl) => tbl.id.equals(_currentJob!.id)))
          .write(ImportQueueItemsCompanion(
            status: const drift.Value('failed'),
            error: drift.Value(e.toString())
          ));
    } finally {
        _currentJob = null;
        notifyListeners();
        _processQueue();
    }
  }
}
