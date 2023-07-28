import 'dart:math';

/// Find the [value] modulo 2π.
double mod2pi(double value) => value % (2 * pi);

/// The absolute minimal difference in degrees between [bearing1] and
/// [bearing2].
double bearingDifference(double bearing1, double bearing2) =>
    180 - (180 - ((bearing2 - bearing1) % 360)).abs();

/// The signed minimal difference in degrees from [bearing1] to [bearing2].
double signedBearingDifference(double bearing1, double bearing2) {
  final difference = (bearing2 - bearing1) % 360;

  if (difference < -180) {
    return difference + 360;
  }

  if (difference >= 180) {
    return difference - 360;
  }

  return difference;
}
