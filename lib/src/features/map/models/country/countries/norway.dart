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
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// A country class for Norway, with a selection of maps from Kartverket.
class Norway extends Country {
  /// A country class for Norway, with a selection of maps from Kartverket.
  const Norway() : super('Norway');

  @override
  List<TileLayerData> get availableLayers => [
    _norgesKart,
    _terrainDTM,
    _terrainDTMMulti,
    _terrainDOM,
  ];

  @override
  Widget mapContribution(BuildContext context) =>
      Text('© Kartverket', style: Theme.of(context).textTheme.bodySmall);

  TileLayerData get _norgesKart => TileLayerData(
    name: 'Norgeskart',
    folderName: folderName,
    urlTemplate:
        'https://cache.kartverket.no/v1/wmts/1.0.0/topo/default/webmercator/{z}/{y}/{x}.png',
    maxNativeZoom: 18,
    themedTileLayerBuilder: themedTileLayerBuilder,
  );

  TileLayerData get _terrainDTM => TileLayerData(
    name: 'Terreng - skyggerelieff',
    folderName: folderName,
    wmsOptions: WMSTileLayerOptions(
      baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dtm?',
      layers: const ['DTM:skyggerelieff'],
      version: '1.3.0',
      styles: const ['default'],
    ),
  );

  TileLayerData get _terrainDTMMulti => TileLayerData(
    name: 'Terreng - multiskyggerelieff',
    folderName: folderName,
    wmsOptions: WMSTileLayerOptions(
      baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dtm?',
      layers: const ['DTM:multiskyggerelieff'],
      version: '1.3.0',
      styles: const ['default'],
    ),
  );

  TileLayerData get _terrainDOM => TileLayerData(
    name: 'Terreng - skyggerelieff DOM',
    folderName: folderName,
    wmsOptions: WMSTileLayerOptions(
      baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dom?',
      layers: const ['DOM:skyggerelieff'],
      version: '1.3.0',
      styles: const ['default'],
    ),
  );
}
