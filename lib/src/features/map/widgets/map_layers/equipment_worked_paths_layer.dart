import 'dart:typed_data';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A layer for painting the equipment worked paths on the [FlutterMap].
class EquipmentWorkedPathsLayer extends ConsumerStatefulWidget {
  /// A layer for painting the equipment worked paths on the [FlutterMap].
  const EquipmentWorkedPathsLayer({super.key});

  @override
  ConsumerState<EquipmentWorkedPathsLayer> createState() =>
      _EquipmentWorkedPathsLayerState();
}

class _EquipmentWorkedPathsLayerState
    extends ConsumerState<EquipmentWorkedPathsLayer> {
  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final size = Size(camera.size.x, camera.size.y);

    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (value) => value.values.where((element) => element.hitchParent != null),
      ),
    );

    final workedLines = equipments
        .map((equipment) => ref.watch(equipmentPathsProvider(equipment.uuid)));

    final screenPoints = workedLines
        .mapIndexed(
          (equipmentIndex, equipment) => equipment.mapIndexed(
            (sectionUpdate, sectionMap) => sectionMap.values
                .mapIndexed((section, points) {
                  if (points != null) {
                    final offsets = points
                        .map(
                          (e) {
                            final offset1 = camera
                                .latLngToScreenPoint(e.$1.latLng)
                                .toOffset();
                            final offset2 = camera
                                .latLngToScreenPoint(e.$2.latLng)
                                .toOffset();
                            return [
                              offset1.dx,
                              offset1.dy,
                              offset2.dx,
                              offset2.dy,
                            ];
                          },
                        )
                        .flattened
                        .toList();

                    if (sectionUpdate == equipment.length - 1) {
                      final offset1 = camera
                          .latLngToScreenPoint(
                            equipments
                                .elementAt(equipmentIndex)
                                .sectionPoints(section)[1]
                                .latLng,
                          )
                          .toOffset();
                      final offset2 = camera
                          .latLngToScreenPoint(
                            equipments
                                .elementAt(equipmentIndex)
                                .sectionPoints(section)[2]
                                .latLng,
                          )
                          .toOffset();
                      offsets.addAll([
                        offset1.dx,
                        offset1.dy,
                        offset2.dx,
                        offset2.dy,
                      ]);
                    }
                    return Float32List.fromList(offsets);
                  }
                  return null;
                })
                .whereNotNull()
                .toList(),
          ),
        )
        .flattened
        .toList();

    return CustomPaint(
      painter: _EquipentWorkedPathsPainter(
        points: screenPoints,
        color: Theme.of(context).primaryColor,
      ),
      size: size,
      isComplex: true,
    );
  }
}

class _EquipentWorkedPathsPainter extends CustomPainter {
  _EquipentWorkedPathsPainter({
    required this.points,
    this.color = Colors.green,
    this.opacity = 0.2,
  });

  /// The nested list of equipment -> section -> path points to draw.
  /// The use of [Float32List] is to use the most performant [Vertices.raw]
  /// mode of [Canvas.drawVertices], so all points should be converted to x,y
  /// values and concatenated in the float list.
  final List<List<Float32List>> points;

  /// The color to draw the paths with.
  final Color color;

  /// The opacity to apply to the [color]. This will replace the alpha value
  /// of the [color] with the alpha value corresponding to [opacity].
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    for (final equipment in points) {
      for (final section in equipment) {
        // Can only draw 2^16 = 65536 vertices per call of drawVertices.
        if (section.length > 65536) {
          final slices = section.slices(65536).map(Float32List.fromList);

          for (final element in slices) {
            canvas.drawVertices(
              Vertices.raw(VertexMode.triangleStrip, element),
              BlendMode.src,
              Paint()..color = color.withOpacity(opacity),
            );
          }
        } else {
          canvas.drawVertices(
            Vertices.raw(VertexMode.triangleStrip, section),
            BlendMode.src,
            Paint()..color = color.withOpacity(opacity),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_EquipentWorkedPathsPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_EquipentWorkedPathsPainter oldDelegate) => false;
}
