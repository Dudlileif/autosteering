// ignore_for_file: public_member_api_docs

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A class with color schemes for different vehicle manufacturers.
class ManufacturerSchemes {
  /// An iterable of the available color schemes with the [brightness] applied.
  static Iterable<FlexSchemeColor> schemes(Brightness brightness) =>
      ManufacturerColor.values.map(
        (value) => scheme(value, brightness),
      );

  /// A function for getting the appropriate color scheme for the manufacturer
  /// [colors], depending on the theme mode [brightness].
  static FlexSchemeColor scheme(
    ManufacturerColor colors,
    Brightness brightness,
  ) =>
      FlexSchemeColor.from(
        primary: colors.primary,
        secondary: colors.secondary,
        tertiary: colors.tertiary,
        brightness: brightness,
      );
}

/// An enum class with names and colors for each manufacturer.
enum ManufacturerColor {
  caseIH(
    name: 'Case IH',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Colors.black,
    tertiary: Colors.white,
  ),
  claas(
    name: 'Claas',
    primary: Color.fromRGBO(180, 198, 24, 1),
    secondary: Colors.red,
    tertiary: Colors.white,
  ),
  deutzFahr(
    name: 'Deutz Fahr',
    primary: Color.fromRGBO(119, 184, 40, 1),
    secondary: Colors.black,
  ),
  fendt(
    name: 'Fendt',
    primary: Color.fromRGBO(69, 170, 2, 1),
    secondary: Color.fromRGBO(167, 41, 32, 1),
  ),
  ford(
    name: 'Ford',
    primary: Color.fromRGBO(0, 84, 126, 1),
    secondary: Colors.white,
  ),
  johnDeere(
    name: 'John Deere',
    primary: Color.fromRGBO(54, 124, 43, 1),
    secondary: Color.fromRGBO(255, 222, 0, 1),
  ),
  kubota(
    name: 'Kubota',
    primary: Color.fromRGBO(236, 96, 61, 1),
    secondary: Colors.black,
  ),
  masseyFerguson(
    name: 'Massey Ferguson',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Color.fromRGBO(198, 198, 198, 1),
  ),
  newHolland(
    name: 'New Holland',
    primary: Color.fromRGBO(0, 96, 168, 1),
    secondary: Colors.white,
  ),
  valtra(
    name: 'Valtra',
    primary: Color.fromRGBO(172, 29, 47, 1),
    secondary: Colors.white,
  );

  const ManufacturerColor({
    required this.name,
    required this.primary,
    required this.secondary,
    this.tertiary,
  });

  /// The primary color for the color scheme.
  final Color primary;

  /// The secondary color for the color scheme.
  final Color secondary;

  /// the tertiary color for the color scheme.
  final Color? tertiary;

  /// The name of the manufacturer.
  final String name;
}
