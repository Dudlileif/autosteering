// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the curve points for the AB-curve.

@ProviderFor(ABCurvePoints)
const aBCurvePointsProvider = ABCurvePointsProvider._();

/// A provider for the curve points for the AB-curve.
final class ABCurvePointsProvider
    extends $NotifierProvider<ABCurvePoints, List<guidance.WayPoint>?> {
  /// A provider for the curve points for the AB-curve.
  const ABCurvePointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBCurvePointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBCurvePointsHash();

  @$internal
  @override
  ABCurvePoints create() => ABCurvePoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<guidance.WayPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<guidance.WayPoint>?>(value),
    );
  }
}

String _$aBCurvePointsHash() => r'7cbb02c6b77cd8ebc2801d8313be67efbf64bb60';

/// A provider for the curve points for the AB-curve.

abstract class _$ABCurvePoints extends $Notifier<List<guidance.WayPoint>?> {
  List<guidance.WayPoint>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<List<guidance.WayPoint>?, List<guidance.WayPoint>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<guidance.WayPoint>?, List<guidance.WayPoint>?>,
              List<guidance.WayPoint>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the AB-curve.

@ProviderFor(ABCurve)
const aBCurveProvider = ABCurveProvider._();

/// A provider for the AB-curve.
final class ABCurveProvider
    extends $AsyncNotifierProvider<ABCurve, guidance.ABCurve?> {
  /// A provider for the AB-curve.
  const ABCurveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBCurveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBCurveHash();

  @$internal
  @override
  ABCurve create() => ABCurve();
}

String _$aBCurveHash() => r'be12162470875036a0462ffe78234f34a90d8535';

/// A provider for the AB-curve.

abstract class _$ABCurve extends $AsyncNotifier<guidance.ABCurve?> {
  FutureOr<guidance.ABCurve?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<guidance.ABCurve?>, guidance.ABCurve?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<guidance.ABCurve?>, guidance.ABCurve?>,
              AsyncValue<guidance.ABCurve?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
