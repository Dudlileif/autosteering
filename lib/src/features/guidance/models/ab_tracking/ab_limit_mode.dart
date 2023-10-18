/// An enumerator for selecting what should happen when we approach
/// point A or B.
enum ABLimitMode {
  /// The line will continue forever in both directions. No turns will be
  /// placed at the A or B points of the line.
  unlimited,

  /// A turn will be placed at the A and B of the line so that the outermost
  /// part of the turn will be tangential to the line through the A points
  /// or the B points.
  limitedTurnWithin,

  /// A turn will be placed at the A and B points of the line so that the whole
  /// line will be straight and then a turn will be placed after the A or B
  /// points.
  limitedTurnOutside;

  /// A json compatible string for this enumerator.
  String toJson() => name;

  /// Returns the appropriate [ABLimitMode] for the given [json] string
  /// by looking for the corresponding [name].
  ABLimitMode fromJson(String json) =>
      values.firstWhere((element) => element.name == json);
}
