import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

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

  final LatLng point;
  final void Function() onTap;
  final double radius;
  final double strokeWidth;
  final Color color;
  final bool useRadiusInMeter;
  final bool alwaysVisible;

  @override
  State<AddPointMarker> createState() => _AddPointMarkerState();
}

class _AddPointMarkerState extends State<AddPointMarker> {
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

    return Transform.rotate(
      angle: -map.rotationRad,
      child: MouseRegion(
        onEnter: (event) => setState(() => visible = true),
        onExit: (event) => setState(() => visible = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Visibility(
            visible: visible ||
                widget.alwaysVisible ||
                Platform.isAndroid ||
                Platform.isIOS,
            child: CustomPaint(
              painter: IconPainter(
                color: widget.color,
                radius: radiusToUse,
                strokeWidth: widget.strokeWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconPainter extends CustomPainter {
  const IconPainter({
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
