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
import 'package:equatable/equatable.dart';

/// A configuration class for setting parameters of an [ABTracking] object.
class ABConfig extends Equatable {
  /// A configuration class for setting parameters of an [ABTracking] object.
  const ABConfig({
    required this.turningRadius,
    required this.turnOffsetMinSkips,
    required this.snapToClosestLine,
    required this.offsetOppositeTurn,
    required this.limitMode,
  });

  /// How many offsets we should skip to the next line.
  final int turnOffsetMinSkips;

  /// The minimum turning radius of any turn between lines.
  final double turningRadius;

  /// Whether the offset should auto snap to the closest line/curve.
  final bool snapToClosestLine;

  /// Turn the other direction at the end of the line/curve.
  final bool offsetOppositeTurn;

  /// Which limit mode should apply for the end of the lines/curves.
  final ABLimitMode limitMode;

  @override
  List<Object?> get props => [
        turningRadius,
        turnOffsetMinSkips,
        snapToClosestLine,
        offsetOppositeTurn,
        limitMode,
      ];
}
