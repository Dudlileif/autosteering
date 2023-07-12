import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A button to switch between the different theme modes.
class ThemeModeButton extends ConsumerWidget {
  /// A button to switch between the different theme modes.
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(activeThemeModeProvider);

    return IconButton(
      padding: const EdgeInsets.all(8),
      tooltip: 'Cycle Light/System/Dark mode',
      onPressed: ref.read(activeThemeModeProvider.notifier).cycle,
      icon: Icon(
        switch (themeMode) {
          ThemeMode.light => Icons.light_mode,
          ThemeMode.system => Icons.settings_brightness,
          ThemeMode.dark => Icons.dark_mode,
        },
      ),
    );
  }
}
