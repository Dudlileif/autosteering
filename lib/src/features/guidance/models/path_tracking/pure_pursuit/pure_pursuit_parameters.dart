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

part 'pure_pursuit_parameters.freezed.dart';
part 'pure_pursuit_parameters.g.dart';

/// A class for encompassing the coefficients for [PurePursuitPathTracking].
///
/// [lookAheadMinDistance] is hthe minimum for the look ahead distance.
///
/// [lookAheadSeconds] is how many seconds the vehicle's velocity should be
/// multiplied with to get the look ahead distance. If the distance is shorter
/// than [lookAheadMinDistance], it will be set to that.
@freezed
class PurePursuitParameters with _$PurePursuitParameters {
  /// A class for encompassing the coefficients for [PurePursuitPathTracking].
  ///
  /// [lookAheadMinDistance] is the minimum value for the look ahead distance,
  /// having this set increases the stability at low speeds.
  ///
  /// [lookAheadSeconds] is how many seconds ahead we should multiply the
  /// vehicle's velocity with to get the look ahead distance.
  /// If the distance is shorter that [lookAheadMinDistance] it will be
  /// increased to that.
  const factory PurePursuitParameters({
    /// The minimum value for the look ahead distance,
    /// having this set increases the stability at low speeds.
    @Default(0.75) double lookAheadMinDistance,

    /// How many seconds ahead we should multiply the
    /// vehicle's velocity with to get the look ahead distance.
    /// If the distance is shorter that [lookAheadMinDistance] it will be
    /// set to that.
    @Default(1) double lookAheadSeconds,
  }) = _PurePursuitParameters;

  /// Creates a [PurePursuitParameters] from the [json] object.
  factory PurePursuitParameters.fromJson(Map<String, Object?> json) =>
      _$PurePursuitParametersFromJson(json);
}
