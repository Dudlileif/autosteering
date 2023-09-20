// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$aBCurveDebugHash() => r'9414f5f0c19a59ecc177a970255f28f8de352699';

/// A provider for the AB-line object to debug.
///
/// Copied from [ABCurveDebug].
@ProviderFor(ABCurveDebug)
final aBCurveDebugProvider = NotifierProvider<ABCurveDebug, ABCurve?>.internal(
  ABCurveDebug.new,
  name: r'aBCurveDebugProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBCurveDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABCurveDebug = Notifier<ABCurve?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
