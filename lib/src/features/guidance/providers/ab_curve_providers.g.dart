// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBCurveDebugHash() => r'bde899e2eec0344c81e320033cabfafa92486b7e';

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
String _$aBCurvePointsHash() => r'85bcb5755ae5e6ded4c2fa09c84de694aafd6014';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
