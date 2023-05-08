import 'package:agopengps_flutter/src/features/map/widgets/map_layer_menu/country_layer_selector.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_layer_menu/osm_layer_button.dart';
import 'package:agopengps_flutter/src/features/map/widgets/map_widgets.dart';
import 'package:flutter/material.dart';

class MapMenu extends StatelessWidget {
  const MapMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: const [
        Align(
          alignment: Alignment.centerRight,
          child: OSMLayerButton(),
        ),
        CountryLayerSelector(),
        SentinelLayerSelector(),
        MapOffsetMenu(),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.map),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Map',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
