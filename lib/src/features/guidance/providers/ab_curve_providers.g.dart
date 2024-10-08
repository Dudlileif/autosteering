// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBCurveHash() => r'a5bbad5086a9053793b2ba00effc469fa0472310';

/// A provider for the AB-curve.
///
/// Copied from [aBCurve].
@ProviderFor(aBCurve)
final aBCurveProvider = FutureProvider<ABCurve?>.internal(
  aBCurve,
  name: r'aBCurveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBCurveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ABCurveRef = FutureProviderRef<ABCurve?>;
String _$aBCurvePointsHash() => r'310abb48c3eda109934102073936b71772c9bd95';

/// A provider for the curve points for the AB-curve.
///
/// Copied from [ABCurvePoints].
@ProviderFor(ABCurvePoints)
final aBCurvePointsProvider =
    NotifierProvider<ABCurvePoints, List<WayPoint>?>.internal(
  ABCurvePoints.new,
  name: r'aBCurvePointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBCurvePointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABCurvePoints = Notifier<List<WayPoint>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
