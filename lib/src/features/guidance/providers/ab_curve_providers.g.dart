// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBCurvePointsHash() => r'7cbb02c6b77cd8ebc2801d8313be67efbf64bb60';

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
String _$aBCurveHash() => r'a1e7fac1b911dcf5861e7c7d23c2d508f81f608a';

/// A provider for the AB-curve.
///
/// Copied from [ABCurve].
@ProviderFor(ABCurve)
final aBCurveProvider =
    AsyncNotifierProvider<ABCurve, guidance.ABCurve?>.internal(
  ABCurve.new,
  name: r'aBCurveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBCurveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABCurve = AsyncNotifier<guidance.ABCurve?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
