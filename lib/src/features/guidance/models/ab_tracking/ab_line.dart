part of 'ab_tracking.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
///
/// The lines are based on [SphericalRhumbLine] and [SphericalGreatCircle].
class ABLine extends ABTracking {
  /// Create an AB-line from the [start] point A and the [end] point B.
  ///
  /// The [width] of the line determines when we should swap to the next line
  /// over, i.e. when the perpendicular distance to the line is larger than
  /// [width]/2.
  ABLine({
    required super.baseLine,
    required super.width,
    super.boundary,
    super.boundaryString,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    super.calculateLinesOnCreation,
  }) : assert(
          baseLine.length == 2,
          'Base line should only have a start and an end point',
        );

  /// Creates an [ABLine] where the [lines] already has been calculated.
  ABLine.preCalculated({
    required super.baseLine,
    required super.width,
    super.boundary,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    Map<int, List<WayPoint>>? lines,
    Iterable<int>? finishedOffsets,
    Iterable<int>? offsetsInsideBoundary,
    super.calculateLinesOnCreation = false,
  }) {
    this.lines.addAll(lines ?? {});
    this.finishedOffsets.addAll(finishedOffsets ?? []);
    if (boundary != null && offsetsInsideBoundary != null) {
      this.offsetsInsideBoundary = SplayTreeSet.from(offsetsInsideBoundary);
    }
  }

  /// Creates an [ABLine] from the [json] object.
  factory ABLine.fromJson(Map<String, dynamic> json) {
    final baseLine = List<Map<String, dynamic>>.from(json['base_line'] as List)
        .map(WayPoint.fromJson)
        .toList();

    final boundary = json['boundary'] != null
        ? Polygon.parse(json['boundary'] as String)
        : null;

    Map<int, List<WayPoint>> getLinesFromMap(Map<String, dynamic> map) {
      final offsets = List<int>.from(map['offsets'] as List);
      final rawPaths = List<List<dynamic>>.from(map['paths'] as List);
      final paths = rawPaths
          .map(
            (path) => path
                .map(
                  (e) => WayPoint.fromJson(Map<String, dynamic>.from(e as Map)),
                )
                .toList(),
          )
          .toList();
      return Map.fromIterables(offsets, paths);
    }

    final lines = json['lines'] != null
        ? getLinesFromMap(Map<String, dynamic>.from(json['lines'] as Map))
        : null;

    final finishedOffsets = json['finished_offsets'] != null
        ? Set<int>.from(json['finished_offsets'] as Iterable)
        : null;

    final offsetsInsideBoundary = json['offsets_inside_boundary'] != null
        ? Set<int>.from(json['offsets_inside_boundary'] as Iterable)
        : null;

    return ABLine.preCalculated(
      baseLine: baseLine,
      boundary: boundary,
      width: json['width'] as double,
      turningRadius: json['turning_radius'] as double? ?? 10,
      turnOffsetMinSkips: json['turn_offset_skips'] as int? ?? 1,
      lines: lines,
      finishedOffsets: finishedOffsets,
      offsetsInsideBoundary: offsetsInsideBoundary,
      calculateLinesOnCreation: json['calculate_lines'] as bool,
    );
  }

  /// Creates a json compatible structure of the object.
  @override
  Map<String, dynamic> toJson() => super.toJson()..['type'] = 'AB Line';
}
