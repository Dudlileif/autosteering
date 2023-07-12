import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

/// A marker that will insert a new point to the editable path.
class AddPointMarker extends StatefulWidget {
  /// A marker that will insert a new point to the editable path.
  ///
  /// [point] is the position of the marker on the map.
  ///
  /// [onTap] is the function for what should happen when the marker is tapped.
  ///
  /// [radius] is the radius/size of the marker.
  ///
  /// [strokeWidth] is how thick the line of the marker should be.
  ///
  /// [color] is which color the marker should have.
  ///
  /// If the marker should resize with the zoom level of the map, enable
  /// [useRadiusInMeters].
  ///
  /// If the marker always should be visible, i.e. when not hovered over, set
  /// [alwaysVisible] to true.
  const AddPointMarker({
    required this.point,
    required this.onTap,
    required this.radius,
    this.strokeWidth = 2,
    this.color = Colors.red,
    this.useRadiusInMeters = false,
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
  final bool useRadiusInMeters;

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

    if (widget.useRadiusInMeters) {
      final offset = map.getOffsetFromOrigin(widget.point);
      final r = widget.point.offset(widget.radius, 180);
      final delta = offset - map.getOffsetFromOrigin(r);
      radiusToUse = delta.distance;
    }
    // Convert strokeWidth to meters is radius is in meters.
    final strokeWidth = widget.strokeWidth / widget.radius * radiusToUse;

    return Transform.rotate(
      // Counter-rotated to keep upright.
      angle: -map.rotationRad,
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
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
  /// A painter for drawing a custom sized plus/cross icon.
  ///
  /// [color] gives the color of the icon.
  /// [radius] gives the size of the icon.
  /// [strokeWidth] gives the thickness of the lines of the icon.
  const PlusIconPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });

  /// The color of the icon.
  final Color color;

  /// The radius/size of the icon.
  final double radius;

  /// The thickness of the lines of the icon.
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
