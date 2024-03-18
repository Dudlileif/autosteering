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

import 'package:autosteering/src/features/vehicle/models/pid_controller/pid_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pid_parameters.freezed.dart';
part 'pid_parameters.g.dart';

/// A class for encompassing the gain parameters for a [PidController].
@freezed
class PidParameters with _$PidParameters {
  /// A class for encompassing the gain parameters for a [PidController].
  ///
  /// [p] is the proportional gain.
  /// [i] is the integral gain.
  /// [d] is the derivative gain.
  const factory PidParameters({
    /// Proportional gain.
    @Default(20) double p,

    /// Integral gain.
    @Default(0.130) double i,

    /// Derivative gain.
    @Default(0.063) double d,
  }) = _PidParameters;

  /// Creates a [PidParameters] object from the [json] object.
  factory PidParameters.fromJson(Map<String, Object?> json) =>
      _$PidParametersFromJson(json);
}
