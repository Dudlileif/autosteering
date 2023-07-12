import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// A layer for the OpenStreetMap map tiles.
///
/// The map tiles are themed when in dark mode.
class OSMLayer extends StatelessWidget {
  /// A layer for the OpenStreetMap map tiles.
  ///
  /// The map tiles are themed when in dark mode.
  const OSMLayer({super.key});

  @override
  Widget build(BuildContext context) => themedTileLayerBuilder(
        context,
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['x', 'y', 'z'],
          tileProvider: CachedTileProvider(),
          userAgentPackageName: 'agopengps_flutter',
          maxNativeZoom: 19,
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
