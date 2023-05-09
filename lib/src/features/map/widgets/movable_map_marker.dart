import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MovableMapMarker extends StatelessWidget {
  const MovableMapMarker({
    required this.point,
    required this.onMoved,
    required this.radius,
    this.color = const Color(0xFF00FF00),
    this.useRadiusInMeter = false,
    super.key,
  });

  final LatLng point;
  final void Function(LatLng position) onMoved;
  final double radius;
  final Color color;
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
