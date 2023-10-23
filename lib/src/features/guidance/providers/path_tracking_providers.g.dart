// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_tracking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pathTrackingPerpendicularDistanceHash() =>
    r'84c59cac95e6c209f1abd2aab04b2d1dba6fda3f';

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].
///
/// Copied from [pathTrackingPerpendicularDistance].
@ProviderFor(pathTrackingPerpendicularDistance)
final pathTrackingPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  pathTrackingPerpendicularDistance,
  name: r'pathTrackingPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathTrackingPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PathTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$pathInterpolationDistanceHash() =>
    r'3838e0d5947ecf47190196f1fa4998a29f429156';

/// A provider for the path interpolation distance.
///
/// Copied from [PathInterpolationDistance].
@ProviderFor(PathInterpolationDistance)
final pathInterpolationDistanceProvider =
    NotifierProvider<PathInterpolationDistance, double>.internal(
  PathInterpolationDistance.new,
  name: r'pathInterpolationDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathInterpolationDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathInterpolationDistance = Notifier<double>;
String _$configuredPathTrackingHash() =>
    r'e5ab0aadda82fe9b08349f141304de69e048a9c2';

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.
///
/// Copied from [ConfiguredPathTracking].
@ProviderFor(ConfiguredPathTracking)
final configuredPathTrackingProvider =
    NotifierProvider<ConfiguredPathTracking, PathTracking?>.internal(
  ConfiguredPathTracking.new,
  name: r'configuredPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredPathTracking = Notifier<PathTracking?>;
String _$enablePathTrackingHash() =>
    r'f2c5ebe62db42bb904e0c728de685fc8f2ff8250';

/// A provider for whether or not the vehicle should follow the
/// [ConfiguredPathTracking] tracking model.
///
/// Copied from [EnablePathTracking].
@ProviderFor(EnablePathTracking)
final enablePathTrackingProvider =
    NotifierProvider<EnablePathTracking, bool>.internal(
  EnablePathTracking.new,
  name: r'enablePathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enablePathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnablePathTracking = Notifier<bool>;
String _$pathTrackingLoopHash() => r'efd0e7b54cdcbf6422837e294c0ae85d57b6d62b';

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.
///
/// Copied from [PathTrackingLoop].
@ProviderFor(PathTrackingLoop)
final pathTrackingLoopProvider =
    NotifierProvider<PathTrackingLoop, PathTrackingLoopMode>.internal(
  PathTrackingLoop.new,
  name: r'pathTrackingLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathTrackingLoopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathTrackingLoop = Notifier<PathTrackingLoopMode>;
String _$displayPathTrackingHash() =>
    r'702008a43c19219bd6ab7e5910fec0f670001753';

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.
///
/// Copied from [DisplayPathTracking].
@ProviderFor(DisplayPathTracking)
final displayPathTrackingProvider =
    AutoDisposeNotifierProvider<DisplayPathTracking, PathTracking?>.internal(
  DisplayPathTracking.new,
  name: r'displayPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayPathTracking = AutoDisposeNotifier<PathTracking?>;
String _$debugPathTrackingHash() => r'db41c00fa0d4a921e7251aea9fce8d341463b4c9';

/// A provider for whether or not the path tracking debugging features should
/// show.
///
/// Copied from [DebugPathTracking].
@ProviderFor(DebugPathTracking)
final debugPathTrackingProvider =
    NotifierProvider<DebugPathTracking, bool>.internal(
  DebugPathTracking.new,
  name: r'debugPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugPathTracking = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
