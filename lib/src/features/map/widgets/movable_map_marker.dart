import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

/// A movable map marker used to edit the position of points in editable paths.
class MovableMapMarker extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final map = FlutterMapState.of(context);

    var radiusToUse = radius;

    if (useRadiusInMeter) {
      final offset = map.getOffsetFromOrigin(point);
      final r = const Distance().offset(point, radius, 180);
      final delta = offset - map.getOffsetFromOrigin(r);
      radiusToUse = delta.distance;
    }

    return Draggable(
      onDragUpdate: (details) {
        final position = map.pointToLatLng(
          CustomPoint(
            details.globalPosition.dx,
            details.globalPosition.dy,
          ),
        );

        if (position != null) {
          onMoved(position);
        }
      },
      feedback: CustomPaint(
        painter: CirclePainter(
          color: color,
          radius: radiusToUse,
        ),
      ),
      childWhenDragging: CustomPaint(
        painter: CirclePainter(
          color: color.withOpacity(0.35),
          radius: radiusToUse,
        ),
      ),
      child: CustomPaint(
        painter: CirclePainter(
          color: color,
          radius: radiusToUse,
        ),
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
