import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// A country class for Norway, with a selection of maps from Kartverket.
class Norway extends Country {
  /// A country class for Norway, with a selection of maps from Kartverket.
  const Norway() : super('Norway');

  @override
  List<TileLayerData> get availableLayers => [
        _norgeIBilder,
        _norgesKart,
        _norgesGrunnkart,
        _norgesGrunnkartGraatone,
        _terrainDTM,
        _terrainDTMMulti,
        _terrainDOM,
      ];

  @override
  Widget mapContribution(BuildContext context) => Text(
        '© Kartverket',
        style: Theme.of(context).textTheme.bodySmall,
      );

  TileLayerData get _norgeIBilder => TileLayerData(
        name: 'Norge i bilder',
        folderName: folderName,
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_nib_web_mercator_wmts_v2?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=Nibcache_web_mercator_v2&STYLE=default&FORMAT=image/png&tileMatrixSet=default028mm&tileMatrix={z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 18,
      );

  TileLayerData get _norgesKart => TileLayerData(
        name: 'Norgeskart',
        folderName: folderName,
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norgeskart_bakgrunn&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
        themedTileLayerBuilder: themedTileLayerBuilder,
      );

  TileLayerData get _norgesGrunnkart => TileLayerData(
        name: 'Norges grunnkart',
        folderName: folderName,
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norges_grunnkart&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
        themedTileLayerBuilder: themedTileLayerBuilder,
      );

  TileLayerData get _norgesGrunnkartGraatone => TileLayerData(
        name: 'Norges grunnkart gråtone',
        folderName: folderName,
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norges_grunnkart_graatone&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
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
