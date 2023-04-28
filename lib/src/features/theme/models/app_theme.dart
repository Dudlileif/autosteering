import 'package:dynamic_color/dynamic_color.dart';
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
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
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
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          navigationBarHeight: 80,
          unselectedToggleIsColored: true,
        ),
        swapLegacyOnMaterial3: true,
      );

  /// Returns a harmonized [FlexSchemeColor] for the [scheme].
  ///
  /// Usually called to generate a nicer color scheme when using dynamic colors
  static FlexSchemeColor harmonizedSchemeColor(ColorScheme scheme) =>
      FlexSchemeColor(
        primary: scheme.harmonized().primary,
        secondary: scheme.harmonized().secondary,
        tertiary: scheme.harmonized().tertiary,
        primaryContainer: scheme.harmonized().primaryContainer,
        secondaryContainer: scheme.harmonized().secondaryContainer,
        tertiaryContainer: scheme.harmonized().tertiaryContainer,
        appBarColor: scheme.harmonized().secondaryContainer,
        error: scheme.harmonized().error,
        errorContainer: scheme.harmonized().errorContainer,
      );

  /// Generates dynamic colors from the OS, if available.
  ///
  /// See [DynamicColorPlugin] for supported platforms.
  static Future<List<FlexSchemeColor?>?> getDynamicColors() async {
    late final ColorScheme? lightDynamic;
    late final ColorScheme? darkDynamic;

    // Try Android Material You (S+)
    final corePalette = await DynamicColorPlugin.getCorePalette();
    if (corePalette != null) {
      lightDynamic = corePalette.toColorScheme();
      darkDynamic = corePalette.toColorScheme(brightness: Brightness.dark);
    } else {
      // Try desktop accent color
      final accentColor = await DynamicColorPlugin.getAccentColor();
      if (accentColor != null) {
        lightDynamic = ColorScheme.fromSeed(
          seedColor: accentColor,
        );
        darkDynamic = ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        );
      }
    }

    if (lightDynamic != null && darkDynamic != null) {
      return [
        AppTheme.harmonizedSchemeColor(lightDynamic),
        AppTheme.harmonizedSchemeColor(darkDynamic),
      ];
    }

    return null;
  }
}
