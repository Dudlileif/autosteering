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

part 'imu_zero_values.freezed.dart';
part 'imu_zero_values.g.dart';

/// A class for the zero values for the IMU in a vehicle.
@freezed
class ImuZeroValues with _$ImuZeroValues {
  /// A class for the zero values for the IMU in a vehicle.
  ///
  /// [bearingZero] should be set when the vehicle is pointing towards north.
  ///
  /// [pitchZero] and [rollZero] should be set when the vehicle is on a
  /// perfectly flat surface. (concrete pad/garage/road etc...)
  const factory ImuZeroValues({
    /// The zero (North) value for the bearing.
    @Default(0) num bearingZero,

    /// The zero level for the pitch.
    @Default(0) num pitchZero,

    /// The zero level for the roll.
    @Default(0) num rollZero,
  }) = _ImuZeroValues;

  /// Creates
  factory ImuZeroValues.fromJson(Map<String, Object?> json) =>
      _$ImuZeroValuesFromJson(json);
}
