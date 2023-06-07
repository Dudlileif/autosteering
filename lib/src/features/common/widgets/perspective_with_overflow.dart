import 'package:flutter/material.dart';

/// An extended surface area that is displayed at an angle. The area will
/// overflow the screen edges further back to fill more of the screen further
/// ahead.
class PerspectiveWithOverflow extends StatelessWidget {
  const PerspectiveWithOverflow({
    required this.child,
    required this.perspectiveAngle,
    this.heightFactor = 1,
    this.widthFactor = 1,
    super.key,
  });

  final Widget child;
  final double perspectiveAngle;
  final double heightFactor;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective narrowing modifier
        ..rotateX(-perspectiveAngle),
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: child,
      ),
    );
  }
}
