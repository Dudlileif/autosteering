import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging equipment.
class EquipmentDebugLayer extends ConsumerWidget {
  /// A combination layer for debugging equipment.
  const EquipmentDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (value) => value.values.where((element) => element.hitchParent != null),
      ),
    );

    return MouseRegion(
      cursor: ref.watch(equipmentHoveredProvider)
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      child: Stack(
        children: [
          PolygonLayer(
            polygons: equipments
                .map((e) => e.mapPolygons)
                .whereNotNull()
                .flattened
                .toList(),
          ),
          CircleLayer(
            circles: [
              ...equipments
                  .map(
                    (equipment) => equipment.hitchPoints.mapIndexed(
                      (index, hitch) => CircleMarker(
                        point: hitch.latLng,
                        radius: 5,
                        color: [Colors.red, Colors.green, Colors.blue][index],
                      ),
                    ),
                  )
                  .flattened,
              ...equipments.map(
                (equipment) => CircleMarker(
                  point: equipment.workingCenter.latLng,
                  radius: 5,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),

        
        ],
      ),
    );
  }
}
