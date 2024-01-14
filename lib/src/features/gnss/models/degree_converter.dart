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
