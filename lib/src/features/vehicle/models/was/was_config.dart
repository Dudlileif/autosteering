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

part 'was_config.freezed.dart';
part 'was_config.g.dart';

/// A configuration for the Wheel Angle Sensor of a vehicle.
@freezed
class WasConfig with _$WasConfig {
  /// A configuration for the Wheel Angle Sensor of a vehicle.
  const factory WasConfig({
    @Default(true) bool useWas,
    @Default(false) bool invertInput,
    @Default(12) int bits,
    @Default(100) int min,
    @Default(4000) int max,
    @Default(1500) int center,
  }) = _WasConfig;

  /// Creates a [WasConfig] from the [json] object.
  factory WasConfig.fromJson(Map<String, Object?> json) =>
      _$WasConfigFromJson(json);
}
