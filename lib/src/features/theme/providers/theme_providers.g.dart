// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'2534e8e2557daf69f2be4f347a89223ddc705f27';

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
String _$activeThemeModeHash() => r'1a51aab764a270c00c8b7a59237de47abf0f4cd8';

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
String _$useManufacturerColorsHash() =>
    r'91922110fb07325c4260645cd5d8351a8505b89a';

/// See also [UseManufacturerColors].
@ProviderFor(UseManufacturerColors)
final useManufacturerColorsProvider =
    AutoDisposeNotifierProvider<UseManufacturerColors, bool>.internal(
  UseManufacturerColors.new,
  name: r'useManufacturerColorsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$useManufacturerColorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UseManufacturerColors = AutoDisposeNotifier<bool>;
String _$colorSchemeHash() => r'3c44a7ae8ed626720c2a4f89da11c0ac3d6e2e20';

/// A provider that contains theme color state.
///
/// Copied from [ColorScheme].
@ProviderFor(ColorScheme)
final colorSchemeProvider =
    AutoDisposeNotifierProvider<ColorScheme, FlexScheme>.internal(
  ColorScheme.new,
  name: r'colorSchemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$colorSchemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ColorScheme = AutoDisposeNotifier<FlexScheme>;
String _$manufacturerHash() => r'af8ba3d8f1943b33cb83c6e95412fa57595e288e';

/// A provider that contains theme color state.
///
/// Copied from [Manufacturer].
@ProviderFor(Manufacturer)
final manufacturerProvider =
    AutoDisposeNotifierProvider<Manufacturer, ManufacturerColor>.internal(
  Manufacturer.new,
  name: r'manufacturerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$manufacturerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Manufacturer = AutoDisposeNotifier<ManufacturerColor>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
