import 'dart:async';
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
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
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
AsyncValue<void> saveVehicle(
  SaveVehicleRef ref,
  Vehicle vehicle, {
  String? overrideName,
  bool downloadIfWeb = false,
}) =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: vehicle,
        fileName: overrideName ?? vehicle.name ?? vehicle.uuid,
        folder: 'vehicles',
        downloadIfWeb: downloadIfWeb,
      ),
    );

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.
@Riverpod(keepAlive: true)
AsyncValue<List<Vehicle>> savedVehicles(SavedVehiclesRef ref) => ref
    .watch(
      savedFilesProvider(
        fromJson: Vehicle.fromJson,
        folder: 'vehicles',
      ),
    )
    .whenData((data) => data.cast());

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

/// A provider for the frequency of the IMU updates.
@riverpod
class ImuCurrentFrequency extends _$ImuCurrentFrequency {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the current raw [ImuReading] from the hardware.
@riverpod
class ImuCurrentReading extends _$ImuCurrentReading {
  Timer? _resetTimer;

  @override
  ImuReading? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(ImuReading? value) => Future(() => state = value);
}

/// A provider for the frequency of the WAS updates.
@riverpod
class WasCurrentFrequency extends _$WasCurrentFrequency {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the current raw [WasReading] from the hardware.
@riverpod
class WasCurrentReading extends _$WasCurrentReading {
  Timer? _resetTimer;

  @override
  WasReading? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(WasReading? value) => Future(() => state = value);
}

/// A provider for the target steering angle when using guidance.
@riverpod
class VehicleSteeringAngleTarget extends _$VehicleSteeringAngleTarget {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}
