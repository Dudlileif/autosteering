// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gauge_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the distance travelled by the vehicle.

@ProviderFor(GaugeTravelledDistance)
final gaugeTravelledDistanceProvider = GaugeTravelledDistanceProvider._();

/// A provider for the distance travelled by the vehicle.
final class GaugeTravelledDistanceProvider
    extends $NotifierProvider<GaugeTravelledDistance, double> {
  /// A provider for the distance travelled by the vehicle.
  GaugeTravelledDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gaugeTravelledDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gaugeTravelledDistanceHash();

  @$internal
  @override
  GaugeTravelledDistance create() => GaugeTravelledDistance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$gaugeTravelledDistanceHash() =>
    r'22e1975ceb6cfe8953845751975f1fd6c6ecab37';

/// A provider for the distance travelled by the vehicle.

abstract class _$GaugeTravelledDistance extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the vehicle's velocity gauge.

@ProviderFor(GaugeVelocity)
final gaugeVelocityProvider = GaugeVelocityProvider._();

/// A provider for the vehicle's velocity gauge.
final class GaugeVelocityProvider
    extends $NotifierProvider<GaugeVelocity, double> {
  /// A provider for the vehicle's velocity gauge.
  GaugeVelocityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gaugeVelocityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gaugeVelocityHash();

  @$internal
  @override
  GaugeVelocity create() => GaugeVelocity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$gaugeVelocityHash() => r'fc356f6d1b5f3e0bee2eff50319b6b478a02317f';

/// A provider for the vehicle's velocity gauge.

abstract class _$GaugeVelocity extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the vehicle's bearing gauge.

@ProviderFor(GaugeBearing)
final gaugeBearingProvider = GaugeBearingProvider._();

/// A provider for the vehicle's bearing gauge.
final class GaugeBearingProvider
    extends $NotifierProvider<GaugeBearing, double> {
  /// A provider for the vehicle's bearing gauge.
  GaugeBearingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gaugeBearingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gaugeBearingHash();

  @$internal
  @override
  GaugeBearing create() => GaugeBearing();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$gaugeBearingHash() => r'f7dc6a96a1d98593d3f7ab36603e999f5089917a';

/// A provider for the vehicle's bearing gauge.

abstract class _$GaugeBearing extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
