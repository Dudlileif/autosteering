import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_providers.g.dart';

/// A provider that contains the current theme mode state.
@riverpod
class ActiveThemeMode extends _$ActiveThemeMode {
  @override
  ThemeMode build() => ThemeMode.system;

  void update(ThemeMode newMode) => Future(() => state = newMode);

  void cycle() => Future(
        () => state = state == ThemeMode.light
            ? ThemeMode.system
            : state == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark,
      );
}

@riverpod
class UseManufacturerColors extends _$UseManufacturerColors {
  @override
  bool build() => true;
}

/// A provider that contains theme color state.
@riverpod
class ColorScheme extends _$ColorScheme {
  @override
  FlexScheme build() => FlexScheme.green;

  void update(FlexScheme newScheme) => Future(() => state = newScheme);

  void updateByIndex(int index) =>
      Future(() => state = FlexScheme.values[index]);
}

/// A provider that contains theme color state.
@riverpod
class Manufacturer extends _$Manufacturer {
  @override
  ManufacturerColor build() => ManufacturerColor.masseyFerguson;

  void update(ManufacturerColor newScheme) => Future(() => state = newScheme);

  void updateByIndex(int index) =>
      Future(() => state = ManufacturerColor.values[index]);
}

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.
@riverpod
AppTheme appTheme(AppThemeRef ref) => AppTheme(
      useManufacturerColors: ref.watch(useManufacturerColorsProvider),
      flexScheme: ref.watch(colorSchemeProvider),
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
