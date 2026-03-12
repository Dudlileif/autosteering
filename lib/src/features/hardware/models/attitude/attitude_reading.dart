// Copyright (C) 2026 Gaute Hagen
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

import 'package:autosteering/src/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attitude_reading.freezed.dart';
part 'attitude_reading.g.dart';

/// A class for storing attitude reading values.
@freezed
sealed class AttitudeReading with _$AttitudeReading {
  /// A class for storing attitude reading values.
  const factory AttitudeReading.gnss({
    /// The time of the reading being received.
    @DateTimeSerializer() required DateTime receiveTime,

    /// The yaw/heading value.
    @Default(null) double? yaw,

    /// The pitch value.
    @Default(null) double? pitch,

    /// The roll value
    @Default(null) double? roll,
  }) = GnssAttitudeReading;

  const factory AttitudeReading.imu({
    /// The time of the reading being received.
    @DateTimeSerializer() required DateTime receiveTime,

    /// The IMU input yaw/bearing from startup.
    @Default(0) double yaw,

    /// The IMU input pitch.
    @Default(0) double pitch,

    /// The IMU input roll.
    @Default(0) double roll,

    /// The IMU input acceleration in the X-axis (lateral).
    @Default(0) double accelerationX,

    /// The IMU input acceleration in the Y-axis (longitudinal).
    @Default(0) double accelerationY,

    /// The IMU input acceleration in the Z-axis (vertical).
    @Default(0) double accelerationZ,
  }) = ImuReading;

  /// Creates an [AttitudeReading] object from the [json] map.
  factory AttitudeReading.fromJson(Map<String, Object?> json) =>
      _$AttitudeReadingFromJson(json);
}
