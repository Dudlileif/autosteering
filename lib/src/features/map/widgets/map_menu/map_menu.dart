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
import 'package:autosteering/src/features/map/widgets/map_menu/country_layer_selector.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/delete_cache_menu.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/grid_layer_button.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/home_position_menu.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/map_perspective_menu.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/mini_map_menu.dart';
import 'package:autosteering/src/features/map/widgets/map_menu/osm_layer_button.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

/// A menu button and attached submenu for configuring the map.
class MapMenu extends StatelessWidget {
  /// A menu button and attached submenu for configuring the map.
  const MapMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      text: 'Map',
      icon: Icons.map,
      menuChildren: [
        MiniMapMenu(),
        HomePositionMenu(),
        GridLayerButton(),
        OSMLayerButton(),
        CountryLayerSelector(),
        SentinelLayerSelector(),
        MapOffsetMenu(),
        MapPerspectiveMenu(),
        _MapAllowDownloadTile(),
        _CopernicusIDButton(),
        DeleteCacheMenu(),
      ],
    );
  }
}

class _MapAllowDownloadTile extends ConsumerWidget {
  const _MapAllowDownloadTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) => CheckboxListTile(
        secondary: const Icon(Icons.download),
        title: Text(
          'Allow download',
          style: Theme.of(context).menuButtonWithChildrenText,
        ),
        value: ref.watch(mapAllowDownloadProvider),
        onChanged: (value) => value != null
            ? ref.read(mapAllowDownloadProvider.notifier).update(value: value)
            : null,
      );
}

class _CopernicusIDButton extends ConsumerWidget {
  const _CopernicusIDButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(copernicusInstanceIdProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    if (id != null && id.length == 36) {
      return MenuButtonWithChildren(
        icon: Icons.check,
        text: 'Copernicus ID',
        menuChildren: [
          MenuItemButton(
            closeOnActivate: false,
            trailingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            child: Text(
              'Reset',
              style: textStyle,
            ),
            onPressed: () =>
                ref.read(copernicusInstanceIdProvider.notifier).update(null),
          ),
        ],
      );
    }
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.satellite_alt),
      ),
      child: Text(
        'Enter Copernicus ID',
        style: textStyle,
      ),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) {
          var id = '';
          return StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              title: const Text('Enter Copernicus ID'),
              contentPadding: const EdgeInsets.only(
                left: 24,
                top: 12,
                right: 24,
                bottom: 16,
              ),
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.label_outline),
                      labelText: 'Copernicus ID',
                    ),
                    initialValue: id,
                    onChanged: (value) => setState(() => id = value),
                    onFieldSubmitted: (value) => setState(() => id = value),
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value != null && Uuid.isValidUUID(fromString: value)
                            ? null
                            : '''The entered ID must be a valid UUID.''',
                  ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.clear),
                          label: const Text('Cancel'),
                        ),
                        Consumer(
                          builder: (context, ref, child) => FilledButton.icon(
                            onPressed: () {
                              ref
                                  .read(
                                    copernicusInstanceIdProvider.notifier,
                                  )
                                  .update(id);
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.check),
                            label: const Text('Save ID'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
