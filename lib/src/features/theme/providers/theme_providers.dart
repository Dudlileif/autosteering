import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_providers.g.dart';

/// A provider that contains the current theme mode state.
@riverpod
class ActiveThemeMode extends _$ActiveThemeMode {
  @override
  ThemeMode build() => ThemeMode.system;

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
  ManufacturerColor build() => ManufacturerColor.masseyFerguson;

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
