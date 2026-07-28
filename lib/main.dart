import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di/injection.dart' as di;

import 'core/theme/dev_atlas_theme.dart';
import 'core/router/app_router.dart';
import 'features/settings/presentation/preferences_provider.dart';
import 'features/settings/domain/reader_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const DevAtlasApp(),
    ),
  );
}

class DevAtlasApp extends ConsumerWidget {
  const DevAtlasApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final preferences = ref.watch(readerPreferencesProvider);

    ThemeData getThemeData() {
      switch (preferences.theme) {
        case ThemePreference.dark: return DevAtlasTheme.darkTheme;
        case ThemePreference.amoled: return DevAtlasTheme.amoledTheme;
        case ThemePreference.sepia: return DevAtlasTheme.sepiaTheme;
        case ThemePreference.focus: return DevAtlasTheme.focusTheme;
      }
    }

    return MaterialApp.router(
      title: 'DevAtlas',
      theme: getThemeData(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
