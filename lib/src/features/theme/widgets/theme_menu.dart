import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring the app's theme, i.e. the color scheme and the
/// theme mode.
class ThemeMenu extends StatelessWidget {
  /// A menu for configuring the app's theme, i.e. the color scheme and the
  /// theme mode.
  const ThemeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButtonWithChildren(
      text: 'Theme',
      icon: Icons.palette,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            final themeMode = ref.watch(activeThemeModeProvider);

            return MenuButtonWithChildren(
              text: 'Theme mode',
              icon: switch (themeMode) {
                ThemeMode.light => Icons.light_mode,
                ThemeMode.dark => Icons.dark_mode,
                ThemeMode.system => Icons.settings_brightness,
              },
              menuChildren: [
                Consumer(
                  builder: (context, ref, child) => ListTile(
                    leading: const Icon(Icons.light_mode),
                    title: const Text('Light mode'),
                    onTap: () => ref
                        .read(activeThemeModeProvider.notifier)
                        .update(ThemeMode.light),
                    selected: themeMode == ThemeMode.light,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark mode'),
                    onTap: () => ref
                        .read(activeThemeModeProvider.notifier)
                        .update(ThemeMode.dark),
                    selected: themeMode == ThemeMode.dark,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => ListTile(
                    leading: const Icon(Icons.settings_brightness),
                    title: const Text('Auto mode'),
                    onTap: () => ref
                        .read(activeThemeModeProvider.notifier)
                        .update(ThemeMode.system),
                    selected: themeMode == ThemeMode.system,
                  ),
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final colorTheme = ref.watch(manufacturerProvider);

            return MenuButtonWithChildren(
              text: 'Color theme',
              iconOverrideWidget: Icon(
                Icons.palette,
                color: colorTheme.primary,
              ),
              menuChildren: ManufacturerColor.values
                  .map(
                    (scheme) => ListTile(
                      leading: Icon(
                        Icons.palette,
                        color: scheme.primary,
                      ),
                      title: Text(scheme.name),
                      selected: colorTheme == scheme,
                      onTap: () => ref
                          .read(manufacturerProvider.notifier)
                          .update(scheme),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
