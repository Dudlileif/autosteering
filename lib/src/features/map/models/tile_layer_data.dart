import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// A configuration class for a map tile layer.
class TileLayerData {
  const TileLayerData({
    required this.name,
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
}
