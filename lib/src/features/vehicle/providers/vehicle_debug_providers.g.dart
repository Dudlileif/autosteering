// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debugVehiclePolygonsHash() =>
    r'5cc07678616b6616a45ef6e130642b8e912acac5';

/// Whether to show vehicle debug polygons.
///
/// Copied from [DebugVehiclePolygons].
@ProviderFor(DebugVehiclePolygons)
final debugVehiclePolygonsProvider =
    NotifierProvider<DebugVehiclePolygons, bool>.internal(
  DebugVehiclePolygons.new,
  name: r'debugVehiclePolygonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehiclePolygonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehiclePolygons = Notifier<bool>;
String _$debugSteeringHash() => r'c5ada2ad5ee082dc18321fb8ebfa78e9ad9c2a71';

/// Whether to show vehicle steering debug features.
///
/// Copied from [DebugSteering].
@ProviderFor(DebugSteering)
final debugSteeringProvider = NotifierProvider<DebugSteering, bool>.internal(
  DebugSteering.new,
  name: r'debugSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugSteering = Notifier<bool>;
String _$debugTrajectoryHash() => r'6c7e2444394bba5a8e3186695f547453f4ad614c';

/// Whether to show vehicle trajectory debug features.
///
/// Copied from [DebugTrajectory].
@ProviderFor(DebugTrajectory)
final debugTrajectoryProvider =
    NotifierProvider<DebugTrajectory, bool>.internal(
  DebugTrajectory.new,
  name: r'debugTrajectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugTrajectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugTrajectory = Notifier<bool>;
String _$debugTravelledPathHash() =>
    r'bb96ce559ab9a9ece21a9649a620cdc0f029afb7';

/// Whether to show vehicle travelled path debug.
///
/// Copied from [DebugTravelledPath].
@ProviderFor(DebugTravelledPath)
final debugTravelledPathProvider =
    NotifierProvider<DebugTravelledPath, bool>.internal(
  DebugTravelledPath.new,
  name: r'debugTravelledPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugTravelledPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugTravelledPath = Notifier<bool>;
String _$debugTravelledPathSizeHash() =>
    r'd3ad16cdc8e478f038dde44511c1442a27dcf02f';

/// The amount of points [DebugTravelledPathList] should hold.
///
/// Copied from [DebugTravelledPathSize].
@ProviderFor(DebugTravelledPathSize)
final debugTravelledPathSizeProvider =
    NotifierProvider<DebugTravelledPathSize, int>.internal(
  DebugTravelledPathSize.new,
  name: r'debugTravelledPathSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugTravelledPathSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugTravelledPathSize = Notifier<int>;
String _$debugTravelledPathListHash() =>
    r'b6e423e4ff98f9347d6d0f2abee98e0792953660';

/// A list of the last [DebugTravelledPathSize] position points for the vehicle.
///
/// Copied from [DebugTravelledPathList].
@ProviderFor(DebugTravelledPathList)
final debugTravelledPathListProvider =
    AutoDisposeNotifierProvider<DebugTravelledPathList, List<LatLng>>.internal(
  DebugTravelledPathList.new,
  name: r'debugTravelledPathListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugTravelledPathListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugTravelledPathList = AutoDisposeNotifier<List<LatLng>>;
String _$debugVehicleHitchesHash() =>
    r'3750b049d3c928c7fb92c45455ee680c7f8b7a94';

/// Whether to show vehicle hitches debug.
///
/// Copied from [DebugVehicleHitches].
@ProviderFor(DebugVehicleHitches)
final debugVehicleHitchesProvider =
    NotifierProvider<DebugVehicleHitches, bool>.internal(
  DebugVehicleHitches.new,
  name: r'debugVehicleHitchesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleHitchesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleHitches = Notifier<bool>;
String _$debugVehicleAntennaPositionHash() =>
    r'01e2df818d2995610c08b0a90b5030a616fbe179';

/// Whether to show vehicle antenna position debug.
///
/// Copied from [DebugVehicleAntennaPosition].
@ProviderFor(DebugVehicleAntennaPosition)
final debugVehicleAntennaPositionProvider =
    NotifierProvider<DebugVehicleAntennaPosition, bool>.internal(
  DebugVehicleAntennaPosition.new,
  name: r'debugVehicleAntennaPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleAntennaPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleAntennaPosition = Notifier<bool>;
String _$debugVehicleIMUHash() => r'e95486e3ec7bd909ebdf31deffdf10729e077fa3';

/// Whether to show vehicle IMU.
///
/// Copied from [DebugVehicleIMU].
@ProviderFor(DebugVehicleIMU)
final debugVehicleIMUProvider =
    NotifierProvider<DebugVehicleIMU, bool>.internal(
  DebugVehicleIMU.new,
  name: r'debugVehicleIMUProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleIMUHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleIMU = Notifier<bool>;
String _$debugVehicleWASHash() => r'7d402a5f483f9a4089cccf9cfd3fd1baa3a3a8a1';

/// Whether to show vehicle WAS.
///
/// Copied from [DebugVehicleWAS].
@ProviderFor(DebugVehicleWAS)
final debugVehicleWASProvider =
    NotifierProvider<DebugVehicleWAS, bool>.internal(
  DebugVehicleWAS.new,
  name: r'debugVehicleWASProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleWASHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleWAS = Notifier<bool>;
String _$debugVehicleAutosteerParametersHash() =>
    r'9a7ced139e78bfa75cf5d975973420c15a9748a7';

/// Whether to show vehicle autosteer parameters debug.
///
/// Copied from [DebugVehicleAutosteerParameters].
@ProviderFor(DebugVehicleAutosteerParameters)
final debugVehicleAutosteerParametersProvider =
    NotifierProvider<DebugVehicleAutosteerParameters, bool>.internal(
  DebugVehicleAutosteerParameters.new,
  name: r'debugVehicleAutosteerParametersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugVehicleAutosteerParametersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugVehicleAutosteerParameters = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
