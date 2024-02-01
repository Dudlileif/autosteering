import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer of all the custom country layers.
class CountryLayers extends ConsumerWidget {
  /// A combination layer of all the custom country layers.
  const CountryLayers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sort the selected layers by their position in available layers.
    // They are sorted backwards to make the top-most layer added
    // to the stack last, so that the sorting corresponds to the
    // selection list.
    final layers = ref.watch(sortedCountryLayersProvider);
    final opacities = ref.watch(countryLayerOpacitiesProvider);

    return Stack(
      children: layers.map((layer) {
        final tileLayer = Opacity(
          opacity: opacities[layer.name] ?? 0.5,
          child: TileLayer(
            urlTemplate: layer.urlTemplate,
            wmsOptions: layer.wmsOptions,
            minNativeZoom: layer.minNativeZoom ?? 0,
            maxNativeZoom: layer.maxNativeZoom ?? 19,
            subdomains: layer.subdomains,
            tileProvider: switch (Device.isWeb) {
              true => HiveCachedTileProvider(layer: layer),
              false => FileCachedTileProvider(
                  layer: layer,
                  fileDirectory: ref.watch(fileDirectoryProvider).requireValue,
                  allowDownloads: ref.watch(mapAllowDownloadProvider),
                )
            },
            maxZoom: 22,
            userAgentPackageName: 'autosteering',
          ),
        );
        return layer.themedTileLayerBuilder != null
            ? layer.themedTileLayerBuilder!(context, tileLayer)
            : tileLayer;
      }).toList(),
    );
  }
}
