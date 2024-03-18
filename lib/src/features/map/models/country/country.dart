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

import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/map/models/country/countries/countries.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// A base class for country based layers.
///
/// This is aimed at layers that are specific for a country, or perhaps region
/// locked to a country.
abstract class Country {
  /// A base class for country based layers.
  ///
  /// This is aimed at layers that are specific for a country, or perhaps region
  /// locked to a country.
  const Country(this.name) : folderName = 'Country/$name';

  /// The name of the country.
  final String name;

  /// The local path to the folder for this country.
  ///
  /// Usually 'Country/[name]'.
  final String folderName;

  /// A list of the country's layers.
  List<TileLayerData> get availableLayers;

  /// Finds the layer which corresponds to the [name], if there is one.
  TileLayerData? layer(String name) =>
      availableLayers.firstWhereOrNull((element) => element.name == name);

  /// A tiny widget to show on the map if the source needs contribution cited.
  Widget mapContribution(BuildContext context);
}

/// A class for collecting the available countries.
class Countries {
  /// The list of available countries.
  static const countries = <Country>[
    Norway(),
  ];

  /// Finds the country that corresponds to the [name], if there is one defined.
  static Country? current(String name) => countries.firstWhereOrNull(
        (element) => element.name == name,
      );
}
