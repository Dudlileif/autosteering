// ignore_for_file: unused_element

import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'led_bar_config.freezed.dart';
part 'led_bar_config.g.dart';

/// A configuration class for configuring the virtual LED bar.
@freezed
class LedBarConfig with _$LedBarConfig {
  /// A configuration class for configuring the virtual LED bar.
  ///
  /// [leftEndCount] is the amount of left most LEDs, usually red.
  /// [leftIntermediateCount] is the amount of left intermediate LEDs, usually
  /// yellow.
  /// [centerCount] is the amount of center LEDs, usually green.
  /// [rightIntermediateCount] is the amount of right intermediate LEDs, usually
  /// yellow.
  /// [rightEndCount] is the amount of right most LEDs, usually red.
  ///
  /// [distancePerLed] is how far the cross track distance has to increase
  /// to light up the next LED.
  ///
  /// [centerCount] should be odd to have one LED in the exact center.
  /// Otherwise [evenCenterSimulateOdd] can be set to true to use the two
  /// center-most lights as a replacement for the one in center.
  ///
  /// The colors are in format `0xAARRGGBB`, and can be changed from the
  /// default end-red, intermediate-yellow and center-green.
  ///
  /// [endColor] is the color of the LEDs on the ends of the bar, defaults
  /// to red.
  ///
  /// [intermediateColor] is the color of the LEDs after the ends until the
  /// center, defualts to yellow.
  ///
  /// [centerColor] is the color of the LEDs in the center of the bar,
  /// defualts to green.
  ///
  /// [ledSize] is the size of the individual LEDs in their largest state (lit).
  const factory LedBarConfig({
    /// The amount of red LEDs furthest to the left.
    @Default(2) int leftEndCount,

    /// The amount of yellow LEDs to the left of the center.
    @Default(2) int leftIntermediateCount,

    /// The amount of center green LEDs, odd number is prefered to have
    /// one in actual center.
    @Default(3) int centerCount,

    // The amount of yellow LEDs to the right of the center.
    @Default(2) int rightIntermediateCount,

    /// The amount of red LEDs furthest to the right.
    @Default(2) int rightEndCount,

    /// The increase in cross track distance that will activate the next
    /// led.
    @Default(0.04) double distancePerLed,

    /// If the [centerCount] is even, this will dictate whether the
    /// two center-most LEDs will light up when the cross track distance
    /// is smaller than [distancePerLed].
    @Default(false) bool evenCenterSimulateOdd,

    /// The color of the outermost end LEDs, usually red.
    /// Format: 0xAARRGGBB
    @Default(0xFFFF0000) int endColor,

    /// The color of the intermediate LEDs, usually yellow.
    /// Format: 0xAARRGGBB
    @Default(0xFFFFEF3B) int intermediateColor,

    /// The color of the center LEDs, usually green.
    /// Format: 0xAARRGGBB
    @Default(0xFF00FF00) int centerColor,

    /// The size of the individual LEDs in their largest state (lit).
    @Default(32) double ledSize,
  }) = _LedBarConfig;

  const LedBarConfig._();

  /// Creates a [LedBarConfig] from the [json] object.
  factory LedBarConfig.fromJson(Map<String, Object?> json) =>
      _$LedBarConfigFromJson(json);

  /// The total amount of led lights.
  int get totalCount =>
      leftEndCount +
      leftIntermediateCount +
      centerCount +
      rightIntermediateCount +
      rightEndCount;

  /// The amount of LEDs left of the center.
  int get leftOfCenterCount =>
      leftEndCount +
      leftIntermediateCount +
      switch (centerCount.isEven && !evenCenterSimulateOdd) {
        true => centerCount / 2,
        false => ((centerCount - 1) / 2).floor(),
      }
          .toInt();

  /// The amount of LEDs right of the center.
  int get rightOfCenterCount =>
      rightEndCount +
      rightIntermediateCount +
      switch (centerCount.isEven && !evenCenterSimulateOdd) {
        true => centerCount / 2,
        false => ((centerCount - 1) / 2).floor(),
      }
          .toInt();

  /// Returns a map of which leds should be active for the given perpendicular
  /// [distance].
  ///
  /// A negative distance is assumed as being to the left of the line, i.e.
  /// the leds on the right side should light up and vice versa.
  Map<int, bool> activeForDistance(double distance) {
    final map = SplayTreeMap<int, bool>();

    final ledsLeftOfCenter = leftOfCenterCount;
    final ledsRightOfCenter = rightOfCenterCount;

    if (centerCount.isOdd) {
      map[ledsLeftOfCenter] = true;
    }
    // If we have even number of green lights, enable the two center ones
    // if specified.
    else if (evenCenterSimulateOdd && centerCount > 1) {
      map[ledsLeftOfCenter] = true;
      map[ledsLeftOfCenter + 1] = true; 
    }

    for (var i = 1; i <= ledsLeftOfCenter; i++) {
      map[ledsLeftOfCenter - i] = distancePerLed * i <= distance;
    }

    final rightStart = map.length - 1;
    for (var i = 1; i <= ledsRightOfCenter; i++) {
      map[rightStart + i] = distancePerLed * i <= -distance;
    }

    return map;
  }
}
