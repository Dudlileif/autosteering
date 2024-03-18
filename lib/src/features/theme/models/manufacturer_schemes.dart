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

// ignore_for_file: public_member_api_docs

import 'package:collection/collection.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A class with color schemes for different vehicle manufacturers.
class ManufacturerSchemes {
  /// An iterable of the available color schemes with the [brightness] applied.
  static Iterable<FlexSchemeColor> schemes(Brightness brightness) =>
      ManufacturerColors.values.map(
        (value) => scheme(value, brightness),
      );

  /// A function for getting the appropriate color scheme for the manufacturer
  /// [colors], depending on the theme mode [brightness].
  static FlexSchemeColor scheme(
    ManufacturerColors colors,
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
class ManufacturerColors {
  /// A class that holds information about a vehicle manufacturer's color
  /// scheme.
  const ManufacturerColors({
    required this.name,
    required this.primary,
    required this.secondary,
    this.tertiary,
    this.cabFrame,
    this.frame,
    this.rims,
    this.roof,
  });

  /// Creates a [ManufacturerColors] from the [json] object.
  factory ManufacturerColors.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;

    return values.firstWhereOrNull((element) => element.name == name) ??
        ManufacturerColors(
          name: name,
          primary: Color(int.parse(json['primary'] as String, radix: 16)),
          secondary: Color(int.parse(json['secondary'] as String, radix: 16)),
          tertiary: json['tertiary'] != null
              ? Color(int.parse(json['tertiary'] as String, radix: 16))
              : null,
          cabFrame: json['cabFrame'] != null
              ? Color(int.parse(json['cabFrame'] as String, radix: 16))
              : null,
          frame: json['frame'] != null
              ? Color(int.parse(json['frame'] as String, radix: 16))
              : null,
          roof: json['roof'] != null
              ? Color(int.parse(json['roof'] as String, radix: 16))
              : null,
        );
  }

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

  static const caseIH = ManufacturerColors(
    name: 'Case IH',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Colors.black,
    tertiary: Colors.white,
    cabFrame: Colors.black,
    frame: Colors.black,
    rims: Color.fromRGBO(198, 198, 198, 1),
    roof: Color.fromRGBO(173, 26, 41, 1),
  );

  static const claas = ManufacturerColors(
    name: 'Claas',
    primary: Color.fromRGBO(180, 198, 24, 1),
    secondary: Color.fromRGBO(120, 120, 120, 1),
    tertiary: Colors.white,
    cabFrame: Colors.black,
    frame: Color.fromRGBO(100, 100, 100, 1),
    rims: Colors.red,
    roof: Color.fromRGBO(220, 220, 220, 1),
  );

  static const deutzFahr = ManufacturerColors(
    name: 'Deutz Fahr',
    primary: Color.fromRGBO(119, 184, 40, 1),
    secondary: Colors.black,
    cabFrame: Colors.black,
    frame: Colors.black,
    rims: Color.fromRGBO(180, 180, 180, 1),
    roof: Color.fromRGBO(119, 184, 40, 1),
  );

  static const fendt = ManufacturerColors(
    name: 'Fendt',
    primary: Color.fromRGBO(69, 170, 2, 1),
    secondary: Color.fromRGBO(99, 102, 110, 1),
    cabFrame: Color.fromRGBO(69, 170, 2, 1),
    frame: Color.fromRGBO(99, 102, 110, 1),
    rims: Color.fromRGBO(167, 41, 32, 1),
    roof: Colors.white,
  );

  static const ford = ManufacturerColors(
    name: 'Ford',
    primary: Color.fromRGBO(0, 84, 126, 1),
    secondary: Colors.white,
    cabFrame: Color.fromRGBO(0, 84, 126, 1),
    frame: Color.fromRGBO(0, 84, 126, 1),
    rims: Colors.white,
    roof: Colors.white,
  );

  static const johnDeere = ManufacturerColors(
    name: 'John Deere',
    primary: Color.fromRGBO(54, 124, 43, 1),
    secondary: Color.fromRGBO(255, 222, 0, 1),
    cabFrame: Color.fromRGBO(54, 124, 43, 1),
    frame: Color.fromRGBO(54, 124, 43, 1),
    rims: Color.fromRGBO(255, 222, 0, 1),
    roof: Color.fromRGBO(54, 124, 43, 1),
  );

  static const kubota = ManufacturerColors(
    name: 'Kubota',
    primary: Color.fromRGBO(236, 96, 61, 1),
    secondary: Colors.black,
    cabFrame: Colors.black,
    frame: Colors.black,
    rims: Color.fromRGBO(236, 96, 61, 1),
    roof: Color.fromRGBO(236, 96, 61, 1),
  );

  static const masseyFerguson = ManufacturerColors(
    name: 'Massey Ferguson',
    primary: Color.fromRGBO(173, 26, 41, 1),
    secondary: Color.fromRGBO(198, 198, 198, 1),
    cabFrame: Color.fromRGBO(198, 198, 198, 1),
    frame: Color.fromRGBO(111, 107, 102, 1),
    rims: Color.fromRGBO(198, 198, 198, 1),
    roof: Color.fromRGBO(187, 185, 181, 1),
  );

  static const newHolland = ManufacturerColors(
    name: 'New Holland',
    primary: Color.fromRGBO(0, 96, 168, 1),
    secondary: Colors.white,
    cabFrame: Colors.black,
    frame: Colors.black,
    rims: Colors.white,
    roof: Color.fromRGBO(0, 96, 168, 1),
  );

  static const newHollandHarvester = ManufacturerColors(
    name: 'New Holland Harvester',
    primary: Color.fromRGBO(245, 176, 16, 1),
    secondary: Color.fromRGBO(0, 96, 168, 1),
    cabFrame: Colors.black,
    frame: Colors.black,
    rims: Colors.white,
    roof: Color.fromRGBO(245, 176, 16, 1),
  );

  static const valtra = ManufacturerColors(
    name: 'Valtra',
    primary: Color.fromRGBO(172, 29, 47, 1),
    secondary: Color.fromRGBO(172, 29, 47, 1),
    cabFrame: Color.fromRGBO(172, 29, 47, 1),
    frame: Color.fromRGBO(100, 100, 100, 1),
    rims: Colors.white,
    roof: Color.fromRGBO(172, 29, 47, 1),
  );

  static const List<ManufacturerColors> values = [
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
        'primary': primary.value.toRadixString(16),
        'secondary': secondary.value.toRadixString(16),
        'tertiary': tertiary?.value.toRadixString(16),
        'cabFrame': cabFrame?.value.toRadixString(16),
        'frame': frame?.value.toRadixString(16),
        'rims': rims?.value.toRadixString(16),
        'roof': roof?.value.toRadixString(16),
      };
}
