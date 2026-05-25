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

/// An enumerator for which unit we want to use when displaying velocity in the
/// app.
enum UnitVelocity {
  /// 1 meter per second is the base unit for velocity.
  metersPerSecond(1, 'mps'),

  /// 1 kilometer per hour is equal to ~ 0.277777777778 meters per second.
  kilometersPerHour(0.277777777778, 'kph'),

  /// 1 mile per hour is equal to 0.44704 meters per second.
  milesPerHour(0.44704, 'mph'),
  ;

  const UnitVelocity(this.inMetersPerSecond, this.symbol);

  /// Find enum value by [symbol], defaults to [kilometersPerHour] if no match
  /// is found.
  static UnitVelocity fromSymbol(String? symbol) => values.firstWhere(
    (unit) => unit.symbol == symbol,
    orElse: () => .kilometersPerHour,
  );

  /// The scale of this unit in square meters.
  final double inMetersPerSecond;

  /// The unit symbol.
  final String symbol;

  /// Convert [value] to this unit from [sourceUnit], defaults to
  /// [metersPerSecond].
  double fromUnit(double value, {UnitVelocity sourceUnit = .metersPerSecond}) =>
      value * sourceUnit.inMetersPerSecond / inMetersPerSecond;
}
