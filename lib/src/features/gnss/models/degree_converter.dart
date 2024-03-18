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

import 'package:geobase/geobase.dart';

/// A class with methods for converting between decimal degrees and degree
/// minutes formats.
class DegreeConverter {
  /// Converts a decimal minute angle to a decimal degree angle.
  ///
  /// (D)DDMM.MMMMM... -> decimal
  static double decimalDegreesFromDegreeMinutes(String degreeMinutes) {
    final pointIndex = degreeMinutes.indexOf('.');
    final degrees =
        double.tryParse(degreeMinutes.substring(0, pointIndex - 2)) ?? 0;
    final minutes =
        double.tryParse(degreeMinutes.substring(pointIndex - 2)) ?? 0;
    return degrees + minutes / 60;
  }

  /// Converts a decimal degree (wrapped to [0, 360>) to the decimal minute
  /// format.
  ///
  /// decimal -> (D)DDMM.MMMMM
  ///
  /// If [decimalDegrees] < 100 and there should be a leading zero
  /// (i.e. for longitude) set [addLeadingZeroIfMissing] to true to enusre
  /// DDDMM.MMMMM format.
  static String degreeMinutesFromDecimalDegree(
    double decimalDegrees, {
    bool addLeadingZeroIfMissing = false,
  }) {
    final degree = decimalDegrees.wrap360().truncate();
    final minutes = (decimalDegrees - degree) * 60;
    final degreeString = [
      switch (addLeadingZeroIfMissing && degree < 100) {
        true => '0',
        false => '',
      },
      '$degree',
    ].join();
    return '$degreeString.${minutes.toStringAsFixed(5)}';
  }
}
