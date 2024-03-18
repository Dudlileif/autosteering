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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'57647cd7e5ced15857e8619bdc2b361aa1ac37c6';

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.
///
/// Copied from [appTheme].
@ProviderFor(appTheme)
final appThemeProvider = AutoDisposeProvider<AppTheme>.internal(
  appTheme,
  name: r'appThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppThemeRef = AutoDisposeProviderRef<AppTheme>;
String _$activeThemeModeHash() => r'05dfb332b1df0291fc57bbea0779d5960a50d0f7';

/// A provider that contains the current theme mode state.
///
/// Copied from [ActiveThemeMode].
@ProviderFor(ActiveThemeMode)
final activeThemeModeProvider =
    AutoDisposeNotifierProvider<ActiveThemeMode, ThemeMode>.internal(
  ActiveThemeMode.new,
  name: r'activeThemeModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveThemeMode = AutoDisposeNotifier<ThemeMode>;
String _$manufacturerHash() => r'13fa2dbcabf1b262c973bccd5610e13fa05bf34d';

/// A provider that contains theme color state.
///
/// Copied from [Manufacturer].
@ProviderFor(Manufacturer)
final manufacturerProvider =
    AutoDisposeNotifierProvider<Manufacturer, ManufacturerColors>.internal(
  Manufacturer.new,
  name: r'manufacturerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$manufacturerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Manufacturer = AutoDisposeNotifier<ManufacturerColors>;
String _$colorSchemeInheritFromVehicleHash() =>
    r'3057e13434fa9738e1cecd5a61c17f3ab4da1a31';

/// A provider for whether the [appTheme] should use [ManufacturerColors]
/// inherited from the active vehicle or from a selected one.
///
/// Copied from [ColorSchemeInheritFromVehicle].
@ProviderFor(ColorSchemeInheritFromVehicle)
final colorSchemeInheritFromVehicleProvider =
    AutoDisposeNotifierProvider<ColorSchemeInheritFromVehicle, bool>.internal(
  ColorSchemeInheritFromVehicle.new,
  name: r'colorSchemeInheritFromVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$colorSchemeInheritFromVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ColorSchemeInheritFromVehicle = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
