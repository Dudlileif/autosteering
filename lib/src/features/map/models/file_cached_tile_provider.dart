import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:universal_io/io.dart';

/// A [TileProvider] for network images that will be downloaded to the file
/// directory.
class FileCachedTileProvider extends TileProvider {
  /// A [TileProvider] for network images that will be downloaded to the file
  /// directory.
  ///
  /// [fileDirectory] is the directory for the cached files.
  ///
  /// [allowDownloads] is whether downloading of new tiles is allowed.
  ///
  /// Supply custom [headers] if needed.
  ///
  /// Enabling [debugPrint] will print the urls for the tiles to the console as
  /// they are requested.
  ///
  /// Additional [layer] data can be supplied which get shown int the debug log,
  /// mainly the name of the [layer], to easier distinguish between layers when
  /// several layers are active.
  ///
  /// [httpClient] is an override for using a different HTTP client than the
  /// default [RetryClient].
  FileCachedTileProvider({
    required this.fileDirectory,
    this.allowDownloads = true,
    this.layer,
    this.debugPrint = false,
    super.headers,
    BaseClient? httpClient,
  }) : httpClient = httpClient ?? RetryClient(Client());

  /// Whether the urls for the tiles should be printed to the console as they
  /// are requested.
  final bool debugPrint;

  /// Additional layer data that can be shown by the debug log, mainly
  /// the name to easier distinguish between layers when several are active.
  final TileLayerData? layer;

  /// The directory for the cached files.
  final Directory fileDirectory;

  /// Whether downloading new tiles is allowed.
  final bool allowDownloads;

  /// The HTTP client to use to make network requests.
  final BaseClient httpClient;

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final layerDirectory = layer?.cacheDirectory(fileDirectory.path);

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

    return FileCachedNetworkImageProvider(
      url: getTileUrl(coordinates, options),
      fallbackUrl: getTileFallbackUrl(coordinates, options),
      headers: headers,
      httpClient: httpClient,
      cacheFile: layerDirectory != null
          ? File(
              [
                layerDirectory.path,
                '${coordinates.z}',
                '${coordinates.y}',
                '${coordinates.x}.png',
              ].join('/'),
            )
          : null,
      allowDownload: allowDownloads,
    );
  }
}
