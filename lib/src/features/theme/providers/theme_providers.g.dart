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
String _$activeThemeModeHash() => r'a50229066ec77b1070dff1df8f8beb270a70b2c9';

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
String _$manufacturerHash() => r'380fa025686141a51c42eed5030fb3e0a19c84ad';

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
    r'4c61ca7954dd990aaf6febed62665d514c802a3b';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
