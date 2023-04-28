import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryLayerSelector extends ConsumerWidget {
  const CountryLayerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(mapReadyProvider)) {
      final country = ref.watch(currentCountryProvider);
      final availableLayers = ref.watch(availableCountryLayersProvider);
      final selectedLayers = ref.watch(selectedCountryLayersProvider);

      final listView = ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: availableLayers.length,
        itemBuilder: (context, index) {
          final layer = availableLayers.elementAt(index);
          final enabled =
              selectedLayers.any((element) => layer.name == element.name);
          return _CountryLayerMenuItemButton(
            key: ValueKey(layer.name),
            index: index,
            enabled: enabled,
            layer: layer,
          );
        },
        onReorder: ref.read(availableCountryLayersProvider.notifier).reorder,
      );

      return country != null && availableLayers.isNotEmpty
          ? SubmenuButton(
              menuChildren: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 3 * 80,
                      width: 300,
                      child: listView,
                    ),
                  ],
                )
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.map),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      country.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}

class _CountryLayerMenuItemButton extends ConsumerWidget {
  const _CountryLayerMenuItemButton({
    required this.index,
    required this.enabled,
    required this.layer,
    super.key,
  });
  final int index;
  final bool enabled;
  final TileLayerData layer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = ref.watch(countryLayerOpacitiesProvider)[layer.name]!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: enabled,
            onChanged: (value) =>
                ref.read(selectedCountryLayersProvider.notifier).toggle(layer),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  layer.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                SliderTheme(
                  data: Theme.of(context).sliderTheme.copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                      ),
                  child: Slider(
                    value: opacity,
                    label: 'Opacity: ${opacity.toStringAsFixed(2)}',
                    onChanged: enabled
                        ? (value) => ref
                            .read(countryLayerOpacitiesProvider.notifier)
                            .update(layer, value)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ReorderableDragStartListener(
            index: index,
            child: const Card(
              child: Icon(Icons.drag_handle),
            ),
          ),
        )
      ],
    );
  }
}
