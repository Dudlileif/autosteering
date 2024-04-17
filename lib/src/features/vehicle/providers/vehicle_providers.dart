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

import 'dart:async';
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'vehicle_providers.g.dart';

/// The main provider for the vehicle state.
@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() {
    final vehicle = ref.read(lastUsedVehicleProvider).requireValue
      ..position = ref.read(homePositionProvider).gbPosition
      ..lastUsed = DateTime.now();

    ref.read(saveVehicleProvider(vehicle));

    return vehicle;
  }

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
          antennaPosition: vehicle.position,
        )..lastUsed = DateTime.now();
      });

  /// Update the [state] to a new [vehicle] configuration, but keep the
  /// position and bearing.
  void updateConfig(Vehicle vehicle) => Future(
        () => state = vehicle.copyWith(
          antennaPosition: state.position,
          bearing: state.bearing,
        )..lastUsed = DateTime.now(),
      );

  /// Reset the [state] to the initial value by recreating the [state].
  void reset() => ref.invalidateSelf();
}

/// A provider for the active [AutosteeringState] of the vehicle.
@Riverpod(keepAlive: true)
class ActiveAutosteeringState extends _$ActiveAutosteeringState {
  @override
  AutosteeringState build() => AutosteeringState.disabled;

  /// Updates [state] to [value].
  void update(AutosteeringState value) => Future(() => state = value);
}

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> saveVehicle(
  SaveVehicleRef ref,
  Vehicle vehicle, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: vehicle,
        fileName: overrideName ?? vehicle.name ?? vehicle.uuid,
        folder: 'vehicles',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportVehicle(
  ExportVehicleRef ref,
  Vehicle vehicle, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    ref.watch(
      exportJsonToFileDirectoryProvider(
        object: vehicle,
        fileName: overrideName ?? vehicle.name ?? vehicle.uuid,
        folder: 'vehicles',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<Vehicle>> savedVehicles(SavedVehiclesRef ref) async => await ref
    .watch(
      savedFilesProvider(
        fromJson: Vehicle.fromJson,
        folder: 'vehicles',
      ).future,
    )
    .then((data) => data.cast());

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deleteVehicle(
  DeleteVehicleRef ref,
  Vehicle vehicle, {
  String? overrideName,
}) async =>
    ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ?? vehicle.name ?? vehicle.uuid,
        folder: 'vehicles',
      ).future,
    );

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
@riverpod
FutureOr<Vehicle?> loadVehicleFromFile(
  LoadVehicleFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      final json = jsonDecode(await file.readAsString());
      return Vehicle.fromJson(Map<String, dynamic>.from(json as Map));
    } catch (error, stackTrace) {
      Logger.instance.w(
        'Failed to load vehicle from: $path.',
        error: error,
        stackTrace: stackTrace,
      );
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
    ref.watch(savedVehiclesProvider).whenData(
      (data) {
        if (data.isNotEmpty) {
          final sorted = data..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

          final vehicle = sorted.first;
          Logger.instance.i(
            'Last used vehicle found: ${vehicle.name} | uuid: ${vehicle.uuid}.',
          );

          return vehicle;
        }
        Logger.instance.i('Last used vehicle not found, creating new.');

        return PreconfiguredVehicles.tractor;
      },
    );

/// A provider for the number of previous positions to use for calculating
/// the gauge velocity and bearing values.
@Riverpod(keepAlive: true)
class GaugesAverageCount extends _$GaugesAverageCount {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.gaugesAverageCount, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.gaugesAverageCount) ??
        10;
  }

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the target steering angle when using guidance.
@riverpod
class VehicleSteeringAngleTarget extends _$VehicleSteeringAngleTarget {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for importing a vehicle configuration from a file and applying it
/// to the [ConfiguredVehicle] provider.
@riverpod
FutureOr<Vehicle?> importVehicle(
  ImportVehicleRef ref,
) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose vehicle file',
  );

  Vehicle? vehicle;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        vehicle = Vehicle.fromJson(Map<String, dynamic>.from(json as Map));
      } catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to vehicle.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import vehicle, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      vehicle = await ref.watch(loadVehicleFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import vehicle: $filePath.');
    }
  }
  if (vehicle != null) {
    Logger.instance.i('Imported vehicle: ${vehicle.name ?? vehicle.uuid}.');
    final position = ref.watch(
      mainVehicleProvider.select((value) => value.position),
    );
    final bearing = ref.watch(
      mainVehicleProvider.select((value) => value.bearing),
    );
    vehicle
      ..position = position
      ..bearing = bearing
      ..lastUsed = DateTime.now();

    ref.read(configuredVehicleProvider.notifier).update(vehicle);
    ref.invalidate(configuredVehicleNameTextControllerProvider);
    ref.read(simInputProvider.notifier).send(vehicle);
    await ref.watch(saveVehicleProvider(vehicle).future);
  }

  return vehicle;
}

/// A provider for whether widgets for overriding the steering should be shown.
@riverpod
class ShowOverrideSteering extends _$ShowOverrideSteering {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous && !next) {
        ref.invalidate(overrideSteeringProvider);
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the steering should be overridden. Usually used to test the
/// steering motor and WAS together.
@riverpod
class OverrideSteering extends _$OverrideSteering {
  Timer? _timer;
  @override
  bool build() {
    ref
      ..listenSelf((previous, next) {
        if (previous != null && !previous && next) {
          _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
            ref.read(simInputProvider.notifier).send(
              (steeringAngleOverride: ref.read(overrideSteeringAngleProvider)),
            );
          });
          Logger.instance.i('Steering override enabled.');
        } else if (previous != null && previous && !next && _timer != null) {
          _timer?.cancel();
          _timer = null;
          ref
              .read(simInputProvider.notifier)
              .send((steeringAngleOverride: null));
          Logger.instance.i('Steering override disabled.');
        }
      })
      ..onDispose(() {
        if (_timer != null) {
          _timer?.cancel();
          _timer = null;
          ref
              .read(simInputProvider.notifier)
              .send((steeringAngleOverride: null));
          Logger.instance.i('Steering override disabled.');
        }
      });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the steering angle to override with.
@riverpod
class OverrideSteeringAngle extends _$OverrideSteeringAngle {
  @override
  double build() {
    return ref.read(mainVehicleProvider.select((value) => value.steeringAngle));
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
