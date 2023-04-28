import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

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
  final String name;
  final String? urlTemplate;
  final WMSTileLayerOptions? wmsOptions;
  final List<String> subdomains;
  final double? minNativeZoom;
  final double? maxNativeZoom;
  final double minZoom;
  final double maxZoom;
  final Widget Function(
    BuildContext,
    Widget,
  )? themedTileLayerBuilder;
}
