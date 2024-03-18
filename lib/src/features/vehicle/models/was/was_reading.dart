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

import 'package:autosteering/src/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'was_reading.freezed.dart';
part 'was_reading.g.dart';

/// A class for storing WAS input values.
@freezed
class WasReading with _$WasReading {
  /// A class for storing WAS input values.

  const factory WasReading({
    /// The time of the reading being received.
    @DateTimeSerializer() required DateTime receiveTime,

    /// The discrete value of the sensor reading.
    @Default(0) int value,
  }) = _WasReading;

  /// Creates a [WasReading] object from the [json] map.
  factory WasReading.fromJson(Map<String, Object?> json) =>
      _$WasReadingFromJson(json);
}
