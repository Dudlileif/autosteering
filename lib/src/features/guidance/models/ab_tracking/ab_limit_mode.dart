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

/// An enumerator for selecting what should happen when we approach
/// point A or B.
enum ABLimitMode {
  /// The line will continue forever in both directions. No turns will be
  /// placed at the A or B points of the line.
  unlimited,

  /// A turn will be placed at the A and B of the line so that the outermost
  /// part of the turn will be tangential to the line through the A points
  /// or the B points.
  limitedTurnWithin,

  /// A turn will be placed at the A and B points of the line so that the whole
  /// line will be straight and then a turn will be placed after the A or B
  /// points.
  limitedTurnOutside;

  /// A json compatible string for this enumerator.
  String toJson() => name;

  /// Returns the appropriate [ABLimitMode] for the given [json] string
  /// by looking for the corresponding [name].
  ABLimitMode fromJson(String json) =>
      values.firstWhere((element) => element.name == json);
}
