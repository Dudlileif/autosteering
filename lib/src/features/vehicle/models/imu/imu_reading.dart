import 'package:autosteering/src/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imu_reading.freezed.dart';
part 'imu_reading.g.dart';

/// A class for storing IMU input values.
@freezed
class ImuReading with _$ImuReading {
  /// A class for storing IMU input values.
  const factory ImuReading({
    /// The time of the reading being received.
    @DateTimeSerializer() required DateTime receiveTime,

    /// The IMU input yaw/bearing from startup.
    @Default(0) num yaw,

    /// The IMU input pitch.
    @Default(0) num pitch,

    /// The IMU input roll.
    @Default(0) num roll,

    /// The IMU input acceleration in the X-axis (lateral).
    @Default(0) num accelerationX,

    /// The IMU input acceleration in the Y-axis (longitudinal).
    @Default(0) num accelerationY,

    /// The IMU input acceleration in the Z-axis (vertical).
    @Default(0) num accelerationZ,

  }) = _ImuReading;

  /// Creates an [ImuReading] object from the [json] map.
  factory ImuReading.fromJson(Map<String, Object?> json) =>
      _$ImuReadingFromJson(json);
}
