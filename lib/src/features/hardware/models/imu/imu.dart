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

import 'dart:ui';

import 'package:autosteering/src/features/hardware/models/imu/imu_config.dart';
import 'package:autosteering/src/features/hardware/models/imu/imu_reading.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

export 'imu_config.dart';
export 'imu_reading.dart';
export 'imu_zero_values.dart';

/// An object representing an IMU (Intertial measurement unit) in a vehicle.
///
/// It contains an [ImuConfig] for configuring the usage of it and the latest
/// [ImuReading] from the hardware sensor.
class Imu {
  /// An object representing an IMU (Intertial measurement unit) in a vehicle.
  ///
  /// [config] describes how to use the [reading] from the sensor.
  Imu({
    ImuConfig? config,
    List<ImuReading>? readings,
  })  : config = config ?? const ImuConfig(),
        readings = readings ?? [ImuReading(receiveTime: DateTime.now())];

  /// The configuration for the IMU sensor.
  ImuConfig config;

  /// The latest readings from the hardware sensor.
  List<ImuReading> readings;

  /// Whether the bearing is set for the IMU.
  /// Should be set to true after a GNSS bearing is used to update the
  /// [config.zeroValues.bearingZero].
  bool bearingIsSet = false;

  /// The last time a GNSS reading was received.
  DateTime? lastGnssTime;

  /// The latest reading from the hardware sensor, accounted for the
  /// [ImuConfig.delayReadings] to match the GNSS fix time.
  ///
  /// Attempts to find the latest reading that arrived more than
  /// [ImuConfig.delayReadings] milliseconds ago, otherwise the latest reading
  /// is returned.
  ImuReading get reading {
    final now = switch (config.useOnlyGnssSyncedReadings) {
      true => lastGnssTime ?? DateTime.now(),
      false => DateTime.now()
    };
    return readings.firstWhereOrNull(
          (element) =>
              now.difference(element.receiveTime).inMilliseconds >
              config.delayReadings,
        ) ??
        readings.firstOrNull ??
        ImuReading(receiveTime: now);
  }

  /// The bearing reading accounted for [config.zeroValues.bearingZero].
  double? get bearing => switch (bearingIsSet) {
        true => ((reading.yaw - config.zeroValues.bearingZero) *
                switch (config.invertYaw) {
                  true => -1.0,
                  false => 1.0,
                })
            .wrap360(),
        false => null
      };

  /// The pitch reading accounted for [config.zeroValues.pitchZero].
  double get pitch =>
      switch (config.swapPitchAndRoll) {
        false => clampDouble(
            (reading.pitch - config.zeroValues.pitchZero).toDouble(),
            -85,
            85,
          ),
        true => clampDouble(
            (reading.roll - config.zeroValues.rollZero).toDouble(),
            -85,
            85,
          )
      } *
      switch (config.invertPitch) {
        true => -1,
        false => 1,
      };

  /// The roll reading accounted for [config.zeroValues.rollZero].
  double get roll =>
      switch (config.swapPitchAndRoll) {
        false => clampDouble(
            (reading.roll - config.zeroValues.rollZero).toDouble(),
            -85,
            85,
          ),
        true => clampDouble(
            (reading.pitch - config.zeroValues.pitchZero).toDouble(),
            -85,
            85,
          )
      } *
      switch (config.invertRoll) {
        true => -1,
        false => 1,
      };

  /// Adds the [newReading] to [readings] and removes old readings past the
  /// length of 10.
  void addReading(ImuReading newReading) {
    readings.insert(0, newReading);
    while (readings.length > 10) {
      readings.removeLast();
    }
  }

  /// Sets the [config] zero values for pitch and roll to the current to
  /// [pitchZero] and [rollZero] if given.
  void setPitchAndRollZeroTo({num? pitchZero, num? rollZero}) =>
      config = config.copyWith(
        zeroValues: config.zeroValues.copyWith(
          pitchZero: pitchZero ?? config.zeroValues.pitchZero,
          rollZero: rollZero ?? config.zeroValues.rollZero,
        ),
      );

  /// Sets the [config] zero value for bearing to [bearingZero].
  void setBearingZeroTo(num bearingZero) => config = config.copyWith(
        zeroValues: config.zeroValues.copyWith(bearingZero: bearingZero),
      );

  /// Sets the [config] zero values for pitch and roll to the current [reading]
  /// values.
  void setPitchAndRollZeroToCurrentReading() =>
      setPitchAndRollZeroTo(pitchZero: reading.pitch, rollZero: reading.roll);

  /// Sets the [config] zero value for bearing the current [reading] yaw value.
  void setBearingZeroToCurrentReading() => setBearingZeroTo(reading.yaw);
}
