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

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gauge_providers.g.dart';

/// A provider for the distance travelled by the vehicle.
@riverpod
class GaugeTravelledDistance extends _$GaugeTravelledDistance {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void updateWith(double value) => Future(() => state += value);
}

/// A provider for the vehicle's velocity gauge.
@riverpod
class GaugeVelocity extends _$GaugeVelocity {
  @override
  double build() => 0;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the vehicle's bearing gauge.
@riverpod
class GaugeBearing extends _$GaugeBearing {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void update(double value) => Future(
        () => state = value,
      );
}
