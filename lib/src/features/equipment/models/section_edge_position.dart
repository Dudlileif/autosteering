part of 'section.dart';

/// A class with positions for the left and right edge of a [Section].
class SectionEdgePositions {
  /// A class with positions for the left and right edge of a [Section].
  const SectionEdgePositions({required this.left, required this.right});

  /// Creates a [SectionEdgePositions] object from the [json] object.
  factory SectionEdgePositions.fromJson(Map<String, dynamic> json) =>
      SectionEdgePositions(
        left: Geographic.parse(json['left'] as String),
        right: Geographic.parse(json['right'] as String),
      );

  /// The left edge position of the parent section.
  final Geographic left;

  /// The right edge of the parent section.
  final Geographic right;

  /// Converts the objet to a json compatible structure.
  Map<String, dynamic> toJson() => {
        'left': left.toText(),
        'right': right.toText(),
      };
}
