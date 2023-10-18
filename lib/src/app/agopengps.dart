import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main [MaterialApp] wrapper for the whole application.
class AgOpenGps extends ConsumerStatefulWidget {
  /// The main [MaterialApp] wrapper for the whole application.
  ///
  /// Will show a [CircularProgressIndicator] during initial loading.
  const AgOpenGps({super.key});

  @override
  ConsumerState<AgOpenGps> createState() => _AgOpenGpsState();
}

class _AgOpenGpsState extends ConsumerState<AgOpenGps> {
  /// The initial state is loading that we later disengage.
  bool loading = true;

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
    if (loading) {
      // Add an artificial delay on web to allow the program to start up.
      if (Device.isWeb) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => setState(
            () => loading = ref.watch(lastUsedVehicleProvider) is! AsyncData,
          ),
        );
      }
      // Native platforms with file directory support.
      else {
        // We are loading until the file directory, the settings file and
        // the last used vehicle is ready.

        if (ref.watch(fileDirectoryProvider) is AsyncData) {
          if (ref.watch(settingsFileProvider) is AsyncData) {
            ref.watch(loggingProvider);
            loading = ref.watch(lastUsedVehicleProvider) is! AsyncData;
          }
        }
      }
    }

    if (loading) {
      Logger.instance.i('Loading...');

      return const Center(
        child: SizedBox.square(
          dimension: 50,
          child: CircularProgressIndicator.adaptive(),
        ),
      );
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
