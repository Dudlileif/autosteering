import 'package:freezed_annotation/freezed_annotation.dart';

part 'was_config.freezed.dart';
part 'was_config.g.dart';

/// A configuration for the Wheel Angle Sensor of a vehicle.
@freezed
class WasConfig with _$WasConfig {
  /// A configuration for the Wheel Angle Sensor of a vehicle.
  const factory WasConfig({
    @Default(false) bool invertInput,
    @Default(12) int bits,
    @Default(0) int min,
    @Default(4095) int max,
    @Default(2047) int center,
  }) = _WasConfig;

  /// Creates a [WasConfig] from the [json] object.
  factory WasConfig.fromJson(Map<String, Object?> json) =>
      _$WasConfigFromJson(json);
}
