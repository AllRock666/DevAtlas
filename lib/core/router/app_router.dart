import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/presentation/home_screen.dart';

import '../../features/library/presentation/library_screen.dart';
import '../../engines/discovery/presentation/discovery_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/study/presentation/study_viewer_screen.dart';
import '../../features/search/presentation/knowledge_search_screen.dart';
import '../../features/roadmap/presentation/roadmap_list_screen.dart';
import '../../features/roadmap/presentation/roadmap_detail_screen.dart';
import '../../features/roadmap/presentation/concept_resolution_screen.dart';
import '../../features/roadmap/presentation/roadmap_generator_screen.dart';

import '../../features/revision/presentation/active_recall_screen.dart';
import '../../features/home/presentation/dashboard_screen.dart';
import '../../engines/revision/revision_engine.dart';
import '../../features/workspace/presentation/global_workspace_sheet.dart';
import '../../engines/study_page_builder/study_page_builder.dart';
import '../../engines/study_page_builder/rendered_document.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/home', builder: (context, state) => const DashboardScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/roadmaps', builder: (context, state) => const RoadmapListScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/search', builder: (context, state) {
              final q = state.extra as String?;
              return KnowledgeSearchScreen(initialQuery: q);
            }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const LibraryScreen(),
            ),
            GoRoute(
              path: '/discovery',
              builder: (context, state) {
                final url = state.uri.queryParameters['url'] ?? '';
                final mode = state.uri.queryParameters['mode'] ?? 'page';
                return DiscoveryScreen(url: url, importMode: mode);
              },
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
          ]),
        ],
      ),
      GoRoute(
        path: '/study/:cardId',
        builder: (context, state) {
          final cardId = state.pathParameters['cardId']!;
          return FutureBuilder<RenderedStudyDocument>(
            future: DbStudyPageBuilder().buildPage(cardId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              }
              if (snapshot.hasError) {
                return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
              }
              return StudyViewerScreen(document: snapshot.data!);
            },
          );
        },
      ),
      GoRoute(
        path: '/roadmap/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RoadmapDetailScreen(roadmapId: id);
        },
      ),
      GoRoute(
        path: '/resolve_concept/:nodeId/:conceptName/:roadmapContext',
        builder: (context, state) {
          final nodeId = state.pathParameters['nodeId']!;
          final conceptName = state.pathParameters['conceptName']!;
          final roadmapContext = state.pathParameters['roadmapContext']!;
          return ConceptResolutionScreen(
            nodeId: nodeId,
            conceptName: conceptName,
            roadmapContext: roadmapContext,
          );
        },
      ),
      GoRoute(
        path: '/roadmap_generator',
        builder: (context, state) => const RoadmapGeneratorScreen(),
      ),
      GoRoute(
        path: '/recall',
        builder: (context, state) {
          final queue = state.extra as DailyRevisionQueue;
          return ActiveRecallScreen(queue: queue);
        },
      ),
    ],
  );
});

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.replay_outlined), selectedIcon: Icon(Icons.replay), label: 'Revision'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Roadmap'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.library_books_outlined), selectedIcon: Icon(Icons.library_books), label: 'Library'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => const Padding(
              padding: EdgeInsets.only(top: 48.0),
              child: GlobalWorkspaceSheet(),
            ),
          );
        },
        tooltip: 'Workspace',
        child: const Icon(Icons.edit_note),
      ),
    );
  }
}
