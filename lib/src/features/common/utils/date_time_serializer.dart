import 'package:json_annotation/json_annotation.dart';

/// A JSON serializer for [DateTime] to simplify the usage in freezed models.
class DateTimeSerializer implements JsonConverter<DateTime?, String> {
  /// A JSON serializer for [DateTime] to simplify the usage in freezed models.
  const DateTimeSerializer();
  @override
  DateTime? fromJson(String json) => DateTime.tryParse(json);

  @override
  String toJson(DateTime? object) => object?.toIso8601String() ?? 'No time';
}
