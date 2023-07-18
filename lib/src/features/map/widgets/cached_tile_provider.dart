import 'dart:developer';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';

/// A [TileProvider] for network images that will be cached.
class CachedTileProvider extends TileProvider {
  /// A [TileProvider] for network images that will be cached.
  ///
  /// Supply custom [headers] if needed.
  ///
  /// Enabling [debugPrint] will print the urls for the tiles to the console as
  /// they are requested.
  ///
  /// Additional [layer] data can be supplied which get shown int the debug log,
  /// mainly the name of the [layer], to easier distinguish between layers when
  /// several layers are active.
  CachedTileProvider({
    this.layer,
    this.debugPrint = false,
    super.headers,
  });

  /// Whether the urls for the tiles should be printed to the console as they
  /// are requested.
  final bool debugPrint;

  /// Additional layer data that can be shown by the debug log, mainly
  /// the name to easier distinguish between layers when several are active.
  final TileLayerData? layer;

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final url = getTileUrl(coordinates, options);
    if (debugPrint) {
      log(
        '''
Layer: ${layer?.name}
$coordinates
Url: $url
''',
        name: 'CachedTileProvider',
        time: DateTime.timestamp(),
      );
    }

    return FastCachedImageProvider(
      url,
      headers: headers,
    );
  }
}
