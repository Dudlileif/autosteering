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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';

/// A [TileProvider] for network images that will be cached.
class HiveCachedTileProvider extends TileProvider {
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
  HiveCachedTileProvider({
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
      Logger.instance.i(
        '''
HiveCachedTileProvider getting tile: 
Layer: ${layer?.name}
$coordinates
Url: $url
''',
      );
    }

    return FastCachedImageProvider(
      url,
      headers: headers,
    );
  }
}
