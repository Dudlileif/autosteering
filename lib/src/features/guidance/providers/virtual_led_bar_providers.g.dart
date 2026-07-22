// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_led_bar_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the virtual led bar should be enabled/shown.

@ProviderFor(VirtualLedBarEnabled)
final virtualLedBarEnabledProvider = VirtualLedBarEnabledProvider._();

/// A provider for whether the virtual led bar should be enabled/shown.
final class VirtualLedBarEnabledProvider
    extends $NotifierProvider<VirtualLedBarEnabled, bool> {
  /// A provider for whether the virtual led bar should be enabled/shown.
  VirtualLedBarEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'virtualLedBarEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$virtualLedBarEnabledHash();

  @$internal
  @override
  VirtualLedBarEnabled create() => VirtualLedBarEnabled();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$virtualLedBarEnabledHash() =>
    r'2fdc9535a062f326fb448d88d6539c2d62d97a8d';

/// A provider for whether the virtual led bar should be enabled/shown.

abstract class _$VirtualLedBarEnabled extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for storing the configuration for the virtual led bar.

@ProviderFor(VirtualLedBarConfiguration)
final virtualLedBarConfigurationProvider =
    VirtualLedBarConfigurationProvider._();

/// A provider for storing the configuration for the virtual led bar.
final class VirtualLedBarConfigurationProvider
    extends $NotifierProvider<VirtualLedBarConfiguration, LedBarConfig> {
  /// A provider for storing the configuration for the virtual led bar.
  VirtualLedBarConfigurationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'virtualLedBarConfigurationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$virtualLedBarConfigurationHash();

  @$internal
  @override
  VirtualLedBarConfiguration create() => VirtualLedBarConfiguration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LedBarConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LedBarConfig>(value),
    );
  }
}

String _$virtualLedBarConfigurationHash() =>
    r'0275de340e9ed384fbb938893114fcb72782de86';

/// A provider for storing the configuration for the virtual led bar.

abstract class _$VirtualLedBarConfiguration extends $Notifier<LedBarConfig> {
  LedBarConfig build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LedBarConfig, LedBarConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LedBarConfig, LedBarConfig>,
              LedBarConfig,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].

@ProviderFor(VirtualLedBarTesting)
final virtualLedBarTestingProvider = VirtualLedBarTestingProvider._();

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].
final class VirtualLedBarTestingProvider
    extends $NotifierProvider<VirtualLedBarTesting, bool> {
  /// A provider for whether we're testing the virtual LED bar with
  /// [VirtualLedBarTestingDistance].
  VirtualLedBarTestingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'virtualLedBarTestingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$virtualLedBarTestingHash();

  @$internal
  @override
  VirtualLedBarTesting create() => VirtualLedBarTesting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$virtualLedBarTestingHash() =>
    r'53c1979ff9d5c8abcf6276282e2cda455e4c5be8';

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].

abstract class _$VirtualLedBarTesting extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for a testing cross track distance for the virtual LED bar.

@ProviderFor(VirtualLedBarTestingDistance)
final virtualLedBarTestingDistanceProvider =
    VirtualLedBarTestingDistanceProvider._();

/// A provider for a testing cross track distance for the virtual LED bar.
final class VirtualLedBarTestingDistanceProvider
    extends $NotifierProvider<VirtualLedBarTestingDistance, double?> {
  /// A provider for a testing cross track distance for the virtual LED bar.
  VirtualLedBarTestingDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'virtualLedBarTestingDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$virtualLedBarTestingDistanceHash();

  @$internal
  @override
  VirtualLedBarTestingDistance create() => VirtualLedBarTestingDistance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$virtualLedBarTestingDistanceHash() =>
    r'f7b3cc291f25d74f03ac10d5aeacaac2dd9e6b4b';

/// A provider for a testing cross track distance for the virtual LED bar.

abstract class _$VirtualLedBarTestingDistance extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the perpendicular distance to the currently active
/// guidance, otherwise 0.

@ProviderFor(virtualLedBarPerpendicularDistance)
final virtualLedBarPerpendicularDistanceProvider =
    VirtualLedBarPerpendicularDistanceProvider._();

/// A provider for the perpendicular distance to the currently active
/// guidance, otherwise 0.

final class VirtualLedBarPerpendicularDistanceProvider
    extends $FunctionalProvider<double?, double?, double?>
    with $Provider<double?> {
  /// A provider for the perpendicular distance to the currently active
  /// guidance, otherwise 0.
  VirtualLedBarPerpendicularDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'virtualLedBarPerpendicularDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$virtualLedBarPerpendicularDistanceHash();

  @$internal
  @override
  $ProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double? create(Ref ref) {
    return virtualLedBarPerpendicularDistance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$virtualLedBarPerpendicularDistanceHash() =>
    r'58efc5e084dec6dc5db0ac1ca95b0ca8c09e337b';
