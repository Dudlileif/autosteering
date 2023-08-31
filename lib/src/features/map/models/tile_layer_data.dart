import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:universal_io/io.dart';

/// A configuration class for a map tile layer.
class TileLayerData {
  /// A configuration class for a map tile layer.
  ///
  /// [name] is the display name for the layer.
  /// The [urlTemplate] is the url that is used to get WMTS map tiles,
  /// typical XYZ tiles.
  ///
  /// [subdomains] is a list of optional subdomains that can help spread the
  /// server load.
  ///
  /// The [wmsOptions] is special options for a layer that uses WMS.
  /// [minNativeZoom] and [maxNativeZoom] are the zoom level limits for the
  /// image tiles.
  ///
  /// [minZoom] and [maxZoom] are the zoom level limits for whether this layer
  /// should be shown on the map.
  ///
  /// [themedTileLayerBuilder] is an optional widget builder that is used
  /// when using dark mode, primarily useful for non-satellite maps.
  const TileLayerData({
    required this.name,
    this.folderName,
    this.urlTemplate,
    this.subdomains = const [],
    this.wmsOptions,
    this.minNativeZoom,
    this.maxNativeZoom,
    this.minZoom = 0,
    this.maxZoom = 22,
    this.themedTileLayerBuilder,
  });

  /// The name of the layer.
  final String name;

  /// The name of the folder to put this layer in, if there is one.
  final String? folderName;

  /// The url template for getting map tiles for this layer.
  final String? urlTemplate;

  /// Special options for layers that use WMS, not WMTS.
  final WMSTileLayerOptions? wmsOptions;

  /// Optional subdomains for spreading queries and server load.
  final List<String> subdomains;

  /// The minimum zoom level that the layer has image tiles for.
  final int? minNativeZoom;

  /// The maximum zoom level that the layer has image tiles for.
  final int? maxNativeZoom;

  /// The minumum zoom level that should show the layer.
  final double minZoom;

  /// The maximum zoom level that should show the layer.
  final double maxZoom;

  /// A themed version of the map layer tiles, if defined. Typically used
  /// to get dark mode tiles for non-satellite maps.
  final Widget Function(
    BuildContext,
    Widget,
  )? themedTileLayerBuilder;

  /// The folder which the cached image tiles of this layer is stored in.
  Directory cacheDirectory(String userFolder) => Directory(
        [
          userFolder,
          'map_image_cache',
          if (folderName != null) folderName,
          name,
        ].join('/'),
      );
}
