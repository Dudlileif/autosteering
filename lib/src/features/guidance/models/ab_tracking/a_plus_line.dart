part of 'ab_tracking.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to create a base line and then create parallel lines.
///
/// The lines are based on [SphericalRhumbLine] and [SphericalGreatCircle].
///
/// This class is a slightly altered version of the [ABLine] class, but only
/// uses the starting [WayPoint], and then calculates the endpoint 1 km ahead
/// in the bearing of the [start] point.
class APlusLine extends ABLine {
  /// A class for creating and tracking straight lines by using the bearing
  /// from the [start] point to create a base line and then create parallel
  /// lines.
  APlusLine({
    required WayPoint start,
    required super.width,
    super.boundary,
    super.boundaryString,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    super.calculateLinesOnCreation,
  }) : super(
          baseLine: [
            start,
            start.moveRhumb(distance: 1000),
          ],
        );

  /// Creates an [APlusLine] where the [lines] already has been calculated.
  APlusLine.preCalculated({
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

  /// Creates an [APlusLine] from the [json] object.
  factory APlusLine.fromJson(Map<String, dynamic> json) {
    final baseLine = <WayPoint>[];
    if (json.containsKey('base_line')) {
      baseLine.addAll(
        List<Map<String, dynamic>>.from(json['base_line'] as List)
            .map(WayPoint.fromJson),
      );
    } else if (json.containsKey('start')) {
      final start =
          WayPoint.fromJson(Map<String, dynamic>.from(json['start'] as Map));

      baseLine.addAll([
        start,
        start.moveRhumb(distance: 1000),
      ]);
    }
    if (baseLine.length < 2) {
      throw Exception('The base line was not found.');
    }

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

    return APlusLine.preCalculated(
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
  Map<String, dynamic> toJson() => super.toJson()..['type'] = 'A+ Line';
}
