import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../settings/presentation/preferences_provider.dart';
import '../../../settings/domain/reader_preferences.dart';

class ReaderPreferencesSheet extends ConsumerWidget {
  const ReaderPreferencesSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    final notifier = ref.read(readerPreferencesProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Reading Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            
            // Theme selection
            const Text('Theme', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: ThemePreference.values.map((theme) {
                final isSelected = prefs.theme == theme;
                return ChoiceChip(
                  label: Text(theme.name.toUpperCase()),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) notifier.updatePreferences(prefs.copyWith(theme: theme));
                  },
                );
              }).toList(),
            ),
            const Divider(height: 32),

            // Font Size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Font Size', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${prefs.fontSize.toInt()}px'),
              ],
            ),
            Slider(
              value: prefs.fontSize,
              min: 12.0,
              max: 28.0,
              divisions: 8,
              onChanged: (val) => notifier.updatePreferences(prefs.copyWith(fontSize: val)),
            ),
            
            // Line Height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Line Height', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(prefs.lineHeight.toStringAsFixed(1)),
              ],
            ),
            Slider(
              value: prefs.lineHeight,
              min: 1.2,
              max: 2.5,
              divisions: 13,
              onChanged: (val) => notifier.updatePreferences(prefs.copyWith(lineHeight: val)),
            ),

            // Font Family
            const Text('Font Family', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: ['Inter', 'Merriweather', 'Roboto Slab', 'Open Sans'].map((font) {
                final isSelected = prefs.fontFamily == font;
                return ChoiceChip(
                  label: Text(font),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) notifier.updatePreferences(prefs.copyWith(fontFamily: font));
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
