import 'package:shared_preferences/shared_preferences.dart';
import '../domain/reader_preferences.dart';

class PreferencesRepository {
  final SharedPreferences _prefs;

  PreferencesRepository(this._prefs);

  ReaderPreferences loadPreferences() {
    final themeStr = _prefs.getString('theme') ?? 'dark';
    final theme = ThemePreference.values.firstWhere(
      (e) => e.name == themeStr,
      orElse: () => ThemePreference.dark,
    );

    return ReaderPreferences(
      theme: theme,
      fontSize: _prefs.getDouble('fontSize') ?? 18.0,
      lineHeight: _prefs.getDouble('lineHeight') ?? 1.6,
      readingWidth: _prefs.getDouble('readingWidth') ?? 800.0,
      codeFontSize: _prefs.getDouble('codeFontSize') ?? 14.0,
    );
  }

  Future<void> savePreferences(ReaderPreferences prefs) async {
    await _prefs.setString('theme', prefs.theme.name);
    await _prefs.setDouble('fontSize', prefs.fontSize);
    await _prefs.setDouble('lineHeight', prefs.lineHeight);
    await _prefs.setDouble('readingWidth', prefs.readingWidth);
    await _prefs.setDouble('codeFontSize', prefs.codeFontSize);
  }
}
