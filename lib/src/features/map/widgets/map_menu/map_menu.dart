import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/country_layer_selector.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/delete_cache_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/home_position_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/map_perspective_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/osm_layer_button.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        DeleteCacheMenu(),
      ],
    );
  }
}

class _MapAllowDownloadTile extends ConsumerWidget {
  const _MapAllowDownloadTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
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
}
