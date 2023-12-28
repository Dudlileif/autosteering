import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the selected Sentinel layers.
class SentinelLayers extends ConsumerWidget {
  /// A combination layer for the selected Sentinel layers.
  const SentinelLayers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sort the selected layers by their position in available layers.
    // They are sorted backwards to make the top-most layer added
    // to the stack last, so that the sorting corresponds to the
    // selection list.
    final availableLayers = ref.watch(availableSentinelLayersProvider);
    final layers = ref.watch(enabledSentinelLayersProvider).sorted(
          (key1, key2) => availableLayers
              .indexOf(key2)
              .compareTo(availableLayers.indexOf(key1)),
        );
    final maxCloudCoveragePercent =
        ref.watch(sentinelMaxCloudCoveragePercentProvider);
    final opacities = ref.watch(sentinelLayerOpacitiesProvider);

    return Stack(
      children: layers
          .map(
            (layer) => Opacity(
              opacity: opacities[layer.layerType] ?? 0.5,
              child: TileLayer(
                urlTemplate: layer.urlTemplate(maxCloudCoveragePercent),
                maxNativeZoom: 18,
                userAgentPackageName: 'autosteering',
                maxZoom: 22,
                tileProvider: switch (Device.isNative) {
                  true => FileCachedTileProvider(
                      layer: layer.layerData,
                      ref: ref,
                    ),
                  false => null,
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

/// A small attribution widget for the Copernicus Sentinel layers.
class SentinelContribution extends StatelessWidget {
  /// A small attribution widget for the Copernicus Sentinel layers.
  const SentinelContribution({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Copernicus Sentinel data ${DateTime.now().year}',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
