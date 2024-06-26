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

import 'package:autosteering/src/features/gamepad/gamepad.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamepad_config.freezed.dart';
part 'gamepad_config.g.dart';

/// A configuration class for gamepad inputs.
///
/// Deadzones and max discrete analog value can be configured.
@freezed
class GamepadConfig with _$GamepadConfig {
  const factory GamepadConfig({
    /// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
    @Default(65535) int analogMaxValue,

    /// The maximum values that increases input. Values in distance from 0.
    /// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
    @Default({}) Map<GamepadAnalogInput, double> analogDeadZoneMax,

    /// The minimum values that are required before input
    /// is registered. Values in distance from 0.
    /// Typically 0.1-0.2 can prevent jitter/drift.
    @Default({}) Map<GamepadAnalogInput, double> analogDeadZoneMin,
  }) = _GamepadConfig;
  const GamepadConfig._();

  factory GamepadConfig.fromJson(Map<String, Object?> json) =>
      _$GamepadConfigFromJson(json);

  /// The center value of the analog inputs.
  /// Useful for self centering joysticks.
  int get analogCenter => analogMaxValue ~/ 2;

  /// The deadzone value for the high end of the [input].
  /// Defaults to 1 (no deadzone).
  double deadZoneMax(GamepadAnalogInput? input) =>
      analogDeadZoneMax[input] ?? 1;

  /// The deadzone value for the low end of the [input].
  /// Defaults to 0 (no deadzone).
  double deadZoneMin(GamepadAnalogInput? input) =>
      analogDeadZoneMin[input] ?? 0;
}
