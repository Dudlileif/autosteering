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

// ignore_for_file: unused_element

import 'dart:collection';

import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'led_bar_config.freezed.dart';
part 'led_bar_config.g.dart';

/// A configuration class for configuring the virtual LED bar.
@freezed
class LedBarConfig with _$LedBarConfig {
  /// A configuration class for configuring the virtual LED bar.
  ///
  /// [centerCount] is the amount of center LEDs on one side, usually green.
  /// [intermediateCount] is the amount of intermediate LEDs on one side,
  /// usually yellow.
  /// [endCount] is the amount of the outer-most LEDs on one side, usually red.
  ///
  /// [distancePerLed] is how far the cross track distance has to increase
  /// to light up the next LED.
  ///
  /// [oddCenter] can be set to have one LED in the exact center.
  /// Otherwise [evenCenterSimulateOdd] can be set to true to use the two
  /// center-most lights as a replacement for the one in center.
  ///
  /// [endColor] is the color of the LEDs on the ends of the bar, defaults
  /// to red.
  ///
  /// [intermediateColor] is the color of the LEDs after the ends until the
  /// center, defaults to yellow.
  ///
  /// [centerColor] is the color of the LEDs in the center of the bar,
  /// defaults to green.
  ///
  /// [ledSize] is the size of the individual LEDs in their largest state (lit).
  ///
  /// [barWidth] is the total width of the LED bar.
  ///
  /// [reverseBar] will reverse the bar so that the LEDs will light up opposite
  /// of the default configuration.
  const factory LedBarConfig({
    /// The amount of green LEDs to the side of the center.
    @Default(2) int centerCount,

    /// The amount of yellow LEDs to the left of the center, the i.e. between
    /// the green and yellow leds.
    @Default(2) int intermediateCount,

    /// The amount of red LEDs furthest to the left.
    @Default(2) int endCount,

    /// Whether there is a singular center diode (not used on the virtual bar
    /// because of the distance gauge).
    @Default(false) bool oddCenter,

    /// The increase in cross track distance that will activate the next
    /// led.
    @Default(0.04) double distancePerLed,

    /// If [oddCenter] is false, this will dictate whether the two center-most
    /// LEDs will light up when the cross track distance is smaller than
    /// [distancePerLed].
    @Default(false) bool evenCenterSimulateOdd,

    /// The color of the outermost end LEDs, usually red.
    @ColorSerializer() @Default(Colors.red) Color endColor,

    /// The color of the intermediate LEDs, usually yellow.
    @ColorSerializer() @Default(Colors.yellow) Color intermediateColor,

    /// The color of the center LEDs, usually green.
    @ColorSerializer() @Default(Colors.green) Color centerColor,

    /// The size of the individual LEDs in their largest state (lit).
    @Default(20) double ledSize,

    /// Width of the whole LED bar.
    @Default(800) double barWidth,

    /// Whether the bar should be reversed/inverted.
    @Default(false) bool reverseBar,

    /// Whether the LEDs should be hidden when not lit/active.
    @Default(true) bool showInactiveLeds,
  }) = _LedBarConfig;

  const LedBarConfig._();

  /// Creates a [LedBarConfig] from the [json] object.
  factory LedBarConfig.fromJson(Map<String, Object?> json) =>
      _$LedBarConfigFromJson(json);

  /// The total amount of led lights.
  int get totalCount =>
      2 * endCount +
      2 * intermediateCount +
      2 * centerCount +
      (oddCenter ? 1 : 0);

  /// The amount of LEDs left of the center.
  int get oneSideCount => endCount + intermediateCount + centerCount;

  /// Returns a map of which leds should be active for the given perpendicular
  /// [distance].
  ///
  /// A negative distance is assumed as being to the left of the line, i.e.
  /// the leds on the right side should light up and vice versa.
  Map<int, bool> activeForDistance(double distance) {
    final map = SplayTreeMap<int, bool>();

    final sideCount = oneSideCount;

    if (oddCenter) {
      map[sideCount] = true;
    }
    // If we have even number of green lights, enable the two center ones
    // if specified.
    else if (evenCenterSimulateOdd && centerCount >= 1) {
      map[sideCount - 1] = true;
      map[sideCount] = true;
    }

    final directionCorrectedDistance = reverseBar ? -distance : distance;

    for (var i = 1; i <= sideCount; i++) {
      if (map[sideCount - i] == null) {
        var j = i;
        if (evenCenterSimulateOdd && centerCount >= 1) {
          j--;
        }
        map[sideCount - i] = distancePerLed * j <= directionCorrectedDistance;
      }
    }

    final rightStart = map.length - 1;
    for (var i = 1; i <= sideCount; i++) {
      if (map[sideCount + i] == null) {
        map[rightStart + i] = distancePerLed * i <= -directionCorrectedDistance;
      }
    }

    return map;
  }

  /// Returns the color corresponding to the outermost lit LED for this
  /// cross track [distance].
  Color colorFromDistance(double distance) {
    var ledCount = distance.abs() ~/ distancePerLed;
    if (evenCenterSimulateOdd && centerCount >= 1) {
      ledCount++;
    }
    if (ledCount <= centerCount) {
      return centerColor;
    } else if (ledCount <= centerCount + intermediateCount) {
      return intermediateColor;
    }
    return endColor;
  }
}
