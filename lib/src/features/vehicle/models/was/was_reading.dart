import 'package:autosteering/src/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'was_reading.freezed.dart';
part 'was_reading.g.dart';

/// A class for storing WAS input values.
@freezed
class WasReading with _$WasReading {
  /// A class for storing WAS input values.

  const factory WasReading({
    /// The time of the reading being received.
    @DateTimeSerializer() required DateTime receiveTime,

    /// The discrete value of the sensor reading.
    @Default(0) int value,
  }) = _WasReading;

  /// Creates a [WasReading] object from the [json] map.
  factory WasReading.fromJson(Map<String, Object?> json) =>
      _$WasReadingFromJson(json);
}
