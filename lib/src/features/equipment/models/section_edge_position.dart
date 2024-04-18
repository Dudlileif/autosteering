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

part of 'section.dart';

/// A class with positions for the left and right edge of a [Section].
class SectionEdgePositions {
  /// A class with positions for the left and right edge of a [Section].
  const SectionEdgePositions({required this.left, required this.right});

  /// Creates a [SectionEdgePositions] object from the [json] object.
  factory SectionEdgePositions.fromJson(Map<String, dynamic> json) =>
      SectionEdgePositions(
        left: Geographic.parse(json['left'] as String),
        right: Geographic.parse(json['right'] as String),
      );

  /// The left edge position of the parent section.
  final Geographic left;

  /// The right edge of the parent section.
  final Geographic right;

  /// Converts the objet to a json compatible structure.
  Map<String, dynamic> toJson() => {
        'left': left.toText(),
        'right': right.toText(),
      };
}
