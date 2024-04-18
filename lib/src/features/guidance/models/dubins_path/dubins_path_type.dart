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

part of 'dubins_path.dart';

/// An enumerator class for distinguishing between the different sections of
/// a Dubins path.
enum DubinsSection {
  /// Left turn
  l,

  /// Straight
  s,

  /// Right turn
  r;
}

/// An enumerator class for distinguishing between the different types of
/// Dubins paths.
enum DubinsPathType {
  /// Right - Straight - Right
  rsr(
    DubinsSection.r,
    DubinsSection.s,
    DubinsSection.r,
  ),

  /// Right - Straight - Left
  rsl(
    DubinsSection.r,
    DubinsSection.s,
    DubinsSection.l,
  ),

  /// Right - Left - Right
  rlr(
    DubinsSection.r,
    DubinsSection.l,
    DubinsSection.r,
  ),

  /// Left - Straight - Right
  lsr(
    DubinsSection.l,
    DubinsSection.s,
    DubinsSection.r,
  ),

  /// Left - Straight - Left
  lsl(
    DubinsSection.l,
    DubinsSection.s,
    DubinsSection.l,
  ),

  /// Left - Right - Left
  lrl(
    DubinsSection.l,
    DubinsSection.r,
    DubinsSection.l,
  );

  const DubinsPathType(this.start, this.mid, this.end);

  /// The first section of the path.
  final DubinsSection start;

  /// The middle section of the path.
  final DubinsSection mid;

  /// The final section of the path.
  final DubinsSection end;

  /// A list of the path sections.
  List<DubinsSection> get sections => [start, mid, end];

  /// A list of the path types that have a straight tangent from the start
  /// to the end circle.
  static List<DubinsPathType> get withStraight => [lsl, lsr, rsl, rsr];

  /// A list of the path types that have a third, middle circle connecting the
  /// start and end circles.
  static List<DubinsPathType> get onlyCircles => [lrl, rlr];
}
