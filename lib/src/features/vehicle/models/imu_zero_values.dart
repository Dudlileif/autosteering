import 'package:freezed_annotation/freezed_annotation.dart';

part 'imu_zero_values.freezed.dart';
part 'imu_zero_values.g.dart';

/// A class for the zero values for the IMU in a vehicle.
@freezed
class ImuZeroValues with _$ImuZeroValues {
  /// A class for the zero values for the IMU in a vehicle.
  ///
  /// [bearingZero] should be set when the vehicle is pointing towards north.
  ///
  /// [pitchZero] and [rollZero] should be set when the vehicle is on a
  /// perfectly flat surface. (concrete pad/garage/road etc...)
  const factory ImuZeroValues({
    /// The zero (North) value for the bearing.
    @Default(0) double bearingZero,

    /// The zero level for the pitch.
    @Default(0) double pitchZero,

    /// The zero level for the roll.
    @Default(0) double rollZero,
  }) = _ImuZeroValues;

  /// Creates
  factory ImuZeroValues.fromJson(Map<String, Object?> json) =>
      _$ImuZeroValuesFromJson(json);
}
