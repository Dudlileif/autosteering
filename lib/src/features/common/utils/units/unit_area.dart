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

/// An enumerator for which unit we want to use when displaying area in the app.
enum UnitArea {
  /// The SI base unit for area.
  squareMeter(1, 'm²'),

  /// 1 acre is equal to 4046.8564224 square meters.
  acre(4046.8564224, 'ac'),

  /// 1 hectare is equal to 10000 square meters.
  hectare(10000, 'ha'),

  /// 1 decare is equal to 1000 square meters.
  decare(1000, 'daa')
  ;

  const UnitArea(this.inSquareMeters, this.symbol);

  /// Find enum value by [symbol], defaults to [hectare] if no match is found.
  static UnitArea fromSymbol(String? symbol) => values.firstWhere(
    (unit) => unit.symbol == symbol,
    orElse: () => .hectare,
  );

  /// The scale of this unit in square meters.
  final double inSquareMeters;

  /// The unit symbol.
  final String symbol;

  /// Convert [value] to this unit from [sourceUnit], defaults to
  /// [hectare].
  double fromUnit(double value, {UnitArea sourceUnit = .squareMeter}) =>
      value * sourceUnit.inSquareMeters / inSquareMeters;
}
