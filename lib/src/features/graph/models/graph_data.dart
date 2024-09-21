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

/// An enumerator for the different types of data graph data.
enum GraphParameter {
  /// Perpendicular distance to guidance line.
  perpendicularDistance('Perpendicular distance'),

  /// Bearing from the IMU.
  imuBearing('IMU Bearing'),

  /// Pitch from the IMU.
  imuPitch('IMU Pitch'),

  /// Roll from the IMU.
  imuRoll('IMU Roll'),

  /// Longitudinal correction of position from IMU pitch.
  imuLongitudinalCorrection('IMU longitudinal correction'),

  /// Lateral correction of position from IMU roll.
  imuLateralCorrection('IMU lateral correction'),

  /// IMU acceleration along X axis.
  imuAccelerationX('IMU acceleration X'),

  /// IMU acceleration along Y axis.
  imuAccelerationY('IMU acceleration Y'),

  /// IMU acceleration along Z axis.
  imuAccelerationZ('IMU acceleration Z'),

  /// WAS raw value reading.
  steeringWas('WAS reading'),

  /// WAS target value for autosteering.
  steeringWasTarget('WAS target'),

  /// Vehicle steering angle.
  steeringAngle('Steering angle'),

  /// Vehicle steering angle target for autosteering.
  steeringAngleTarget('Steering angle target');

  const GraphParameter(this.name);

  /// The UI friendly name of this.
  final String name;
}

/// A class for setting normalization limit for a [GraphParameter].
class GraphData {
  /// A class for setting normalization limit for a [GraphParameter].
  ///
  /// [min] is the minimum normalization limit.
  /// [max] is the maximum normalization limit.
  /// [parameter] is which parameter these limis should apply to.
  const GraphData({
    required this.min,
    required this.max,
    required this.parameter,
  });

  /// The minimum possible value for [parameter].
  final num min;

  /// The maximum possible value for [parameter].
  final num max;

  /// Which parameter this is used for.
  final GraphParameter parameter;

  /// Normalizes [value] to the range [0-1].
  double? valueNormalized(num? value) => switch (value) {
        null => null,
        _ => () {
            final range = max - min;
            if (range <= 0) {
              return null;
            }
            return (value.clamp(min, max) - min) / range;
          }.call()
      };
}
