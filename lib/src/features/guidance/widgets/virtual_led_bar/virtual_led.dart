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

import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

/// A virtual LED light for use with a virtual LED bar.
class VirtualLed extends StatelessWidget {
  /// A virtual LED light for use with a virtual LED bar.
  ///
  /// [color] is what color the indicator has.
  /// [active] is whether the indicator should light up.
  /// [size] is the size of the LED in it's largest state (lit).
  const VirtualLed({
    required this.color,
    required this.active,
    this.showWhenInactive = true,
    this.size,
    super.key,
  });

  /// The color of the indicator.
  final Color color;

  /// Whether the indicator should light up.
  final bool active;

  /// Whether the widget should be hidden when [active] is false.
  final bool showWhenInactive;

  /// The size of the LED.
  final double? size;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: size,
        child: active || showWhenInactive
            ? ShaderBuilder(
                (context, shader, child) => CustomPaint(
                  painter: _VirtualLedPainter(
                    active: active,
                    color: color,
                    shader: shader,
                  ),
                ),
                assetKey: 'assets/shaders/glow.frag',
              )
            : null,
      );
}

class _VirtualLedPainter extends CustomPainter {
  const _VirtualLedPainter({
    required this.color,
    required this.active,
    required this.shader,
  });
  final Color color;
  final bool active;
  final FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width,
          height: size.height,
        ),
        const Radius.circular(4),
      ),
      Paint()..color = color.darken(30),
    );
    if (active) {
      shader
        ..setFloat(0, size.width)
        ..setFloat(1, size.height)
        ..setFloat(2, color.r)
        ..setFloat(3, color.g)
        ..setFloat(4, color.b)
        ..setFloat(5, color.a);

      canvas.drawCircle(
        size.center(Offset.zero),
        size.shortestSide * 0.875,
        Paint()..shader = shader,
      );
    }
  }

  @override
  bool shouldRepaint(_VirtualLedPainter oldDelegate) =>
      color != oldDelegate.color || active != oldDelegate.active;
}
