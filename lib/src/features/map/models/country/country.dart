import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/map/models/country/norway.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// A base class for country based layers.
///
/// This is aimed at layers that are specific for a country, or perhaps region
/// locked to a country.
abstract class Country {
  const Country(this.name);

  /// The name of the country.
  final String name;

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
  static const countries = <Country>[norway];

  static const norway = Norway();

  /// Finds the country that corresponds to the [name], if there is one defined.
  static Country? current(String name) => countries.firstWhereOrNull(
        (element) => element.name == name,
      );
}
