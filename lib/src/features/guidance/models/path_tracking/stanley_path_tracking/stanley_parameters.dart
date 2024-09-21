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

import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stanley_parameters.freezed.dart';
part 'stanley_parameters.g.dart';

/// A class for encompassing the gains for [StanleyPathTracking].

@freezed
class StanleyParameters with _$StanleyParameters {
  /// A class for encompassing the gains for [StanleyPathTracking].
  ///
  /// [crossDistanceGain] is the cross distance gain gain.
  ///
  /// [softeningGain] is the softening gain for low speeds, it
  /// helps keeping numerical stability when the velocity is close to zero.
  ///
  /// [velocityGain] is the gain for how much the velocity
  /// should reduce cross distance part of the equation.
  const factory StanleyParameters({
    /// Proportional cross distance gain coefficient.
    @Default(1.5) double crossDistanceGain,

    /// Coefficient to ensure numerical stability when velocity is close to
    /// zero.
    @Default(1e-5) double softeningGain,

    /// Proportional coefficient for how much the velocity should alter the
    /// steering angle.
    @Default(1.3) double velocityGain,
  }) = _StanleyParameters;

  /// Creates a [StanleyParameters] from the [json] object.
  factory StanleyParameters.fromJson(Map<String, Object?> json) =>
      _$StanleyParametersFromJson(json);
}
