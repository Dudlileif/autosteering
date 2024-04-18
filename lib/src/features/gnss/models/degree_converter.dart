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
  /// To add leading zeros, [numBeforeDecimal] can be specified to set the
  /// minimum wanted length before the decimal point.
  static String degreeMinutesFromDecimalDegree(
    double decimalDegrees, {
    int numBeforeDecimal = 1,
    int numDecimals = 5,
  }) {
    final degree = decimalDegrees.wrap360().truncate();
    final minutes = (decimalDegrees - degree) * 60;
    var degreeString = '$degree';
    if (degreeString.length < numBeforeDecimal) {
      degreeString = degreeString.replaceRange(
        0,
        0,
        List.generate(3 - degreeString.length, (index) => '0').join(),
      );
    }
    var minuteString = '${minutes.truncate()}';
    if (minuteString.length < 2) {
      minuteString = '0$minuteString';
    }
    minuteString = minuteString +
        minutes
            .toStringAsFixed(numDecimals)
            .substring(minutes.toStringAsFixed(numDecimals).indexOf('.'));
    return '$degreeString$minuteString';
  }
}
