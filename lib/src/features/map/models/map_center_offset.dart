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

part 'map_center_offset.freezed.dart';
part 'map_center_offset.g.dart';

/// An offset mainly used to keep the map center moved relative to the vehicle.
@freezed
class MapCenterOffset with _$MapCenterOffset {
  /// An offset mainly used to keep the map center moved relative to the
  /// vehicle.
  ///
  /// [x] is the longitudinal offset in meters from the center point.
  /// [y] is the transverse offset in meters from the center point.

  const factory MapCenterOffset({
    /// Longitudinal offset in meters from the center point.
    @Default(0) double x,

    /// Transverse offset in meters from the center point.
    @Default(0) double y,
  }) = _MapCenterOffset;

  /// Creates a [MapCenterOffset] from a [json] object.
  factory MapCenterOffset.fromJson(Map<String, Object?> json) =>
      _$MapCenterOffsetFromJson(json);
}
