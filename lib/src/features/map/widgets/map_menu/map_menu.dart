import 'package:agopengps_flutter/src/features/common/widgets/widgets.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/country_layer_selector.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/map_perspective_menu.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_menu/osm_layer_button.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_widgets.dart';
import 'package:flutter/material.dart';

/// A menu button and attached submenu for selecting map layers.
class MapMenu extends StatelessWidget {
  const MapMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      text: 'Map',
      icon: Icons.map,
      menuChildren: [
        Align(
          alignment: Alignment.centerRight,
          child: OSMLayerButton(),
        ),
        CountryLayerSelector(),
        SentinelLayerSelector(),
        MapOffsetMenu(),
        MapPerspectiveMenu(),
      ],
    );
  }
}
