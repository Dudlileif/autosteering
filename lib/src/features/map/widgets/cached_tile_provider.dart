import 'dart:developer';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';

/// A [TileProvider] for network images that will be cached.
class CachedTileProvider extends TileProvider {
  CachedTileProvider({this.debugPrint = false, super.headers});
  final bool debugPrint;

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final url = getTileUrl(coordinates, options);
    if (debugPrint) log(url);
    return FastCachedImageProvider(
      url,
      headers: headers,
    );
  }
}
