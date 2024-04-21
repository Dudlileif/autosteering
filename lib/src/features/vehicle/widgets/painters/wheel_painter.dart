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

// ignore_for_file: unused_element

import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geobase/geobase.dart' hide Point;

/// A dynamic wheel painter both in size and movement.
class WheelPainter extends StatelessWidget {
  /// A dynamic wheel painter both in size and movement.
  const WheelPainter({
    required this.innerPosition,
    required this.vehicleBearing,
    this.steeringAngle = 0,
    this.width = 0.6,
    this.diameter = 1.8,
    this.rotation = 0,
    this.isRightWheel = false,
    this.centerMapOnVehicle = true,
    this.vehicleIsArticulated = false,
    super.key,
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

  /// Whether the map is centered on the vehicle.
  final bool centerMapOnVehicle;

  /// Whether the vehicle is steered by an articulated joint.
  final bool vehicleIsArticulated;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);

    final bearing = (vehicleBearing + steeringAngle).wrap360();

    final centerPosition = innerPosition.rhumb.destinationPoint(
      distance: width / 2,
      bearing: bearing + switch (isRightWheel) { true => -1, false => 1 } * 90,
    );

    final meterScale = (camera.getOffsetFromOrigin(innerPosition.latLng) -
                camera.getOffsetFromOrigin(centerPosition.latLng))
            .distance /
        (width / 2);

    final scaledWidth = meterScale * width;
    final scaledHeight = meterScale * diameter;

    final innerPositionPoint = camera.latLngToScreenPoint(innerPosition.latLng);

    var angle = 0.0;
    if (camera.rotation == 0) {
      angle = bearing.toRadians();
    } else {
      if (centerMapOnVehicle) {
        if (vehicleIsArticulated) {
          angle = camera.rotationRad + vehicleBearing.toRadians();
        } else {
          angle = steeringAngle.toRadians();
        }
      } else {
        angle = camera.rotationRad + bearing.toRadians();
      }
    }

    return Positioned(
      width: scaledWidth,
      height: scaledHeight,
      left: innerPositionPoint.x - scaledWidth / 2,
      top: innerPositionPoint.y - scaledHeight / 2,
      child: Transform.rotate(
        angle: angle,
        child: CustomPaint(
          painter: _WheelPainterImplementation(
            width: scaledWidth,
            height: scaledHeight,
            ribs: (diameter * 5 * pi).round(),
            rotation: rotation,
            isRightWheel: isRightWheel,
            ribColor: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}

/// A dynamic wheel painter both in size and movement.
class _WheelPainterImplementation extends CustomPainter {
  /// A dynamic wheel painter both in size and movement.
  _WheelPainterImplementation({
    required this.width,
    required this.height,
    this.rotation = 0,
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

  /// The longitudinal rotation position of the wheel.
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
