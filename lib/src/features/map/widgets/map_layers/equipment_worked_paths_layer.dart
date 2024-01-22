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

    final children = <Widget>[];
    for (final equipment in equipments) {
      final workedLines = ref.watch(equipmentPathsProvider(equipment.uuid));
      if (workedLines.isNotEmpty) {
        final screenPoints = workedLines
            .mapIndexed(
              (activationIndex, activation) =>
                  activation.map<int, Float32List>((section, points) {
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

                  if (activationIndex == workedLines.length - 1) {
                    final points = equipment.sectionWorkingPoints(section);
                    final offset1 =
                        camera.latLngToScreenPoint(points[1].latLng).toOffset();
                    final offset2 =
                        camera.latLngToScreenPoint(points[2].latLng).toOffset();
                    offsets.addAll([
                      offset1.dx,
                      offset1.dy,
                      offset2.dx,
                      offset2.dy,
                    ]);
                  }
                  return MapEntry(section, Float32List.fromList(offsets));
                }
                return MapEntry(section, Float32List.fromList([]));
              })
                    ..removeWhere((key, value) => value.isEmpty),
            )
            .toList();

        children.add(
          CustomPaint(
            painter: _EquipentWorkedPathsPainter(
              points: screenPoints,
              color: Theme.of(context).primaryColor,
              sectionColors:
                  equipment.sections.map((e) => e.workedPathColor).toList(),
            ),
            size: size,
            isComplex: true,
          ),
        );
      }
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    } else if (children.length == 1) {
      return children.first;
    }

    return Stack(children: children);
  }
}

/// A painter for drawing worked equipment paths on a [Canvas].
class _EquipentWorkedPathsPainter extends CustomPainter {
  /// A painter for drawing worked equipment paths on a [Canvas].
  ///
  /// [points] is the nested list of activation -> section -> path points to
  /// draw. The use of [Float32List] is to use the most performant
  /// [Vertices.raw] mode of [Canvas.drawVertices], so all points should be
  /// converted to x,y values and concatenated in the float list.
  ///
  /// [color] is the color to draw the paths with.
  /// The individual section colors can be overriden with [sectionColors].
  ///
  /// [opacity] is the opacity value to apply to the [color]. This will replace
  /// the alpha value of the [color] with the alpha value corresponding to
  /// [opacity].
  ///
  /// [sectionColors] is the list of override colors to use for each individual
  /// section. If the value is null, the default [color] is applied.
  _EquipentWorkedPathsPainter({
    required this.points,
    this.color = Colors.green,
    this.opacity = 0.4,
    this.sectionColors,
  });

  /// The nested list of equipment -> section -> path points to draw.
  /// The use of [Float32List] is to use the most performant [Vertices.raw]
  /// mode of [Canvas.drawVertices], so all points should be converted to x,y
  /// values and concatenated in the float list.
  final List<Map<int, Float32List>> points;

  /// The color to draw the paths with.
  /// The individual section colors can be overriden with [sectionColors].
  final Color color;

  /// The opacity to apply to the [color]. This will replace the alpha value
  /// of the [color] with the alpha value corresponding to [opacity].
  final double opacity;

  /// A list of override colors to use for each individual section. If the
  /// value is null, the default [color] is applied.
  List<Color?>? sectionColors;

  @override
  void paint(Canvas canvas, Size size) {
    for (final activation in points) {
      activation.forEach((sectionIndex, section) {
        final paintColor = sectionColors?[sectionIndex] ?? color;

        // We can only draw 2^16 = 65536 vertices per call of drawVertices due
        // to Vertices.raw.indices being an Uint16List.
        // Since section is a concatenation of x,y coordinates, 2*65536
        // corresponds to the length for 65536 vertices.
        if (section.length > 2 * 65536) {
          final slices = section.slices(2 * 65536).map(Float32List.fromList);

          for (final element in slices) {
            canvas.drawVertices(
              Vertices.raw(VertexMode.triangleStrip, element),
              BlendMode.src,
              Paint()..color = paintColor.withOpacity(opacity),
            );
          }
        } else {
          canvas.drawVertices(
            Vertices.raw(VertexMode.triangleStrip, section),
            BlendMode.src,
            Paint()..color = paintColor.withOpacity(opacity),
          );
        }
      });
    }
  }

  @override
  bool shouldRepaint(_EquipentWorkedPathsPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_EquipentWorkedPathsPainter oldDelegate) => false;
}
