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

import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_tracking_parameters.freezed.dart';
part 'path_tracking_parameters.g.dart';

/// A class for storing the various path tracking parameters for a vehicle.
@Freezed(fromJson: true, toJson: true)
sealed class PathTrackingParameters with _$PathTrackingParameters {
  const factory PathTrackingParameters({
    /// Which path tracking mode the vehicle should use.
    @Default(PathTrackingMode.purePursuit) PathTrackingMode mode,

    /// Parameters for the look ahead distance when using a pure pursuit/look
    /// ahead steering mode.
    @Default(PurePursuitParameters()) PurePursuitParameters purePursuit,

    /// The Stanley gain coefficients for controlling the steering of this
    /// vehicle when using a Stanley path tracking steering mode.
    @Default(StanleyParameters()) StanleyParameters stanley,
  }) = _PathTrackingParameters;

  /// Creates a [PathTrackingParameters] from the [json] object.
  factory PathTrackingParameters.fromJson(Map<String, Object?> json) =>
      _$PathTrackingParametersFromJson(json);
}
