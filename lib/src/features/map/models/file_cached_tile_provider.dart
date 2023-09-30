import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

/// A [TileProvider] for network images that will be downloaded to the file
/// directory.
class FileCachedTileProvider extends TileProvider {
  /// A [TileProvider] for network images that will be downloaded to the file
  /// directory.
  ///
  /// [ref] is required to find the [fileDirectoryProvider], which is where
  /// the files get stored.
  ///
  /// Supply custom [headers] if needed.
  ///
  /// Enabling [debugPrint] will print the urls for the tiles to the console as
  /// they are requested.
  ///
  /// Additional [layer] data can be supplied which get shown int the debug log,
  /// mainly the name of the [layer], to easier distinguish between layers when
  /// several layers are active.
  FileCachedTileProvider({
    required this.ref,
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

  /// A riverpod provider ref to access providers.
  final WidgetRef ref;

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final layerDirectory = layer
        ?.cacheDirectory(ref.watch(fileDirectoryProvider).requireValue.path);

    if (layerDirectory != null) {
      // Create the directory and a file that says when it was created.
      if (!layerDirectory.existsSync()) {
        layerDirectory.createSync(recursive: true);
        final time = DateTime.now();
        File(
          [
            layerDirectory.path,
            'created',
          ].join('/'),
        )
          ..createSync(recursive: true)
          ..writeAsStringSync(time.toIso8601String());
      }
    }

    final file = File(
      [
        layerDirectory?.path,
        '${coordinates.z}',
        '${coordinates.y}',
        '${coordinates.x}.png',
      ].join('/'),
    );

    if (file.existsSync()) {
      if (debugPrint) {
        Logger.instance.i(
          '''
FileCachedTileProvider found tile:
Layer: ${layer?.name}
$coordinates
File: ${file.path}
''',
        );
      }

      return Image.file(file).image;
    }

    if (ref.watch(mapAllowDownloadProvider)) {
      final url = getTileUrl(coordinates, options);

      Dio().download(
        url,
        file.path,
        options: Options(
          responseType: ResponseType.bytes,
          headers: headers,
        ),
      );

      if (debugPrint) {
        Logger.instance.i(
          '''
FileCachedTileProvider downloading tile:
Layer: ${layer?.name}
$coordinates
Url: $url
File: ${file.path}
''',
        );
      }

      return NetworkImage(url, headers: headers);
    }
    return const AssetImage('assets/images/transparent.png');
  }
}
