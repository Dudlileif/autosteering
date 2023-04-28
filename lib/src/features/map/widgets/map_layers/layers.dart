import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

export 'country_layers.dart';
export 'sentinel_layers.dart';

class OSMLayer extends StatelessWidget {
  const OSMLayer({super.key});

  @override
  Widget build(BuildContext context) => themedTileLayerBuilder(
        context,
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['x', 'y', 'z'],
          tileProvider: CachedTileProvider(),
          userAgentPackageName: 'agopengps_flutter',
          maxNativeZoom: 19,
          maxZoom: 22,
        ),
      );
}
