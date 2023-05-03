import 'package:flutter/animation.dart';
import 'package:latlong2/latlong.dart';

/// A class for tweening two [LatLng].
///
/// Get the [LatLng] at any given fraction value with [evaluate].
class LatLngTween extends Tween<LatLng> {
  /// Creates a [LatLng] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  LatLngTween({super.begin, super.end});

  // The inherited lerp() function doesn't work with LatLng because it is a
  // complex object with two doubles that individually needs to be interpolated.
  @override
  LatLng lerp(double t) {
    final latitude = begin!.latitude * (1 - t) + end!.latitude * t;

    final longitude = begin!.longitude * (1 - t) + end!.longitude * t;

    return LatLng(latitude, longitude);
  }
}
