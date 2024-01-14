import 'package:freezed_annotation/freezed_annotation.dart';

part 'motor_config.freezed.dart';
part 'motor_config.g.dart';

/// A configuration for a steering wheel motor of a vehicle.
@freezed
class MotorConfig with _$MotorConfig {
  /// A configuration for a steering wheel motor of a vehicle.
  ///
  /// [invertOutput] will invert the motor rotation direction if enabled.
  /// [maxRPM] is the maximum rotation speed of the motor.
  const factory MotorConfig({
    @Default(false) bool invertOutput,
    @Default(200) int maxRPM,
  }) = _MotorConfig;

  /// Creates a [MotorConfig] object from the [json] object.
  factory MotorConfig.fromJson(Map<String, Object?> json) =>
      _$MotorConfigFromJson(json);
}
