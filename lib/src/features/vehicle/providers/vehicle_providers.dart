import 'dart:async';
import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'vehicle_providers.g.dart';

/// The main provider for the vehicle state.
@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() => ref.read(lastUsedVehicleProvider).requireValue
    ..position = ref.read(homePositionProvider).gbPosition;

  /// Update the [state] to [vehicle].
  void update(Vehicle vehicle) =>
      Future(() => state = vehicle..lastUsed = DateTime.now());

  /// Update the [state] with only the position, velocity, bearing and
  /// steering input angle from [vehicle].
  void updateStateOnly(Vehicle vehicle) => Future(() {
        state = state.copyWith(
          velocity: vehicle.velocity,
          bearing: vehicle.bearing,
          steeringAngleInput: vehicle.steeringAngleInput,
          position: vehicle.position,
        )..lastUsed = DateTime.now();
      });

  /// Update the [state] to a new [vehicle] configuration, but keep the
  /// position and bearing.
  void updateConfig(Vehicle vehicle) => Future(
        () => state = vehicle.copyWith(
          position: state.position,
          bearing: state.bearing,
        )..lastUsed = DateTime.now(),
      );

  /// Reset the [state] to the initial value by recreating the [state].
  void reset() => ref.invalidateSelf();
}

/// A provider for whether the vehicle should steer automatically.
@Riverpod(keepAlive: true)
class AutoSteerEnabled extends _$AutoSteerEnabled {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref.read(simInputProvider.notifier).send((autoSteerEnabled: next));
      }
    });

    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether the vehicle's bearing is set by the IMU input.
@Riverpod(keepAlive: true)
class UseIMUBearing extends _$UseIMUBearing {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != next) {
        ref.read(simInputProvider.notifier).send((useIMUBearing: next));
      }
    });

    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for saving [vehicle] to a file in the user file directory.
@riverpod
FutureOr<void> saveVehicle(
  SaveVehicleRef ref,
  Vehicle vehicle,
) async {
  final name = vehicle.name ?? vehicle.uuid;

  final file = File(
    '''${ref.watch(fileDirectoryProvider).requireValue.path}/vehicles/$name.json''',
  );

  await file.create(recursive: true);

  await file
      .writeAsString(const JsonEncoder.withIndent('    ').convert(vehicle));
}

/// A provider for reading and holding all the saved vehicles in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<Vehicle>> savedVehicles(SavedVehiclesRef ref) async {
  final dir = Directory(
    [ref.watch(fileDirectoryProvider).requireValue.path, '/vehicles'].join(),
  );

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch(recursive: true).listen((event) {
    ref.invalidateSelf();
  });

  final vehicles = <Vehicle>[];

  if (dir.existsSync()) {
    final fileEntities = dir.listSync(recursive: true);

    if (fileEntities.isNotEmpty) {
      for (final fileEntity in fileEntities) {
        final file = File.fromUri(fileEntity.uri);

        final json = jsonDecode(await file.readAsString());

        if (json is Map) {
          vehicles.add(Vehicle.fromJson(Map<String, dynamic>.from(json)));
        }
      }
    }
  }

  return vehicles;
}

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
@riverpod
FutureOr<Vehicle?> loadVehicleFromFile(
  LoadVehicleFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    final json = jsonDecode(await file.readAsString());
    if (json is Map) {
      final vehicle = Vehicle.fromJson(Map<String, dynamic>.from(json));

      return vehicle;
    }
  }
  return null;
}

/// A provider for the most recently used [Vehicle].
///
/// The vehicle is found by sorting the saved vehicles by their last used
/// property.
@Riverpod(keepAlive: true)
AsyncValue<Vehicle> lastUsedVehicle(LastUsedVehicleRef ref) =>
    ref.watch(savedVehiclesProvider).when(
          data: (data) {
            if (data.isNotEmpty) {
              final sorted = data
                ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

              return AsyncData(sorted.first);
            }
            return AsyncData(PreconfiguredVehicles.tractor);
          },
          error: AsyncError.new,
          loading: AsyncLoading.new,
        );
