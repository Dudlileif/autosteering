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

import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_recording_settings.freezed.dart';
part 'path_recording_settings.g.dart';

/// A configuration class for how paths should be recorded.
@freezed
class PathRecordingSettings with _$PathRecordingSettings {
  /// A configuration class for how paths should be recorded.
  ///
  /// [minDistance] and [maxDistance] is the minimum and maximum distance
  /// between points in meters.
  ///
  /// [maxBearingDifference] is the maximum difference between the previous
  /// [WayPoint.bearing] and the vehicle's current bearing.
  ///
  /// [lateralOffset] is the offset distance in meters in the bearing+90°
  /// direction from the vehicle's position.
  ///
  /// [longitudinalOffset] is the offset distance in meters in the bearing
  /// direction from the vehicle's position.
  const factory PathRecordingSettings({
    /// Minimum distance between points in meters.
    @Default(1) double minDistance,

    /// Maximum distance between points in meters.
    @Default(20) double maxDistance,

    /// Maximum difference between the previous [WayPoint.bearing] and the
    /// vehicle's current bearing.
    @Default(1) double maxBearingDifference,

    /// Offset distance in meters in the bearing+90° direction from the
    /// vehicle's position.
    @Default(0) double lateralOffset,

    /// Offset distance in meters in the bearing direction from the
    /// vehicle's position.
    @Default(0) double longitudinalOffset,
  }) = _PathRecordingSettings;

  /// Creates a [PathRecordingSettings] from the [json] object.
  factory PathRecordingSettings.fromJson(Map<String, Object?> json) =>
      _$PathRecordingSettingsFromJson(json);
}

/// An enumerator for specifying the target of the path recording.
enum PathRecordingTarget {
  /// Path recording for an [ABCurve].
  abCurve,

  /// Path recording for a [Field] boundary.
  field,

  /// Path recording for a [PathTracking].
  pathTracking;
}
