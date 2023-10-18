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
