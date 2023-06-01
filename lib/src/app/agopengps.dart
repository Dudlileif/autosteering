import 'package:agopengps_flutter/src/app/test_providers/test_settings_provider.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/main_scaffold.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main [MaterialApp] wrapper for the whole application.
class AgOpenGps extends ConsumerWidget {
  const AgOpenGps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(activeThemeModeProvider);

    final loading = ref.watch(applyTestSettingsProvider) is! AsyncData;

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
