import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_providers.g.dart';

/// A provider that contains the current theme mode state.
@riverpod
class ActiveThemeMode extends _$ActiveThemeMode {
  @override
  ThemeMode build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.themeMode, next.name);
      }
    });

    final name =
        ref.read(settingsProvider.notifier).getString(SettingsKey.themeMode);

    return ThemeMode.values
            .firstWhereOrNull((element) => element.name == name) ??
        ThemeMode.system;
  }

  /// Update the [state] to [newMode].
  void update(ThemeMode newMode) => Future(() => state = newMode);

  /// Cycle throught the available states by going to the next one after the
  /// current [state].
  void cycle() => Future(
        () => state = switch (state) {
          ThemeMode.light => ThemeMode.system,
          ThemeMode.system => ThemeMode.dark,
          ThemeMode.dark => ThemeMode.light,
        },
      );
}

/// A provider that contains theme color state.
@riverpod
class Manufacturer extends _$Manufacturer {
  @override
  ManufacturerColor build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.themeColorScheme, next.name);
        if (next.name == 'Custom') {
          ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.themeColorSchemeCustom, next.toJson());
        }
      }
    });

    final name = ref
        .read(settingsProvider.notifier)
        .getString(SettingsKey.themeColorScheme);

    if (name == 'Custom') {
      final data = ref
          .read(settingsProvider.notifier)
          .getMap(SettingsKey.themeColorSchemeCustom);
      if (data != null) {
        return ManufacturerColor.fromJson(data);
      }
    }

    return ManufacturerColor.values
            .firstWhereOrNull((element) => element.name == name) ??
        ManufacturerColor.masseyFerguson;
  }

  /// Update the [state] to [newScheme].
  void update(ManufacturerColor newScheme) => Future(() => state = newScheme);

  /// Update the [state] by using the [index] of the wanted
  /// [ManufacturerColor].
  void updateByIndex(int index) =>
      Future(() => state = ManufacturerColor.values[index]);
}

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.
@riverpod
AppTheme appTheme(AppThemeRef ref) => AppTheme(
      lightColors: ManufacturerSchemes.scheme(
        ref.watch(manufacturerProvider),
        Brightness.light,
      ),
      darkColors: ManufacturerSchemes.scheme(
        ref.watch(manufacturerProvider),
        Brightness.dark,
      ),
      darkIsTrueBlack: true,
    );
