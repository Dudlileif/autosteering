import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
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
  ManufacturerColors build() {
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
        return ManufacturerColors.fromJson(data);
      }
    }

    return ManufacturerColors.values
            .firstWhereOrNull((element) => element.name == name) ??
        ManufacturerColors.masseyFerguson;
  }

  /// Update the [state] to [newScheme].
  void update(ManufacturerColors newScheme) => Future(() => state = newScheme);

  /// Update the [state] by using the [index] of the wanted
  /// [ManufacturerColors].
  void updateByIndex(int index) =>
      Future(() => state = ManufacturerColors.values[index]);
}

/// A provider for whether the [appTheme] should use [ManufacturerColors]
/// inherited from the active vehicle or from a selected one.
@riverpod
class ColorSchemeInheritFromVehicle extends _$ColorSchemeInheritFromVehicle {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.themeColorSchemeInheritFromVehicle, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.themeColorSchemeInheritFromVehicle) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.
@riverpod
AppTheme appTheme(AppThemeRef ref) {
  final manufacturerColors = ref.watch(colorSchemeInheritFromVehicleProvider)
      ? ref.watch(
          configuredVehicleProvider.select((value) => value.manufacturerColors),
        )
      : ref.watch(manufacturerProvider);

  return AppTheme(
    lightColors: ManufacturerSchemes.scheme(
      manufacturerColors,
      Brightness.light,
    ),
    darkColors: ManufacturerSchemes.scheme(
      manufacturerColors,
      Brightness.dark,
    ),
    darkIsTrueBlack: true,
  );
}
