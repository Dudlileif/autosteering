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

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

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

/// Finds the average angle betewwn all the [angles], which are assumed to
/// be in radians.
///
/// Result is in range `-PI ... PI`.
double circularAverage(Iterable<double> angles) {
  final cosSum = angles.map(cos).sum;
  final sinSum = angles.map(sin).sum;

  final radAvg = atan2(sinSum, cosSum);
  return radAvg;
}

/// Finds the average weighted angle betewwn all the [angles], which are assumed
/// to be in radians.
///
/// Result is in range `-PI ... PI`.
double circularAverageWeighted({
  required Iterable<double> angles,
  required Iterable<double> weights,
}) {
  assert(
    angles.length == weights.length,
    'angles and weights must have the same length',
  );
  final cosSum = angles
      .mapIndexed((index, angle) => weights.elementAt(index) * cos(angle))
      .sum;
  final sinSum = angles
      .mapIndexed((index, angle) => weights.elementAt(index) * sin(angle))
      .sum;

  final radAvg = atan2(sinSum, cosSum);
  return radAvg;
}

/// Finds the average bearing between all the [bearings].
double bearingAverage(Iterable<double> bearings) =>
    circularAverage(bearings.map((e) => e.toRadians())).toDegrees().wrap360();

/// Finds the average weighted bearing between all the [bearings].
double bearingAverageWeighted({
  required Iterable<double> bearings,
  required Iterable<double> weights,
}) {
  assert(
    bearings.length == weights.length,
    'bearings and weights must have the same length',
  );
  return circularAverageWeighted(
    angles: bearings.map((e) => e.toRadians()),
    weights: weights,
  ).toDegrees().wrap360();
}

/// Finds the circular standard deviation for the [angles], which are assumed
/// to be in radians.
///
/// Result is in range `0...1`, where 0 means no spread and 1 means maximum
/// spread.
double circularStandardDeviation(Iterable<double> angles) {
  final cosMean = angles.map(cos).average;
  final sinMean = angles.map(sin).average;

  final hypotenuse = [sqrt(pow(cosMean, 2) + pow(sinMean, 2)), 1].min;

  final stdDev = [1.0, sqrt(-2 * log(hypotenuse))].min.abs();

  return stdDev;
}

/// Finds the circular standard deviation for the [bearings].
///
/// Result is in range `0...1`, where 0 means no spread and 1 means maximum
/// spread.
double bearingStandardDeviation(Iterable<double> bearings) =>
    circularStandardDeviation(bearings.map((e) => e.toRadians()));

/// Provides the size [bytes] in a more readable format with binary suffix.
///
/// Number of [decimals] can be adjusted.
String fileEntitySize(int bytes, {int decimals = 1}) {
  const suffixes = ['B', 'kB', 'MB', 'GB'];
  final i = (log(bytes) / log(1024)).floor();

  final value = (bytes / pow(1024, i)).toStringAsFixed(decimals);

  return '$value ${suffixes.elementAtOrNull(i)}';
}

/// Checks area under the [curve] to find out if it's counterclockwise or
/// clockwise.
///
/// A negative area means that the curve is counterclockwise.
bool isCurveCounterclockwise(Iterable<Geographic> curve) {
  var area = 0.0;
  for (var i = 0; i < curve.length; i++) {
    final point = curve.elementAt(i);
    final nextPoint = curve.elementAt((i + 1) % curve.length);
    area += (nextPoint.x - point.x) * (nextPoint.y + point.y);
  }
  return area.isNegative;
}
