import 'package:autosteering/src/features/vehicle/models/imu/imu_config.dart';
import 'package:autosteering/src/features/vehicle/models/imu/imu_reading.dart';
import 'package:collection/collection.dart';
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
    List<ImuReading>? readings,
  })  : config = config ?? const ImuConfig(),
        readings = readings ?? [ImuReading(receiveTime: DateTime.now())];

  /// The configuration for the IMU sensor.
  ImuConfig config;

  /// The latest reading from the hardware sensor.
  List<ImuReading> readings;

  /// Whether the bearing is set for the IMU.
  /// Should be set to true after a GNSS bearing is used to update the
  /// [config.zeroValues.bearingZero].
  bool bearingIsSet = false;

  /// The latest reading from the hardware sensor, accounted for the
  /// [ImuConfig.delayReadings] to match the GNSS fix time.
  ///
  /// Attempts to find the latest reading that arrived more than
  /// [ImuConfig.delayReadings] milliseconds ago, otherwise the latest reading
  /// is returned.
  ImuReading get reading =>
      readings.firstWhereOrNull(
        (element) =>
            DateTime.now().difference(element.receiveTime).inMilliseconds >
            config.delayReadings,
      ) ??
      readings.first;

  /// The bearing reading accounted for [config.zeroValues.bearingZero].
  double? get bearing => switch (bearingIsSet) {
        true => ((reading.yaw - config.zeroValues.bearingZero) *
                switch (config.invertYaw) {
                  true => -1,
                  false => 1,
                })
            .toDouble()
            .wrap360(),
        false => null
      };

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

  /// Adds the [newReading] to [readings] and removes old readings past the
  /// length of 10.
  void addReading(ImuReading newReading) {
    readings.insert(0, newReading);
    while (readings.length > 10) {
      readings.removeLast();
    }
  }

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
  void setBearingZeroToCurrentReading() => setBearingZeroTo(reading.yaw);
}
