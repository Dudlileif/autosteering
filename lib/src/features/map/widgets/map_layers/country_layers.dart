import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryLayers extends ConsumerWidget {
  const CountryLayers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sort the selected layers by their position in available layers.
    // They are sorted backwards to make the top-most layer added
    // to the stack last, so that the sorting corresponds to the
    // selection list.
    final availableLayers = ref.watch(availableCountryLayersProvider);
    final layers = ref.watch(selectedCountryLayersProvider).sorted(
          (key1, key2) => availableLayers
              .indexOf(key2)
              .compareTo(availableLayers.indexOf(key1)),
        );
    final opacities = ref.watch(countryLayerOpacitiesProvider);

    final enabled = layers.isNotEmpty;
    if (!enabled) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: layers.map((layer) {
        final tileLayer = Opacity(
          opacity: opacities[layer.name] ?? 0.5,
          child: TileLayer(
            urlTemplate: layer.urlTemplate,
            wmsOptions: layer.wmsOptions,
            maxNativeZoom: layer.maxNativeZoom,
            tileProvider: CachedTileProvider(),
            maxZoom: 22,
            userAgentPackageName: 'agopengps_flutter',
          ),
        );
        return layer.themedTileLayerBuilder != null
            ? layer.themedTileLayerBuilder!(context, tileLayer)
            : tileLayer;
      }).toList(),
    );
  }
}
