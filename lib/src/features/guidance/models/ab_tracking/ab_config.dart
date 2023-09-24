import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:equatable/equatable.dart';

/// A configuration class for setting parameters of an [ABTracking] object.
class ABConfig extends Equatable {
  /// A configuration class for setting parameters of an [ABTracking] object.
  const ABConfig({
    required this.width,
    required this.turningRadius,
    required this.turnOffsetMinSkips,
    required this.snapToClosestLine,
    required this.offsetOppositeTurn,
    required this.limitMode,
  });

  /// The width between the lines/curves.
  final double width;

  /// How many offsets we should skip to the next line.
  final int turnOffsetMinSkips;

  /// The minimum turning radius of any turn between lines.
  final double turningRadius;

  /// Whether the offset should auto snap to the closest line/curve.
  final bool snapToClosestLine;

  /// Turn the other direction at the end of the line/curve.
  final bool offsetOppositeTurn;

  /// Which limit mode should apply for the end of the lines/curves.
  final ABLimitMode limitMode;

  @override
  List<Object?> get props => [
        width,
        turningRadius,
        turnOffsetMinSkips,
        snapToClosestLine,
        offsetOppositeTurn,
        limitMode,
      ];
}
