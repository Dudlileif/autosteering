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

/// A class that holds information about a vehicle manufacturer's color
/// scheme.
class ManufacturerColor {
  /// A class that holds information about a vehicle manufacturer's color
  /// scheme.
  const ManufacturerColor({
    required this.name,
    required this.primary,
    required this.secondary,
    this.tertiary,
    this.cabFrame,
    this.frame,
    this.rims,
    this.roof,
  });

  /// Creates a [ManufacturerColor] from the [json] object.
  factory ManufacturerColor.fromJson(Map<String, dynamic> json) =>
      ManufacturerColor(
        name: json['name'] as String,
        primary: Color(json['primary'] as int),
        secondary: Color(json['secondary'] as int),
        tertiary:
            json['tertiary'] != null ? Color(json['tertiary'] as int) : null,
        cabFrame:
            json['cabFrame'] != null ? Color(json['cabFrame'] as int) : null,
        frame: json['frame'] != null ? Color(json['frame'] as int) : null,
        roof: json['roof'] != null ? Color(json['roof'] as int) : null,
      );

  /// The name of the manufacturer.
  final String name;

  /// The primary color for the color scheme.
  final Color primary;

  /// The secondary color for the color scheme.
  final Color secondary;

  /// The tertiary color for the color scheme.
  final Color? tertiary;

  /// The color of the cab frame for the manufacturer.
  final Color? cabFrame;

  /// The color of the main frame for the manufacturer.
  final Color? frame;

  /// The color of the wheel rims for the manufacturer.
  final Color? rims;

  /// The color of the roof for the manufacturer.
  final Color? roof;

  static const caseIH = ManufacturerColor(
    name: 'Case IH',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Colors.black,
    tertiary: Colors.white,
    rims: Color.fromRGBO(198, 198, 198, 1),
  );

  static const claas = ManufacturerColor(
    name: 'Claas',
    primary: Color.fromRGBO(180, 198, 24, 1),
    secondary: Color.fromRGBO(120, 120, 120, 1),
    tertiary: Colors.white,
    rims: Colors.red,
  );

  static const deutzFahr = ManufacturerColor(
    name: 'Deutz Fahr',
    primary: Color.fromRGBO(119, 184, 40, 1),
    secondary: Colors.black,
    rims: Color.fromRGBO(180, 180, 180, 1),
  );

  static const fendt = ManufacturerColor(
    name: 'Fendt',
    primary: Color.fromRGBO(69, 170, 2, 1),
    secondary: Color.fromRGBO(120, 120, 120, 1),
    rims: Color.fromRGBO(167, 41, 32, 1),
  );

  static const ford = ManufacturerColor(
    name: 'Ford',
    primary: Color.fromRGBO(0, 84, 126, 1),
    secondary: Colors.white,
  );

  static const johnDeere = ManufacturerColor(
    name: 'John Deere',
    primary: Color.fromRGBO(54, 124, 43, 1),
    secondary: Color.fromRGBO(255, 222, 0, 1),
    cabFrame: Color.fromRGBO(54, 124, 43, 1),
    frame: Color.fromRGBO(54, 124, 43, 1),
    rims: Color.fromRGBO(255, 222, 0, 1),
    roof: Color.fromRGBO(54, 124, 43, 1),
  );

  static const kubota = ManufacturerColor(
    name: 'Kubota',
    primary: Color.fromRGBO(236, 96, 61, 1),
    secondary: Colors.black,
    rims: Color.fromRGBO(236, 96, 61, 1),
  );

  static const masseyFerguson = ManufacturerColor(
    name: 'Massey Ferguson',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Color.fromRGBO(198, 198, 198, 1),
    cabFrame: Color.fromRGBO(198, 198, 198, 1),
  );

  static const newHolland = ManufacturerColor(
    name: 'New Holland',
    primary: Color.fromRGBO(0, 96, 168, 1),
    secondary: Colors.white,
  );

  static const newHollandHarvester = ManufacturerColor(
    name: 'New Holland Harvester',
    primary: Color.fromRGBO(245, 176, 16, 1),
    secondary: Color.fromRGBO(0, 96, 168, 1),
    rims: Colors.white,
  );

  static const valtra = ManufacturerColor(
    name: 'Valtra',
    primary: Color.fromRGBO(172, 29, 47, 1),
    secondary: Colors.white,
  );

  static const List<ManufacturerColor> values = [
    caseIH,
    claas,
    deutzFahr,
    fendt,
    ford,
    johnDeere,
    kubota,
    masseyFerguson,
    newHolland,
    newHollandHarvester,
    valtra,
  ];

  /// Creates a json compatible representation of the object.
  Map<String, dynamic> toJson() => {
        'name': name,
        'primary': primary.value,
        'secondary': secondary.value,
        'tertiary': tertiary?.value,
        'cabFrame': cabFrame?.value,
        'frame': frame?.value,
        'rims': rims?.value,
        'roof': roof?.value,
      };
}
