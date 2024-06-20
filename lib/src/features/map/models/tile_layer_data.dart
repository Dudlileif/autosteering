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
        ].join(Platform.pathSeparator),
      );
}
