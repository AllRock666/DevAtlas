import 'package:get_it/get_it.dart';
import '../engines/storage/database.dart';
import '../engines/discovery/discovery_engine.dart';
import '../engines/pipeline/content_source_engine.dart';
import '../engines/pipeline/parser_registry.dart';
import '../engines/pipeline/resource_engine.dart';
import '../engines/knowledge_extraction/knowledge_extraction_engine.dart';
import '../engines/import_queue/import_queue_manager.dart';
import '../engines/revision/revision_engine.dart';
import '../engines/roadmap/roadmap_engine.dart';
final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerLazySingleton<ResourceEngine>(() => ResourceEngine());
  getIt.registerLazySingleton<ParserRegistry>(() => ParserRegistry(getIt<ResourceEngine>()));
  getIt.registerLazySingleton<KnowledgeExtractionEngine>(() => KnowledgeExtractionEngine());
  getIt.registerLazySingleton<ContentSourceEngine>(() => ContentSourceEngine(
    getIt<AppDatabase>(),
    getIt<ParserRegistry>(),
    getIt<KnowledgeExtractionEngine>(),
  ));
  getIt.registerLazySingleton<ImportQueueManager>(() => ImportQueueManager(
    getIt<ContentSourceEngine>(),
    getIt<AppDatabase>(),
  ));
  getIt.registerLazySingleton<DiscoveryEngine>(() => DiscoveryEngine());
  getIt.registerLazySingleton<RevisionEngine>(() => RevisionEngine(
    getIt<AppDatabase>(),
  ));
  getIt.registerLazySingleton<RoadmapEngine>(() => RoadmapEngine(
    getIt<AppDatabase>(),
  ));
}
