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

// Some color are currently not overidden.
// ignore_for_file: unused_element_parameter

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
  ///
  /// If [forMiniMap] is true, then the layer will use the map controller
  /// of the mini map as basis for the zoom and origin.
  const EquipmentWorkedPathsLayer({this.forMiniMap = false, super.key});

  /// Whether the layer is for the mini map, which has its own map controller.
  final bool forMiniMap;

  @override
  ConsumerState<EquipmentWorkedPathsLayer> createState() =>
      _EquipmentWorkedPathsLayerState();
}

class _EquipmentWorkedPathsLayerState
    extends ConsumerState<EquipmentWorkedPathsLayer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final camera = MapCamera.of(context);
    final size = Size(camera.size.width, camera.size.height);

    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (value) =>
            value.values.where((element) => element.parentConnection != null),
      ),
    );

    final recordFraction = ref.watch(equipmentRecordPositionFractionProvider);

    final children = <Widget>[];
    for (final equipment in equipments) {
      final activationStatus = equipment.sectionActivationStatus;
      final (:sections, :origin, :prevActivePosition) = ref.watch(
        equipmentMapPathsProvider(
          equipment.id!,
          forMiniMap: widget.forMiniMap,
        ),
      );
      if (sections.isNotEmpty) {
        children.add(
          CustomPaint(
            painter: _EquipentWorkedPathsPainter(
              points: sections,
              color: theme.primaryColor,
              sectionColors: Map<int, Color?>.fromEntries(
                equipment.sections
                    .where((section) => section.workingWidth > 0)
                    .map((e) => MapEntry(e.index, e.workedPathColor)),
              ),
              offset: camera.pixelOrigin - origin,
            ),
            size: size,
          ),
        );
        final activeSections = Map<int, Float32List>.fromEntries(
          sections.keys
              .map((section) {
                if (activationStatus[section]! &&
                    prevActivePosition?[section] != null) {
                  final sectionEdges = equipment.sectionEdgePositions(
                    section,
                    fraction: recordFraction,
                  );
                  final offsetLeft =
                      camera.crs.latLngToOffset(
                        sectionEdges!.left.latLng,
                        camera.zoom,
                      ) -
                      origin;

                  final offsetRight =
                      camera.crs.latLngToOffset(
                        sectionEdges.right.latLng,
                        camera.zoom,
                      ) -
                      origin;

                  final prevOffsetLeft =
                      camera.crs.latLngToOffset(
                        prevActivePosition![section]!.left.latLng,
                        camera.zoom,
                      ) -
                      origin;

                  final prevOffsetRight =
                      camera.crs.latLngToOffset(
                        prevActivePosition[section]!.right.latLng,
                        camera.zoom,
                      ) -
                      origin;

                  return MapEntry(
                    section,
                    Float32List.fromList([
                      offsetRight.dx,
                      offsetRight.dy,
                      prevOffsetRight.dx,
                      prevOffsetRight.dy,
                      prevOffsetLeft.dx,
                      prevOffsetLeft.dy,
                      prevOffsetLeft.dx,
                      prevOffsetLeft.dy,
                      offsetLeft.dx,
                      offsetLeft.dy,
                      offsetRight.dx,
                      offsetRight.dy,
                    ]),
                  );
                }
                return MapEntry(section, Float32List(0));
              })
              .where((entry) => entry.value.isNotEmpty),
        );

        if (activeSections.isNotEmpty) {
          children.add(
            CustomPaint(
              painter: _EquipentWorkedPathsPainter(
                points: activeSections,
                color: theme.primaryColor,
                sectionColors: Map<int, Color?>.fromEntries(
                  equipment.sections
                      .where((section) => section.workingWidth > 0)
                      .map((e) => MapEntry(e.index, e.workedPathColor)),
                ),
                offset: camera.pixelOrigin - origin,
              ),
              size: size,
              isComplex: true,
            ),
          );
        }
      }
    }
    if (children.isEmpty) {
      return const SizedBox.shrink();
    } else if (children.length == 1) {
      return children.first;
    }
    return Stack(children: [...children]);
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
  /// [offset] is the offset for moving the canvas to the camera position.
  ///
  /// [color] is the color to draw the paths with.
  /// The individual section colors can be overidden with [sectionColors].
  ///
  /// [opacity] is the opacity value to apply to the [color]. This will replace
  /// the alpha value of the [color] with the alpha value corresponding to
  /// [opacity].
  ///
  /// [sectionColors] is the list of override colors to use for each individual
  /// section. If the value is null, the default [color] is applied.
  _EquipentWorkedPathsPainter({
    required this.points,
    required this.offset,
    this.color = Colors.green,
    this.opacity = 0.4,
    this.sectionColors,
  });

  /// The nested list of equipment -> section -> path points to draw.
  /// The use of [Float32List] is to use the most performant [Vertices.raw]
  /// mode of [Canvas.drawVertices], so all points should be converted to x,y
  /// values and concatenated in the float list.
  final Map<int, Float32List> points;

  /// The color to draw the paths with.
  /// The individual section colors can be overidden with [sectionColors].
  final Color color;

  /// The opacity to apply to the [color]. This will replace the alpha value
  /// of the [color] with the alpha value corresponding to [opacity].
  final double opacity;

  /// A list of override colors to use for each individual section. If the
  /// value is null, the default [color] is applied.
  Map<int, Color?>? sectionColors;

  /// The offset for moving the canvas to the camera position.
  final Offset offset;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(-offset.dx, -offset.dy);

    points.forEach((sectionIndex, section) {
      final paintColor = sectionColors?[sectionIndex] ?? color;

      // We can only draw 2^16 = 65536 vertices per call of drawVertices due
      // to Vertices.raw.indices being an Uint16List.
      // Since section is a concatenation of x,y coordinates, 2*65536
      // corresponds to the length for 65536 vertices.
      // Every triangle then consists of six x,y pairs, so we slice where the
      // last full triangle ends. (2*65536)~/6 = 131070
      if (section.length > 131070) {
        final slices = section.slices(131070).map(Float32List.fromList);

        for (final element in slices) {
          canvas.drawVertices(
            Vertices.raw(VertexMode.triangles, element),
            BlendMode.src,
            Paint()..color = paintColor.withValues(alpha: opacity),
          );
        }
      } else {
        canvas.drawVertices(
          Vertices.raw(VertexMode.triangles, section),
          BlendMode.src,
          Paint()..color = paintColor.withValues(alpha: opacity),
        );
      }
    });
  }

  @override
  bool shouldRepaint(_EquipentWorkedPathsPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_EquipentWorkedPathsPainter oldDelegate) => false;
}
