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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'motor_config.freezed.dart';
part 'motor_config.g.dart';

/// A configuration for a steering wheel motor of a vehicle.
@freezed
class MotorConfig with _$MotorConfig {
  /// A configuration for a steering wheel motor of a vehicle.
  ///
  /// [invertOutput] will invert the motor rotation direction if enabled.
  /// [maxRPM] is the maximum rotation speed of the motor.
  /// [thresholdVelocity] is the minimum velocity in m/s of the vehicle to allow
  /// autosteering.
  const factory MotorConfig({
    @Default(false) bool invertOutput,
    @Default(200) int maxRPM,
    @Default(0.05) double thresholdVelocity,
  }) = _MotorConfig;

  /// Creates a [MotorConfig] object from the [json] object.
  factory MotorConfig.fromJson(Map<String, Object?> json) =>
      _$MotorConfigFromJson(json);
}
