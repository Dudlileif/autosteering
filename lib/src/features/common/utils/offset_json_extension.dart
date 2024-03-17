import 'dart:ui';

/// An extension for converting [Offset]s to and from JSON compatible
/// map structures.
extension OffsetJsonExtension on Offset {
  /// Creates an [Offset] from the [json] object.
  static Offset fromJson(Map<String, dynamic> json) =>
      Offset(json['dx'] as double, json['dy'] as double);

  /// Returns a JSON compatible structure of this.
  Map<String, dynamic> toJson() => {'dx': dx, 'dy': dy};
}
