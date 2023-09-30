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
String _$manufacturerHash() => r'e8abc4e7e65b32958b89ee02a0c5d799fbb159f6';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
