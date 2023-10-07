import 'package:agopengps_flutter/src/features/vehicle/models/imu/imu_config.dart';
import 'package:agopengps_flutter/src/features/vehicle/models/imu/imu_reading.dart';
import 'package:geobase/geobase.dart';

export 'imu_config.dart';
export 'imu_reading.dart';
export 'imu_zero_values.dart';

/// An object representing an IMU (Intertial measurement unit) in a vehicle.
///
/// It contains an [ImuConfig] for configuring the usage of it and the latest
/// [ImuReading] from the hardware sensor.
class Imu {
  /// An object representing an IMU (Intertial measurement unit) in a vehicle.
  ///
  /// [config] describes how to use the [reading] from the sensor.
  Imu({
    ImuConfig? config,
    ImuReading? reading,
  })  : config = config ?? const ImuConfig(),
        reading = reading ?? ImuReading(receiveTime: DateTime.now());

  /// The configuration for the IMU sensor.
  ImuConfig config;

  /// The latest reading from the hardware sensor.
  ImuReading reading;

  /// The bearing reading accounted for [config.zeroValues.bearingZero].
  double get bearing =>
      ((reading.yawFromStartup - config.zeroValues.bearingZero) *
              switch (config.invertYaw) {
                true => -1,
                false => 1,
              })
          .toDouble()
          .wrap360();

  /// The pitch reading accounted for [config.zeroValues.pitchZero].
  double get pitch =>
      switch (config.swapPitchAndRoll) {
        false => (reading.pitch - config.zeroValues.pitchZero).clamp(-90, 90),
        true => (reading.roll - config.zeroValues.rollZero).clamp(-180, 180)
      } *
      switch (config.invertPitch) {
        true => -1,
        false => 1,
      } *
      config.pitchGain;

  /// The roll reading accounted for [config.zeroValues.rollZero].
  double get roll =>
      switch (config.swapPitchAndRoll) {
        false => (reading.roll - config.zeroValues.rollZero).clamp(-180, 180),
        true => (reading.pitch - config.zeroValues.pitchZero).clamp(-90, 90)
      } *
      switch (config.invertRoll) {
        true => -1,
        false => 1,
      } *
      config.rollGain;

  /// Sets the [config] zero values for pitch and roll to the current to
  /// [pitchZero] and [rollZero] if given.
  void setPitchAndRollZeroTo({num? pitchZero, num? rollZero}) =>
      config = config.copyWith(
        zeroValues: config.zeroValues.copyWith(
          pitchZero: pitchZero ?? config.zeroValues.pitchZero,
          rollZero: rollZero ?? config.zeroValues.rollZero,
        ),
      );

  /// Sets the [config] zero value for bearing to [bearingZero].
  void setBearingZeroTo(num bearingZero) => config = config.copyWith(
        zeroValues: config.zeroValues.copyWith(bearingZero: bearingZero),
      );

  /// Sets the [config] zero values for pitch and roll to the current [reading]
  /// values.
  void setPitchAndRollZeroToCurrentReading() =>
      setPitchAndRollZeroTo(pitchZero: reading.pitch, rollZero: reading.roll);

  /// Sets the [config] zero values for pitch and roll to the current [reading]
  /// values.
  void setBearingZeroToCurrentReading() =>
      setBearingZeroTo(reading.yawFromStartup);
}
