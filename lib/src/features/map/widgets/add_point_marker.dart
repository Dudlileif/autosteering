import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

/// A marker that will insert a new point to the editable path.
class AddPointMarker extends StatefulWidget {
  const AddPointMarker({
    required this.point,
    required this.onTap,
    required this.radius,
    this.strokeWidth = 2,
    this.color = Colors.red,
    this.useRadiusInMeter = false,
    this.alwaysVisible = false,
    super.key,
  });

  /// Position of the marker
  final LatLng point;

  /// What to do when the marker is tapped.
  final void Function() onTap;

  /// The radius of the marker.
  final double radius;

  /// The strokewidth of the lines in the marker.
  final double strokeWidth;

  /// The color of the marker.
  final Color color;

  /// Whether to use the [radius] parameter as meters instead of pixels.
  final bool useRadiusInMeter;

  /// Whether the marker always should be visible, otherwise on hover/tap.
  final bool alwaysVisible;

  @override
  State<AddPointMarker> createState() => _AddPointMarkerState();
}

/// The actual state and widget for [AddPointMarker].
class _AddPointMarkerState extends State<AddPointMarker> {
  /// Whether the marker should be visible.
  bool visible = false;

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
    // Convert strokeWidth to meters is radius is in meters.
    final strokeWidth = widget.strokeWidth / widget.radius * radiusToUse;

    return Transform.rotate(
      // Counter-rotated to keep upright.
      angle: -map.rotationRad,
      child: MouseRegion(
        onEnter: (event) => setState(() => visible = true),
        onExit: (event) => setState(() => visible = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Visibility(
            visible: visible || widget.alwaysVisible,
            child: CustomPaint(
              painter: PlusIconPainter(
                color: widget.color,
                radius: radiusToUse,
                strokeWidth: strokeWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A painter for drawing a custom sized plus icon.
class PlusIconPainter extends CustomPainter {
  const PlusIconPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });
  final Color color;
  final double radius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..drawLine(
        size.center(Offset.zero).translate(-radius, 0),
        size.center(Offset.zero).translate(radius, 0),
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth,
      )
      ..drawLine(
        size.center(Offset.zero).translate(0, -radius),
        size.center(Offset.zero).translate(0, radius),
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
