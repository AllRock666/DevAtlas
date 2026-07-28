import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/reader_preferences.dart';
import '../data/preferences_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize this in main()');
});

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PreferencesRepository(ref.watch(sharedPreferencesProvider));
});

final readerPreferencesProvider = NotifierProvider<ReaderPreferencesNotifier, ReaderPreferences>(() {
  return ReaderPreferencesNotifier();
});

class ReaderPreferencesNotifier extends Notifier<ReaderPreferences> {
  @override
  ReaderPreferences build() {
    final repo = ref.watch(preferencesRepositoryProvider);
    return repo.loadPreferences();
  }

  Future<void> updatePreferences(ReaderPreferences prefs) async {
    state = prefs;
    await ref.read(preferencesRepositoryProvider).savePreferences(prefs);
  }
}
