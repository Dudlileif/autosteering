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

import 'package:flutter/material.dart';
import 'package:geobase/geobase.dart';

/// An extended surface area that is displayed at an angle. The area will
/// overflow the screen edges further back to fill more of the screen further
/// ahead.
class PerspectiveWithOverflow extends StatelessWidget {
  /// An extended surface area that is displayed at an angle. The area will
  /// overflow the screen edges further back to fill more of the screen further
  /// ahead.
  ///
  /// The [child] will be displayed on the surface area.
  /// The [perspectiveAngle] dictates how many degrees the surface should be
  /// rotated around the X-axis.
  /// The [heightFactor] and [widthFactor] can be set to make the surface area
  /// larger, but large areas can become expensive, so be careful.
  const PerspectiveWithOverflow({
    required this.child,
    required this.perspectiveAngle,
    this.heightFactor = 1,
    this.widthFactor = 1,
    super.key,
  });

  /// The widget that is displayed on the surface area.
  final Widget child;

  /// How many degrees the surface should be rotated around the X-axis.
  final double perspectiveAngle;

  /// A multiplier for the height of the surface area.
  final double heightFactor;

  /// A multiplier for the width of the surface area.
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Transform(
      filterQuality: FilterQuality.low,
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective narrowing modifier
        ..rotateX(-perspectiveAngle.toRadians()),
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: child,
      ),
    );
  }
}
