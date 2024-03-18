// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/theme/theme.dart';
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
