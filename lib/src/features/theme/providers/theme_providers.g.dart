// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'4bbcd940502f65d559e4a33c912fcc7cfd7c0d3c';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
