// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debugVehiclePolygonsHash() =>
    r'acc0b0707ae4e0313df97a61646cdc4c3857f9e7';

/// Whether to show vehicle debug polygons.
///
/// Copied from [DebugVehiclePolygons].
@ProviderFor(DebugVehiclePolygons)
final debugVehiclePolygonsProvider =
    AutoDisposeNotifierProvider<DebugVehiclePolygons, bool>.internal(
  DebugVehiclePolygons.new,
  name: r'debugVehiclePolygonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehiclePolygonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehiclePolygons = AutoDisposeNotifier<bool>;
String _$debugVehicleSteeringHash() =>
    r'4458d087618cc15a63acdbfd34c17ad16a3ae058';

/// Whether to show vehicle steering debug features.
///
/// Copied from [DebugVehicleSteering].
@ProviderFor(DebugVehicleSteering)
final debugVehicleSteeringProvider =
    AutoDisposeNotifierProvider<DebugVehicleSteering, bool>.internal(
  DebugVehicleSteering.new,
  name: r'debugVehicleSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleSteering = AutoDisposeNotifier<bool>;
String _$debugVehicleTrajectoryHash() =>
    r'3bab08fa7115fff0ae81c6c4c0cebf284cc2d6fd';

/// Whether to show vehicle trajectory debug features.
///
/// Copied from [DebugVehicleTrajectory].
@ProviderFor(DebugVehicleTrajectory)
final debugVehicleTrajectoryProvider =
    AutoDisposeNotifierProvider<DebugVehicleTrajectory, bool>.internal(
  DebugVehicleTrajectory.new,
  name: r'debugVehicleTrajectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTrajectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTrajectory = AutoDisposeNotifier<bool>;
String _$debugVehicleTravelledPathHash() =>
    r'9ea4976502f010a6e12f6a6c5b54cf05de4906f9';

/// Whether to show vehicle travelled path debug.
///
/// Copied from [DebugVehicleTravelledPath].
@ProviderFor(DebugVehicleTravelledPath)
final debugVehicleTravelledPathProvider =
    AutoDisposeNotifierProvider<DebugVehicleTravelledPath, bool>.internal(
  DebugVehicleTravelledPath.new,
  name: r'debugVehicleTravelledPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTravelledPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTravelledPath = AutoDisposeNotifier<bool>;
String _$debugVehicleTravelledPathSizeHash() =>
    r'5f05e91b3ba1249e41a79944bfad86c33079981c';

/// The amount of points [DebugVehicleTravelledPathList] should hold.
///
/// Copied from [DebugVehicleTravelledPathSize].
@ProviderFor(DebugVehicleTravelledPathSize)
final debugVehicleTravelledPathSizeProvider =
    NotifierProvider<DebugVehicleTravelledPathSize, int>.internal(
  DebugVehicleTravelledPathSize.new,
  name: r'debugVehicleTravelledPathSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTravelledPathSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTravelledPathSize = Notifier<int>;
String _$debugVehicleTravelledPathListHash() =>
    r'df4fef6baa60f8ad7a71b3d9225706e473d20acc';

/// A list of the last [DebugVehicleTravelledPathSize] position points for the
/// vehicle.
///
/// Copied from [DebugVehicleTravelledPathList].
@ProviderFor(DebugVehicleTravelledPathList)
final debugVehicleTravelledPathListProvider = AutoDisposeNotifierProvider<
    DebugVehicleTravelledPathList, List<LatLng>>.internal(
  DebugVehicleTravelledPathList.new,
  name: r'debugVehicleTravelledPathListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTravelledPathListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTravelledPathList = AutoDisposeNotifier<List<LatLng>>;
String _$debugVehicleHitchesHash() =>
    r'293313a9a159879d25fe0542230531ffecd74196';

/// Whether to show vehicle hitches debug.
///
/// Copied from [DebugVehicleHitches].
@ProviderFor(DebugVehicleHitches)
final debugVehicleHitchesProvider =
    AutoDisposeNotifierProvider<DebugVehicleHitches, bool>.internal(
  DebugVehicleHitches.new,
  name: r'debugVehicleHitchesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleHitchesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleHitches = AutoDisposeNotifier<bool>;
String _$debugVehicleAntennaPositionHash() =>
    r'1f59d840f6a00a2874bf3264454da1fa4250e709';

/// Whether to show vehicle antenna position debug.
///
/// Copied from [DebugVehicleAntennaPosition].
@ProviderFor(DebugVehicleAntennaPosition)
final debugVehicleAntennaPositionProvider =
    AutoDisposeNotifierProvider<DebugVehicleAntennaPosition, bool>.internal(
  DebugVehicleAntennaPosition.new,
  name: r'debugVehicleAntennaPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleAntennaPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleAntennaPosition = AutoDisposeNotifier<bool>;
String _$debugVehicleTrajectorySecondsHash() =>
    r'499ca284d123e27d1e80bd21582c136c7c6f04bc';

/// The amount of seconds vehicle trajectories should predict.
///
/// Copied from [DebugVehicleTrajectorySeconds].
@ProviderFor(DebugVehicleTrajectorySeconds)
final debugVehicleTrajectorySecondsProvider =
    NotifierProvider<DebugVehicleTrajectorySeconds, double>.internal(
  DebugVehicleTrajectorySeconds.new,
  name: r'debugVehicleTrajectorySecondsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTrajectorySecondsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTrajectorySeconds = Notifier<double>;
String _$debugVehicleTrajectoryMinLengthHash() =>
    r'79f75755809547a3a397aac505582704ee65f5e3';

/// The minimum length vehicle trajectories should predict.
///
/// Copied from [DebugVehicleTrajectoryMinLength].
@ProviderFor(DebugVehicleTrajectoryMinLength)
final debugVehicleTrajectoryMinLengthProvider =
    NotifierProvider<DebugVehicleTrajectoryMinLength, double>.internal(
  DebugVehicleTrajectoryMinLength.new,
  name: r'debugVehicleTrajectoryMinLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleTrajectoryMinLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleTrajectoryMinLength = Notifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
