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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main [MaterialApp] wrapper for the whole application.
class Autosteering extends ConsumerStatefulWidget {
  /// The main [MaterialApp] wrapper for the whole application.
  ///
  /// Will show a [CircularProgressIndicator] during initial loading.
  const Autosteering({super.key});

  @override
  ConsumerState<Autosteering> createState() => _AutosteeringState();
}

class _AutosteeringState extends ConsumerState<Autosteering> {
  /// A variable to that is set to true after the first time the
  /// full startup is done. Needed so we don't log unnessecarily when the theme
  /// changes.
  bool startupLoadingDone = false;

  @override
  void initState() {
    super.initState();
    Logger.instance.i('Loading of file directory, settings and theme started.');
  }

  @override
  Widget build(BuildContext context) {
    if (!startupLoadingDone) {
      if (ref.watch(startupLoadingProvider)) {
        Logger.instance.i('Loading...');

        return const Center(
          child: SizedBox.square(
            dimension: 50,
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      }
    }

    final appTheme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(activeThemeModeProvider);

    Logger.instance.i('Theme updated.');

    if (!startupLoadingDone) {
      Logger.instance.i('Startup loading finished!');
    }

    final app = MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const MainScaffold(),
    );

    if (!startupLoadingDone) {
      Logger.instance.i('Application started successfully!');
    }
    startupLoadingDone = true;

    return app;
  }
}
