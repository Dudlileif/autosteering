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

import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geobase/geobase.dart' hide Point;

/// A movable map marker used to edit the position of points in editable paths.
class MovableMapMarker extends StatefulWidget {
  /// A movable map marker used to edit the position of points in editable
  /// paths.
  ///
  /// [point] is the position of the marker.
  ///
  /// [onMoved] is the function that triggers when the marker is moved.
  ///
  /// [radius] is the size of the marker.
  ///
  /// [color] is the color of the marker.
  ///
  /// [useRadiusInMeter] is whether the marker should resize with the map zoom
  /// level so that its size is constant in the physical world.
  const MovableMapMarker({
    required this.point,
    required this.onMoved,
    required this.radius,
    this.color = const Color(0xFF00FF00),
    this.useRadiusInMeter = false,
    super.key,
  });

  /// Position of the marker
  final Geographic point;

  /// What to do when the marker is moved.
  final void Function(Geographic position) onMoved;

  /// The radius of the marker.
  final double radius;

  /// The color of the marker.
  final Color color;

  /// Whether to use the [radius] parameter as meters instead of pixels.
  final bool useRadiusInMeter;

  @override
  State<MovableMapMarker> createState() => _MovableMapMarkerState();
}

class _MovableMapMarkerState extends State<MovableMapMarker> {
  double hoverModifier = 1;

  @override
  Widget build(BuildContext context) {
    final map = MapController.of(context).camera;

    var radiusToUse = widget.radius;

    if (widget.useRadiusInMeter) {
      final offset = map.getOffsetFromOrigin(widget.point.latLng);
      final r = widget.point.rhumb
          .destinationPoint(distance: widget.radius, bearing: 180);
      final delta = offset - map.getOffsetFromOrigin(r.latLng);
      radiusToUse = delta.distance;
    }

    final baseChild = CustomPaint(
      painter: CirclePainter(
        color: widget.color,
        radius: radiusToUse,
      ),
    );

    return Draggable(
      ignoringFeedbackPointer: false,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      onDragUpdate: (details) {
        final point = Point(
          details.globalPosition.dx,
          details.globalPosition.dy - kToolbarHeight,
        );

        final position = map.pointToLatLng(point);

        widget.onMoved(position.geoPosition);
      },
      feedback: MouseRegion(
        cursor: SystemMouseCursors.move,
        child: baseChild,
      ),
      childWhenDragging: MouseRegion(
        cursor: SystemMouseCursors.move,
        child: CustomPaint(
          painter: CirclePainter(
            color: widget.color.withValues(alpha: 0.35),
            radius: radiusToUse * 2,
          ),
        ),
      ),
      child: MouseRegion(
        onEnter: (event) => setState(() => hoverModifier = 2),
        onExit: (event) => setState(() => hoverModifier = 1),
        cursor: SystemMouseCursors.click,
        child: switch (hoverModifier > 1) {
          true => Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: CirclePainter(
                    color: widget.color.withValues(alpha: 0.35),
                    radius: radiusToUse * hoverModifier,
                  ),
                ),
                baseChild,
              ],
            ),
          false => baseChild
        },
      ),
    );
  }
}

/// A basic painter for painting a circle.
class CirclePainter extends CustomPainter {
  /// A basic painter for painting a circle.
  ///
  /// [color] is the color of the circle to paint.
  /// [radius] is the radius of the circle to paint.
  const CirclePainter({
    required this.color,
    required this.radius,
  });

  /// The color of the circle to paint.
  final Color color;

  /// The radius of the circle to paint.
  final double radius;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      size.center(Offset.zero),
      radius,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
