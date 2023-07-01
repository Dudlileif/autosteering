import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button and attached submenu for Sentinel layers.
class SentinelLayerSelector extends ConsumerWidget {
  const SentinelLayerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(mapReadyProvider)) {
      final availableLayers = ref.watch(availableSentinelLayersProvider);

      if (availableLayers.isEmpty) {
        return const SizedBox.shrink();
      }

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

      return MenuButtonWithChildren(
        icon: Icons.satellite_alt,
        text: 'Sentinel',
        menuChildren: [
          SizedBox(
            height: 3 * 80,
            width: 300,
            child: listView,
          )
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

/// A button in the submenu of the Sentinel layer selector.
class _SentinelLayerMenuItemButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: enabled,
                onChanged: (value) => ref
                    .read(selectedSentinelLayersProvider.notifier)
                    .toggle(layer),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      layer.name,
                      style: theme.menuButtonWithChildrenText,
                    ),
                    SliderTheme(
                      data: theme.sliderTheme.copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final opacity = ref.watch(
                            sentinelLayerOpacitiesProvider,
                          )[layer.layerType]!;

                          return Slider(
                            value: opacity,
                            label: 'Opacity: ${opacity.toStringAsFixed(2)}',
                            onChanged: enabled
                                ? (value) => ref
                                    .read(
                                      sentinelLayerOpacitiesProvider.notifier,
                                    )
                                    .update(layer.layerType, value)
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
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
