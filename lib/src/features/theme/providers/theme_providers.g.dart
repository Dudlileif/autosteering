// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that contains the current theme mode state.

@ProviderFor(ActiveThemeMode)
const activeThemeModeProvider = ActiveThemeModeProvider._();

/// A provider that contains the current theme mode state.
final class ActiveThemeModeProvider
    extends $NotifierProvider<ActiveThemeMode, ThemeMode> {
  /// A provider that contains the current theme mode state.
  const ActiveThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeThemeModeHash();

  @$internal
  @override
  ActiveThemeMode create() => ActiveThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$activeThemeModeHash() => r'ea842a0d618a46bb40f38dbfe44fb55426150ffe';

/// A provider that contains the current theme mode state.

abstract class _$ActiveThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider that contains theme color state.

@ProviderFor(Manufacturer)
const manufacturerProvider = ManufacturerProvider._();

/// A provider that contains theme color state.
final class ManufacturerProvider
    extends $NotifierProvider<Manufacturer, ManufacturerColors> {
  /// A provider that contains theme color state.
  const ManufacturerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manufacturerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manufacturerHash();

  @$internal
  @override
  Manufacturer create() => Manufacturer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ManufacturerColors value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ManufacturerColors>(value),
    );
  }
}

String _$manufacturerHash() => r'672980273f9dd5345c817f6bda9fc47dd5aacd5f';

/// A provider that contains theme color state.

abstract class _$Manufacturer extends $Notifier<ManufacturerColors> {
  ManufacturerColors build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ManufacturerColors, ManufacturerColors>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ManufacturerColors, ManufacturerColors>,
              ManufacturerColors,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for whether the [appTheme] should use [ManufacturerColors]
/// inherited from the active vehicle or from a selected one.

@ProviderFor(ColorSchemeInheritFromVehicle)
const colorSchemeInheritFromVehicleProvider =
    ColorSchemeInheritFromVehicleProvider._();

/// A provider for whether the [appTheme] should use [ManufacturerColors]
/// inherited from the active vehicle or from a selected one.
final class ColorSchemeInheritFromVehicleProvider
    extends $NotifierProvider<ColorSchemeInheritFromVehicle, bool> {
  /// A provider for whether the [appTheme] should use [ManufacturerColors]
  /// inherited from the active vehicle or from a selected one.
  const ColorSchemeInheritFromVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorSchemeInheritFromVehicleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorSchemeInheritFromVehicleHash();

  @$internal
  @override
  ColorSchemeInheritFromVehicle create() => ColorSchemeInheritFromVehicle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$colorSchemeInheritFromVehicleHash() =>
    r'27b91c55fc16da1ab629d094e2db9c66ac252f4f';

/// A provider for whether the [appTheme] should use [ManufacturerColors]
/// inherited from the active vehicle or from a selected one.

abstract class _$ColorSchemeInheritFromVehicle extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.

@ProviderFor(appTheme)
const appThemeProvider = AppThemeProvider._();

/// A provider for the app's theme.
///
/// Updates the [AppTheme] configuration when any of the providers
/// for the options changes.

final class AppThemeProvider
    extends $FunctionalProvider<AppTheme, AppTheme, AppTheme>
    with $Provider<AppTheme> {
  /// A provider for the app's theme.
  ///
  /// Updates the [AppTheme] configuration when any of the providers
  /// for the options changes.
  const AppThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeHash();

  @$internal
  @override
  $ProviderElement<AppTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTheme create(Ref ref) {
    return appTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTheme>(value),
    );
  }
}

String _$appThemeHash() => r'a0e1e6a557c3982603ada24101684b2e1ea531c1';
