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

import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:universal_io/io.dart';

/// Dedicated [ImageProvider] to fetch tiles from the network and cache them
/// to a file if allowed. If not download is allowed and the image has not been
/// cached, a transparent image will be loaded.
///
/// Supports falling back to a secondary URL, if the primary URL fetch fails.
/// Note that specifying a [fallbackUrl] will prevent this image provider from
/// being cached.
@immutable
class FileCachedNetworkImageProvider
    extends ImageProvider<FileCachedNetworkImageProvider> {
  /// Create a dedicated [ImageProvider] to fetch tiles from the network
  ///
  /// Supports falling back to a secondary URL, if the primary URL fetch fails.
  /// Note that specifying a [fallbackUrl] will prevent this image provider from
  /// being cached.
  const FileCachedNetworkImageProvider({
    required this.url,
    required this.fallbackUrl,
    required this.headers,
    required this.httpClient,
    this.cacheFile,
    this.allowDownload = true,
  });

  /// The URL to fetch the tile from (GET request)
  final String url;

  /// The URL to fetch the tile from (GET request), in the event the original
  /// [url] request fails
  ///
  /// If this is non-null, [operator==] will always return `false` (except if
  /// the two objects are [identical]). Therefore, if this is non-null, this
  /// image provider will not be cached in memory.
  final String? fallbackUrl;

  /// The HTTP client to use to make network requests
  ///
  /// Not included in [operator==].
  final BaseClient httpClient;

  /// The headers to include with the tile fetch request
  ///
  /// Not included in [operator==].
  final Map<String, String> headers;

  /// The file cache for storing and reading the already downloaded image.
  final File? cacheFile;

  /// Whether new tiles can be downloaded from the network.
  final bool allowDownload;

  @override
  ImageStreamCompleter loadImage(
    FileCachedNetworkImageProvider key,
    ImageDecoderCallback decode,
  ) {
    final chunkEvents = StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: 1,
      debugLabel: url,
      informationCollector: () => [
        DiagnosticsProperty('URL', url),
        DiagnosticsProperty('Fallback URL', fallbackUrl),
        DiagnosticsProperty('Current provider', key),
      ],
    );
  }

  @override
  Future<FileCachedNetworkImageProvider> obtainKey(
    ImageConfiguration configuration,
  ) =>
      SynchronousFuture<FileCachedNetworkImageProvider>(this);

  Future<Codec> _loadAsync(
    FileCachedNetworkImageProvider key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode, {
    bool useFallback = false,
  }) async {
    try {
      if (cacheFile?.existsSync() ?? false) {
        // Blank image is 355 bytes, if less the image was probably not
        // received correctly.
        if ((await cacheFile!.length()) > 350) {
          return decode(await ImmutableBuffer.fromFilePath(cacheFile!.path));
        }
      }
      if (allowDownload) {
        final bytes = await httpClient.readBytes(
          Uri.parse(useFallback ? fallbackUrl ?? '' : url),
          headers: headers,
        );
        final buffer = await ImmutableBuffer.fromUint8List(bytes);
        await cacheFile?.create(recursive: true);
        await cacheFile?.writeAsBytes(bytes);

        return decode(buffer).catchError((dynamic e) {
          // Allow throwing exceptions
          // ignore: only_throw_errors
          if (useFallback || fallbackUrl == null) throw e as Object;
          return _loadAsync(key, chunkEvents, decode, useFallback: true);
        });
      }

      return decode(
        await ImmutableBuffer.fromAsset('assets/images/transparent.png'),
      );
    } catch (_) {
      // This redundancy necessary, do not remove
      if (useFallback || fallbackUrl == null) rethrow;
      return _loadAsync(key, chunkEvents, decode, useFallback: true);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FileCachedNetworkImageProvider &&
          fallbackUrl == null &&
          url == other.url &&
          other.allowDownload == allowDownload &&
          other.cacheFile == cacheFile);

  @override
  int get hashCode =>
      Object.hashAll([url, if (fallbackUrl != null) fallbackUrl]);
}
