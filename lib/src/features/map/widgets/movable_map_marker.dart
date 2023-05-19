import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

/// A movable map marker used to edit the position of points in editable paths.
class MovableMapMarker extends StatefulWidget {
  const MovableMapMarker({
    required this.point,
    required this.onMoved,
    required this.radius,
    this.color = const Color(0xFF00FF00),
    this.useRadiusInMeter = false,
    super.key,
  });

  /// Position of the marker
  final LatLng point;

  /// What to do when the marker is moved.
  final void Function(LatLng position) onMoved;

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
    final map = FlutterMapState.of(context);

    var radiusToUse = widget.radius;

    if (widget.useRadiusInMeter) {
      final offset = map.getOffsetFromOrigin(widget.point);
      final r = const Distance().offset(widget.point, widget.radius, 180);
      final delta = offset - map.getOffsetFromOrigin(r);
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
        final point = CustomPoint(
          details.globalPosition.dx,
          details.globalPosition.dy - kToolbarHeight,
        );

        final position = map.pointToLatLng(point);

        if (position != null) {
          widget.onMoved(position);
        }
      },
      feedback: MouseRegion(
        cursor: SystemMouseCursors.move,
        child: baseChild,
      ),
      childWhenDragging: MouseRegion(
        cursor: SystemMouseCursors.move,
        child: CustomPaint(
          painter: CirclePainter(
            color: widget.color.withOpacity(0.35),
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
                    color: widget.color.withOpacity(0.35),
                    radius: radiusToUse * hoverModifier,
                  ),
                ),
                baseChild
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
  const CirclePainter({
    required this.color,
    required this.radius,
  });
  final Color color;
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
