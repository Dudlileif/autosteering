import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(activeThemeModeProvider);

    if (loading) {
      // Add an artificial delay on web to allow the program to start up.
      if (Device.isWeb) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => setState(
            () => loading = false,
          ),
        );
      }
      // Native platforms with file directory support.
      else {
        // We are loading until the file directory and the settings file are
        // ready.
        if (ref.watch(fileDirectoryProvider) is AsyncData) {
          loading = ref.watch(settingsFileProvider) is! AsyncData;
        }
      }
    }

    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: loading
          ? const Center(
              child: SizedBox.square(
                dimension: 50,
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          : const MainScaffold(),
    );
  }
}
