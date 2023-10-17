import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geobase/geobase.dart';

/// A dynamic wheel painter both in size and movement.
class WheelPainter extends StatelessWidget {
  /// A dynamic wheel painter both in size and movement.
  const WheelPainter({
    required this.innerPosition,
    required this.vehicleBearing,
    this.steeringAngle = 0,
    super.key,
    this.width = 0.6,
    this.diameter = 1.8,
    this.rotation = 0,
    this.isRightWheel = false,
  });

  /// The center position of the wheel.
  final Geographic innerPosition;

  /// The bearing of the wheel.
  final double vehicleBearing;

  /// The steering angle of the wheel.
  final double steeringAngle;

  /// The width of the tyre in meters.
  final double width;

  /// The diameter of the tyre in meters.
  final double diameter;

  /// The rotation of the wheel.
  final double rotation;

  /// Whether the wheel is on the right side of the vehicle in the forward
  /// direction. Otherwise it's assumed to be the left wheel.
  final bool isRightWheel;

  @override
  Widget build(BuildContext context) {
    final map = FlutterMapState.of(context);
    final bearing = (vehicleBearing + steeringAngle).wrap360();

    final offset = map.getOffsetFromOrigin(innerPosition.latLng);

    final centerPosition = innerPosition.spherical.destinationPoint(
      distance: this.width / 2,
      bearing: bearing + switch (isRightWheel) { true => -1, false => 1 } * 90,
    );

    final width =
        (offset - map.getOffsetFromOrigin(centerPosition.latLng)).distance * 2;

    final frontPosition = innerPosition.spherical
        .destinationPoint(distance: diameter / 2, bearing: bearing);

    final height =
        (offset - map.getOffsetFromOrigin(frontPosition.latLng)).distance * 2;

    final mapPoint = map.project(innerPosition.latLng);
    final point = mapPoint - map.pixelOrigin;

    final anchor = Anchor.fromPos(
      AnchorPos.align(AnchorAlign.center),
      width,
      height,
    );
    final rightPortion = width - anchor.left;
    final leftPortion = anchor.left;
    final bottomPortion = height - anchor.top;
    final topPortion = anchor.top;

    if (!map.pixelBounds.containsPartialBounds(
      Bounds(
        CustomPoint(mapPoint.x + leftPortion, mapPoint.y - bottomPortion),
        CustomPoint(mapPoint.x - rightPortion, mapPoint.y + topPortion),
      ),
    )) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned(
          width: width,
          height: height,
          left: point.x - rightPortion,
          top: point.y - bottomPortion,
          child: Transform.rotate(
            angle: bearing.toRadians(),
            child: CustomPaint(
              painter: _WheelPainterImplementation(
                width: width,
                height: height,
                ribs: (diameter * 5 * pi).round(),
                rotation: rotation,
                isRightWheel: isRightWheel,
                baseColor: switch (theme.brightness) {
                  Brightness.light => Colors.black,
                  Brightness.dark => Colors.black,
                },
                ribColor: switch (theme.brightness) {
                  Brightness.light => Colors.grey.shade800,
                  Brightness.dark => Colors.grey.shade800,
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// A dynamic wheel painter both in size and movement.
class _WheelPainterImplementation extends CustomPainter {
  /// A dynamic wheel painter both in size and movement.
  _WheelPainterImplementation({
    required this.width,
    required this.height,
    required this.rotation,
    this.ribs = 10,
    this.isRightWheel = false,
    this.baseColor = Colors.black,
    this.ribColor = const Color.fromRGBO(66, 66, 66, 1),
  });

  /// The width of the tyre in meters.
  final double width;

  /// The diameter of the tyre in meters.
  final double height;

  /// The number of
  final int ribs;

  /// The rotation position of the wheel.
  final double rotation;

  /// Whether the wheel is on the right side of the vehicle in the forward
  /// direction. Otherwise it's assumed to be the left wheel.
  final bool isRightWheel;

  final Color baseColor;
  final Color ribColor;

  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()..color = baseColor;

    final ribPaint = Paint()
      ..color = ribColor
      ..strokeWidth = width / 5;

    final innerCenterPosition = Offset(
      width / 2,
      height / 2,
    );

    final outerCenterPosition = Offset(
      switch (isRightWheel) { true => 3, false => -1 } * width / 2,
      height / 2,
    );

    final centerPosition = Offset(
      switch (isRightWheel) { true => width, false => 0 },
      height / 2,
    );

    // Draw base wheel
    final baseRect = Rect.fromCenter(
      center: centerPosition,
      width: width,
      height: height,
    );

    canvas
      ..drawRRect(
        RRect.fromRectAndRadius(
          baseRect,
          Radius.circular(width * 0.4),
        ),
        basePaint,
      )

      // Translate the long track of ribs to show rotation
      ..translate(0, -rotation * height * pi);

    // Clip the long track of ribs to the base wheel.
    final clipRect = Rect.fromCenter(
      center: Offset(
        switch (isRightWheel) { true => width, false => 0 },
        rotation * height * pi + height / 2,
      ),
      width: width * 1.1,
      height: height * 1.03,
    );

    canvas.clipRRect(
      RRect.fromRectAndRadius(clipRect, Radius.circular(width * 0.4)),
    );

    // Draw long track of ribs, only the ones in the clipped area will
    // show.
    for (var i = 0; i <= (ribs * 5 / 4).ceil() + 2; i++) {
      final center = centerPosition.translate(
        0,
        -height / 2 + (i * height * pi) / ribs,
      );

      final edge = Offset(
        0,
        -height / 2 + ((i + 1) * height * pi) / ribs,
      );

      canvas
        ..drawLine(
          center,
          innerCenterPosition + edge,
          ribPaint,
        )
        ..drawLine(
          center.translate(0, -0.5 * height * pi / ribs),
          (outerCenterPosition + edge).translate(0, -0.5 * height * pi / ribs),
          ribPaint,
        );
    }
  }

  @override
  bool shouldRepaint(_WheelPainterImplementation oldDelegate) =>
      oldDelegate.width != width ||
      oldDelegate.height != height ||
      oldDelegate.rotation != rotation;
}
