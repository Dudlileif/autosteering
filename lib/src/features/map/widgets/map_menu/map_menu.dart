import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/country_layer_selector.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/delete_cache_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/home_position_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/map_perspective_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/mini_map_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/osm_layer_button.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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
        Align(
          alignment: Alignment.centerRight,
          child: OSMLayerButton(),
        ),
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

    if (id != null && id.length == 36) {
      return MenuButtonWithChildren(
        icon: Icons.check,
        text: 'Copernicus ID',
        menuChildren: [
          MenuItemButton(
            trailingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            child: const Text('Reset'),
            onPressed: () =>
                ref.read(copernicusInstanceIdProvider.notifier).update(null),
          ),
        ],
      );
    }
    return MenuItemButton(
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.satellite_alt),
      ),
      child: const Text('Enter Copernicus ID'),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) {
          var id = '';
          return StatefulBuilder(
            builder: (context, setState) {
              return SimpleDialog(
                title: const Text('Enter Copernicus ID'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Consumer(
                      child: const Text('Save ID'),
                      builder: (context, ref, child) => FilledButton(
                        onPressed: () {
                          ref
                              .read(
                                copernicusInstanceIdProvider.notifier,
                              )
                              .update(id);
                          Navigator.of(context).pop();
                        },
                        child: child,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
