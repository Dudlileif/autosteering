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

/// An enumerator for which unit we want to use when displaying distance in the
/// app.
enum UnitDistance {
  /// The SI base unit for distance.
  meter(1, 'm'),

  /// 1 foot is equal to 0.3048 meters.
  foot(0.3048, 'ft'),

  /// 1 yard is equal to 0.9144 meters.
  yard(0.9144, 'yd')
  ;

  const UnitDistance(this.inMeters, this.symbol);

  /// Find enum value by [symbol], defaults to [meter] if no match is found.
  static UnitDistance fromSymbol(String? symbol) => values.firstWhere(
    (unit) => unit.symbol == symbol,
    orElse: () => .meter,
  );

  /// The scale of this unit in square meters.
  final double inMeters;

  /// The unit symbol.
  final String symbol;

  /// Convert [value] to this unit from [sourceUnit], defaults to
  /// [meter].
  double fromUnit(double value, {UnitDistance sourceUnit = .meter}) =>
      value * sourceUnit.inMeters / inMeters;
}
