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
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A layer for the OpenStreetMap map tiles.
///
/// The map tiles are themed when in dark mode.
class OSMLayer extends ConsumerWidget {
  /// A layer for the OpenStreetMap map tiles.
  ///
  /// The map tiles are themed when in dark mode.
  const OSMLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => themedTileLayerBuilder(
        context,
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['x', 'y', 'z'],
          tileProvider: switch (Device.isWeb) {
            true => HiveCachedTileProvider(
                layer: const TileLayerData(name: 'OpenStreetMap'),
              ),
            false => FileCachedTileProvider(
                layer: const TileLayerData(name: 'OpenStreetMap'),
                fileDirectory: ref.watch(fileDirectoryProvider).requireValue,
                allowDownloads: ref.watch(mapAllowDownloadProvider),
              )
          },
          userAgentPackageName: 'autosteering',
          maxZoom: 22,
        ),
      );
}

/// A small OpenStreetMap contribution widget, to use in corner of the map.
class OSMContribution extends StatelessWidget {
  /// A small OpenStreetMap contribution widget, to use in corner of the map.
  const OSMContribution({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '© ',
            style: textTheme.bodySmall,
          ),
          TextSpan(
            text: 'OpenStreetMap',
            style: textTheme.bodySmall?.copyWith(
                // decoration: TextDecoration.underline,
                ),
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () async {
            //     final url =
            //         Uri.parse('https://www.openstreetmap.org/copyright');
            //     if (await canLaunchUrl(url)) {
            //       await launchUrl(url);
            //     }
            //   },
          ),
          TextSpan(
            text: ' contributors',
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
