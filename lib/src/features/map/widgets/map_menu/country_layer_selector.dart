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
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button and attached submenu for selecting custom country layers.
class CountryLayerSelector extends ConsumerWidget {
  /// A menu button and attached submenu for selecting custom country layers.
  const CountryLayerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(mapReadyProvider)) {
      final country = ref.watch(currentCountryProvider);

      if (country == null) {
        return const SizedBox.shrink();
      }

      final availableLayers = ref.watch(availableCountryLayersProvider);

      if (availableLayers.isEmpty) {
        return const SizedBox.shrink();
      }

      final selectedLayers = ref.watch(enabledCountryLayersProvider);

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

      return MenuButtonWithChildren(
        text: country.name,
        icon: Icons.map,
        menuChildren: [
          SizedBox(
            height: 240,
            width: 300,
            child: listView,
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

/// A button in the submenu of the country layer selector.
class _CountryLayerMenuItemButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Consumer(
            builder: (context, ref, child) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: enabled,
              onChanged: (value) => value != null
                  ? value
                      ? ref
                          .read(enabledCountryLayersProvider.notifier)
                          .add(layer)
                      : ref
                          .read(enabledCountryLayersProvider.notifier)
                          .remove(layer)
                  : null,
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
                        final opacity = ref
                            .watch(countryLayerOpacitiesProvider)[layer.name]!;

                        return Slider(
                          value: opacity,
                          label: 'Opacity: ${opacity.toStringAsFixed(2)}',
                          onChanged: enabled
                              ? (value) => ref
                                  .read(countryLayerOpacitiesProvider.notifier)
                                  .update(layer, value)
                              : null,
                          divisions: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
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
