part of 'dubins_path.dart';

/// An enumerator class for distinguishing between the different types of
/// Dubins paths.
enum DubinsPathType {
  /// Right - Straight - Right
  rsr(
    DubinsSection.r,
    DubinsSection.s,
    DubinsSection.r,
  ),

  /// Right - Straight - Left
  rsl(
    DubinsSection.r,
    DubinsSection.s,
    DubinsSection.l,
  ),

  /// Right - Left - Right
  rlr(
    DubinsSection.r,
    DubinsSection.l,
    DubinsSection.r,
  ),

  /// Left - Straight - Right
  lsr(
    DubinsSection.l,
    DubinsSection.s,
    DubinsSection.r,
  ),

  /// Left - Straight - Left
  lsl(
    DubinsSection.l,
    DubinsSection.s,
    DubinsSection.l,
  ),

  /// Left - Right - Left
  lrl(
    DubinsSection.l,
    DubinsSection.r,
    DubinsSection.l,
  );

  const DubinsPathType(this.start, this.mid, this.end);

  /// The first section of the path.
  final DubinsSection start;

  /// The middle section of the path.
  final DubinsSection mid;

  /// The final section of the path.
  final DubinsSection end;

  /// A list of the path sections.
  List<DubinsSection> get sections => [start, mid, end];

  /// A list of the path types that have a straight tangent from the start
  /// to the end circle.
  static List<DubinsPathType> get withStraight => [lsl, lsr, rsl, rsr];

  /// A list of the path types that have a third, middle circle connecting the
  /// start and end circles.
  static List<DubinsPathType> get onlyCircles => [lrl, rlr];
}
