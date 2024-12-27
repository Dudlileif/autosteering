// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'a0e1e6a557c3982603ada24101684b2e1ea531c1';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppThemeRef = AutoDisposeProviderRef<AppTheme>;
String _$activeThemeModeHash() => r'ea842a0d618a46bb40f38dbfe44fb55426150ffe';

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
String _$manufacturerHash() => r'672980273f9dd5345c817f6bda9fc47dd5aacd5f';

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
    r'27b91c55fc16da1ab629d094e2db9c66ac252f4f';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
