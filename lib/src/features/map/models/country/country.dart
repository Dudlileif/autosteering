import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/map/models/country/norway.dart';
import 'package:collection/collection.dart';

class Country {
  const Country(this.name);
  final String name;

  List<TileLayerData> get availableLayers => [];

  TileLayerData? layer(String name) =>
      availableLayers.firstWhereOrNull((element) => element.name == name);
}

class Countries {
  static const countries = <Country>[norway];

  static const norway = Norway();

  static Country? current(String name) => countries.firstWhereOrNull(
        (element) => element.name == name,
      );
}
