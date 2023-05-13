import 'package:agopengps_flutter/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main [MaterialApp] wrapper for the whole application.
class AgOpenGps extends ConsumerWidget {
  const AgOpenGps({
    super.key,
    this.loading = false,
  });

  /// Used to show that the app is loading, will show a progress indicator
  /// instead of the app.
  final bool loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(activeThemeModeProvider);

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
