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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'threshold_velocities.freezed.dart';
part 'threshold_velocities.g.dart';

/// A configuration for autosteering velocity thresholds of a vehicle.
@freezed
sealed class ThresholdVelocities with _$ThresholdVelocities {
  /// A configuration for autosteering velocity thresholds of a vehicle.
  const factory ThresholdVelocities({
    /// Minimum velocity with autosteering enabled in m/s.
    @Default(0.05) double minVelocity,

    /// Max forward velocity with autosteering enabled in m/s.
    @Default(5) double maxVelocity,

    /// Max reversing velocity with autosteering enabled in m/s.
    @Default(0) double maxReversingVelocity,

    /// Angular velocity in deg/s.
    @Default(30) double maxAngularVelocity,
  }) = _ThresholdVelocities;

  /// Creates a [ThresholdVelocities] from the [json] object.
  factory ThresholdVelocities.fromJson(Map<String, Object?> json) =>
      _$ThresholdVelocitiesFromJson(json);
}
