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

/// Provides the size [bytes] in a more readable format with binary suffix.
///
/// Number of [decimals] can be adjusted.
String fileEntitySize(int bytes, {int decimals = 1}) {
  const suffixes = ['B', 'kB', 'MB', 'GB'];
  final i = (log(bytes) / log(1024)).floor();

  final value = (bytes / pow(1024, i)).toStringAsFixed(decimals);

  return '$value ${suffixes.elementAtOrNull(i)}';
}
