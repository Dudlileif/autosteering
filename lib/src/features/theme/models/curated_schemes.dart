import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A class for curating and sorting a wanted list of color schemes.
class CuratedSchemes {
  /// Filter out unwanted color schemes and sort them so that
  /// green comes first.
  static List<FlexScheme> curatedSchemes(Brightness brightness) =>
      FlexScheme.values
          .where(
            (scheme) => ![
              FlexScheme.material,
              FlexScheme.materialBaseline,
              FlexScheme.materialHc,
              FlexScheme.custom,
              FlexScheme.flutterDash,
            ].contains(scheme),
          )
          .toList()
        ..sort(
          (a, b) => shiftHue(a, brightness).compareTo(
            shiftHue(b, brightness),
          ),
        );

  /// Used to shift the color hue so that green (105 deg) becomes 0, or the
  /// top of the circle / sorting order.
  static double shiftHue(
    FlexScheme scheme,
    Brightness brightness, {
    double degrees = 105,
  }) {
    final colorData = FlexColor.schemes[scheme]!;
    final color = switch (brightness) {
      Brightness.light => colorData.light.primary,
      Brightness.dark => colorData.dark.primary,
    };
    final hue = HSVColor.fromColor(color).hue;
    return (hue - degrees) % 360;
  }
}
