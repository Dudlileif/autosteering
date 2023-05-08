import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

/// A builder for theming the map tiles, used to get a dark mode map.
Widget themedTileLayerBuilder(
  BuildContext context,
  Widget tileLayer,
) =>
    switch (Theme.of(context).brightness) {
      Brightness.dark => // Rotate hue by 180 deg, lower saturation
        ChangeColors(
          hue: 1,
          saturation: -0.2,

          // Invert colors
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.difference,
            ),
            child: tileLayer,
          ),
        ),
      Brightness.light => tileLayer,
    };
