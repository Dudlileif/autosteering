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
