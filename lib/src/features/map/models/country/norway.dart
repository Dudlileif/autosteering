import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Norway extends Country {
  const Norway() : super('Norway');

  @override
  List<TileLayerData> get availableLayers => [
        norgeIBilder,
        norgesKart,
        norgesGrunnkart,
        norgesGrunnkartGraatone,
        terrainDTM,
        terrainDTMMulti,
        terrainDOM,
      ];

  @override
  Widget mapContribution(BuildContext context) => Text(
        '© Kartverket',
        style: Theme.of(context).textTheme.bodySmall,
      );

  TileLayerData get norgeIBilder => const TileLayerData(
        name: 'Norge i bilder',
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_nib_web_mercator_wmts_v2?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=Nibcache_web_mercator_v2&STYLE=default&FORMAT=image/png&tileMatrixSet=default028mm&tileMatrix={z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 18,
      );

  TileLayerData get norgesKart => const TileLayerData(
        name: 'Norgeskart',
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norgeskart_bakgrunn&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
        themedTileLayerBuilder: themedTileLayerBuilder,
      );

  TileLayerData get norgesGrunnkart => const TileLayerData(
        name: 'Norges grunnkart',
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norges_grunnkart&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
        themedTileLayerBuilder: themedTileLayerBuilder,
      );

  TileLayerData get norgesGrunnkartGraatone => const TileLayerData(
        name: 'Norges grunnkart gråtone',
        urlTemplate:
            'https://opencache{s}.statkart.no/gatekeeper/gk/gk.open_wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=norges_grunnkart_graatone&STYLE=default&FORMAT=image/png&tileMatrixSet=EPSG:3857&tileMatrix=EPSG:3857:{z}&tileRow={y}&tileCol={x}',
        subdomains: ['', '2', '3'],
        maxNativeZoom: 20,
        themedTileLayerBuilder: themedTileLayerBuilder,
      );

  TileLayerData get terrainDTM => TileLayerData(
        name: 'Terreng - skyggerelieff',
        wmsOptions: WMSTileLayerOptions(
          baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dtm?',
          layers: ['DTM:skyggerelieff'],
          version: '1.3.0',
          styles: ['default'],
        ),
      );

  TileLayerData get terrainDTMMulti => TileLayerData(
        name: 'Terreng - multiskyggerelieff',
        wmsOptions: WMSTileLayerOptions(
          baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dtm?',
          layers: ['DTM:multiskyggerelieff'],
          version: '1.3.0',
          styles: ['default'],
        ),
      );

  TileLayerData get terrainDOM => TileLayerData(
        name: 'Terreng - skyggerelieff DOM',
        wmsOptions: WMSTileLayerOptions(
          baseUrl: 'https://wms.geonorge.no/skwms1/wms.hoyde-dom?',
          layers: ['DOM:skyggerelieff'],
          version: '1.3.0',
          styles: ['default'],
        ),
      );
}
