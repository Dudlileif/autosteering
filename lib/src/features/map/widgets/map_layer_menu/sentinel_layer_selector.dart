import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentinelLayerSelector extends ConsumerWidget {
  const SentinelLayerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(mapReadyProvider)) {
      final availableLayers = ref.watch(availableSentinelLayersProvider);
      final selectedLayers = ref.watch(selectedSentinelLayersProvider);

      final listView = ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: availableLayers.length,
        itemBuilder: (context, index) {
          final layer = availableLayers.elementAt(index);
          final enabled =
              selectedLayers.any((element) => layer.name == element.name);
          return _SentinelLayerMenuItemButton(
            key: ValueKey(layer.layerType),
            index: index,
            enabled: enabled,
            layer: layer,
          );
        },
        onReorder: ref.read(availableSentinelLayersProvider.notifier).reorder,
      );

      return availableLayers.isNotEmpty
          ? SubmenuButton(
              menuChildren: [
                SizedBox(
                  height: 3 * 80,
                  width: 300,
                  child: listView,
                )
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.satellite_alt),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Sentinel',
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

class _SentinelLayerMenuItemButton extends ConsumerWidget {
  const _SentinelLayerMenuItemButton({
    required this.index,
    required this.enabled,
    required this.layer,
    super.key,
  });
  final int index;
  final bool enabled;
  final SentinelLayer layer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = ref.watch(sentinelLayerOpacitiesProvider)[layer.layerType]!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: enabled,
            onChanged: (value) =>
                ref.read(selectedSentinelLayersProvider.notifier).toggle(layer),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(layer.name),
                SliderTheme(
                  data: Theme.of(context).sliderTheme.copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                      ),
                  child: Slider(
                    value: opacity,
                    label: 'Opacity: ${opacity.toStringAsFixed(2)}',
                    onChanged: enabled
                        ? (value) => ref
                            .read(sentinelLayerOpacitiesProvider.notifier)
                            .update(layer.layerType, value)
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
        ),
      ],
    );
  }
}
