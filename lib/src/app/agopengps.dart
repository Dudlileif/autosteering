import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main [MaterialApp] wrapper for the whole application.
class AgOpenGps extends ConsumerWidget {
  /// The main [MaterialApp] wrapper for the whole application.
  ///
  /// Will show a [CircularProgressIndicator] during initial loading.
  const AgOpenGps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(activeThemeModeProvider);

    var loading = true;

    // We are loading until the file directory and the settings file are
    // ready.
    if (ref.watch(fileDirectoryProvider) is AsyncData) {
      loading = ref.watch(settingsFileProvider) is! AsyncData;
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
