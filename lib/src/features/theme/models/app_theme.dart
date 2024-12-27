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

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A configuration class for theming the app.
class AppTheme {
  /// Default constructor
  ///
  /// Color theme defaults to [FlexScheme.outerSpace]. All options also defaults
  /// to false/disabled.
  const AppTheme({
    this.useDynamicColors = false,
    this.useManufacturerColors = true,
    this.flexScheme = FlexScheme.outerSpace,
    this.lightIsWhite = false,
    this.darkIsTrueBlack = false,
    this.lightColors,
    this.darkColors,
  });

  /// Whether to use dynamic system colors.
  final bool useDynamicColors;

  /// Whether to use a manufacturer's colors.
  final bool useManufacturerColors;

  /// The predefined color scheme to use, see [FlexColor.schemes]
  final FlexScheme flexScheme;

  /// Change some background and surface colors to true white.
  final bool lightIsWhite;

  /// Change some background and surface colors to true black. Neat for OLED
  /// displays.
  final bool darkIsTrueBlack;

  /// Colors for the light scheme.
  final FlexSchemeColor? lightColors;

  /// Colors for the dark scheme.
  final FlexSchemeColor? darkColors;

  /// The light theme from this configuration.
  ThemeData get light => FlexThemeData.light(
        scheme: !useDynamicColors && !useManufacturerColors ? flexScheme : null,
        colors: useDynamicColors || useManufacturerColors ? lightColors : null,
        blendLevel: 10,
        appBarOpacity: 0.90,
        tabBarStyle: FlexTabBarStyle.forBackground,
        tooltipsMatchBackground: true,
        lightIsWhite: lightIsWhite,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3ErrorColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          navigationBarHeight: 80,
          unselectedToggleIsColored: true,
        ),
        swapLegacyOnMaterial3: true,
      );

  /// The dark theme from this configuration.
  ThemeData get dark => FlexThemeData.dark(
        scheme: !useDynamicColors && !useManufacturerColors ? flexScheme : null,
        colors: useDynamicColors || useManufacturerColors ? darkColors : null,
        blendLevel: 15,
        appBarOpacity: 0.90,
        tabBarStyle: FlexTabBarStyle.forBackground,
        tooltipsMatchBackground: true,
        darkIsTrueBlack: darkIsTrueBlack,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3ErrorColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          navigationBarHeight: 80,
          unselectedToggleIsColored: true,
        ),
        swapLegacyOnMaterial3: true,
      );
}
