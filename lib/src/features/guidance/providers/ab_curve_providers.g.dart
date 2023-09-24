// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBCurveDebugHash() => r'199eab3d5e4b2fc0284c3c2c000d0e00c239b1a4';

/// A provider for the AB-curve object to debug.
///
/// Copied from [aBCurveDebug].
@ProviderFor(aBCurveDebug)
final aBCurveDebugProvider = FutureProvider<ABCurve?>.internal(
  aBCurveDebug,
  name: r'aBCurveDebugProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBCurveDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ABCurveDebugRef = FutureProviderRef<ABCurve?>;
String _$aBCurvePointsHash() => r'd2a05616f915484e3ff522e4fb3fa71cf729b109';

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
