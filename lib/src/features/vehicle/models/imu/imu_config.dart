import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'imu_config.freezed.dart';
part 'imu_config.g.dart';

/// A configuration class fro how the vehicle should use the IMU and
/// zero values for the axes.
@freezed
class ImuConfig with _$ImuConfig {
  /// A configuration class fro how the vehicle should use the IMU and
  /// zero values for the axes.
  ///
  /// [usePitchAndRoll] is whether the vehicle should take into account pitch
  /// and roll when representing its position.
  ///
  /// [swapPitchAndRoll] is whether the pich and roll axes should be swapped.
  ///
  /// [zeroValues] are the zero values for each of the axes of the IMU.
  ///
  /// [useYaw] is whether the vehicle's yaw should be corrected by the
  /// yaw from the IMU.
  ///
  /// [invertYaw] is whether the yaw axis should be inverted.
  ///
  /// [invertPitch] is whether the pich axis should be inverted.
  ///
  /// [invertRoll] is whether the roll axis should be inverted.
  ///
  /// [pitchGain] and [rollGain] are multipliers for how much their respective
  /// readings should be amplifier/reduces. Defaults to 1, i.e. no
  /// amplification.
  ///
  /// [delayReadings] is how many milliseconds we should delay the readings
  /// to match the GNSS fix time.
  const factory ImuConfig({
    /// Whether the vehicle should take into account pitch and roll when
    /// representing its position.
    @Default(true) bool usePitchAndRoll,

    /// Whether the pich and roll axes should be swapped.
    @Default(false) bool swapPitchAndRoll,

    /// The zero values for the different axes of the IMU.
    @Default(ImuZeroValues()) ImuZeroValues zeroValues,

    /// Whether the vehicle's bearing should be the one from the IMU.
    @Default(false) bool useYaw,

    /// Whether the bearing axis should be inverted.
    @Default(false) bool invertYaw,

    /// Whether the pitch axis should be inverted.
    @Default(false) bool invertPitch,

    /// Whether the roll axis should be inverted.
    @Default(false) bool invertRoll,

    /// A multiplier for how much the pitch reading should be amplified/reduced.
    @Default(1) double pitchGain,

    /// A multiplier for how much the pitch reading should be amplified/reduced.
    @Default(1) double rollGain,

    /// How many milliseconds we should delay the readings to match the GNSS fix
    /// time.
    @Default(30) int delayReadings,
  }) = _ImuConfig;

  /// Creates an [ImuConfig] from the [json] object.
  factory ImuConfig.fromJson(Map<String, Object?> json) =>
      _$ImuConfigFromJson(json);
}
