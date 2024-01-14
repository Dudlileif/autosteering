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

    final workedLines = equipments
        .map((equipment) => ref.watch(equipmentPathsProvider(equipment.uuid)));

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
          PolylineLayer(
            polylineCulling: true,
            polylines: workedLines
                .mapIndexed(
                  (equipmentIndex, equipment) => equipment
                      .mapIndexed(
                        (sectionUpdate, sectionMap) => sectionMap.values
                            .mapIndexed(
                              (section, line) => line != null
                                  ? Polyline(
                                      points: sectionUpdate ==
                                              equipment.length - 1
                                          ? [
                                              ...line.map((e) => e.latLng),
                                              equipments
                                                  .elementAt(equipmentIndex)
                                                  .sectionCenter(section)
                                                  .latLng,
                                            ]
                                          : line.map((e) => e.latLng).toList(),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                      strokeWidth: equipments
                                          .elementAt(equipmentIndex)
                                          .sectionWidths[section],
                                      useStrokeWidthInMeter: true,
                                      strokeCap: StrokeCap.butt,
                                      strokeJoin: StrokeJoin.bevel,
                                    )
                                  : null,
                            )
                            .whereNotNull(),
                      )
                      .flattened,
                )
                .flattened
                .toList(),
          ),
          // CircleLayer(
          //   circles: workedLines
          //       .mapIndexed(
          //         (equipmentIndex, equipment) => equipment
          //             .map(
          //               (sectionMap) => sectionMap.values
          //                   .mapIndexed(
          //                     (section, line) => line != null
          //                         ? [
          //                             ...line,
          //                             equipments
          //                                 .elementAt(equipmentIndex)
          //                                 .sectionCenter(section),
          //                           ].map(
          //                             (point) => CircleMarker(
          //                               point: point.latLng,
          //                               radius: 3,
          //                             ),
          //                           )
          //                         : null,
          //                   )
          //                   .whereNotNull()
          //                   .flattened,
          //             )
          //             .flattened,
          //       )
          //       .flattened
          //       .toList(),
          // )
        ],
      ),
    );
  }
}
