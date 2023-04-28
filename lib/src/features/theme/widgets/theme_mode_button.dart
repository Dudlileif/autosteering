import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeButton extends ConsumerWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(activeThemeModeProvider);
    return IconButton(
      padding: const EdgeInsets.all(8),
      tooltip: 'Cycle Light/System/Dark mode',
      onPressed: ref.read(activeThemeModeProvider.notifier).cycle,
      icon: Icon(
        themeMode == ThemeMode.light
            ? Icons.light_mode
            : themeMode == ThemeMode.system
                ? Icons.settings_brightness
                : Icons.dark_mode,
      ),
    );
  }
}
