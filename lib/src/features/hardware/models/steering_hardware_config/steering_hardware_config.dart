// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

// ignore_for_file: invalid_annotation_target

import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'steering_hardware_config.freezed.dart';
part 'steering_hardware_config.g.dart';

/// A class with string keys for the [SteeringHardwareConfig].
class SteeringHardwareConfigKey {
  /// Key for[SteeringHardwareConfig.invertDirection].
  /// Key for [SteeringHardwareConfig.invertDirection].
  static const invertDirection = 'invertDirection';

  /// Key for [SteeringHardwareConfig.microSteps].
  static const microSteps = 'MICRO_STEPS';

  /// Key for [SteeringHardwareConfig.stepsPerRotation].
  static const stepsPerRotation = 'STEPS_PER_ROT';

  /// Key for [SteeringHardwareConfig.rmsCurrent].
  static const rmsCurrent = 'RMS_CURRENT';

  /// Key for [SteeringHardwareConfig.holdMultiplier].
  static const holdMultiplier = 'hold_multiplier';

  /// Key for [SteeringHardwareConfig.freeWheel].
  static const freeWheel = 'freewheel';

  /// Key for [SteeringHardwareConfig.maxAcceleration].
  static const maxAcceleration = 'AMAX_RPM_S_2';

  /// Key for [SteeringHardwareConfig.maxRPM].
  static const maxRPM = 'VMAX_RPM';

  /// Key for [SteeringHardwareConfig.vStop].
  static const vStop = 'VSTOP';

  /// Key for [SteeringHardwareConfig.vStart].
  static const vStart = 'VSTART';

  /// Key for [SteeringHardwareConfig.tOff].
  static const tOff = 'TOFF';

  /// Key for [SteeringHardwareConfig.stallguardThreshold].
  static const stallguardThreshold = 'SGT';

  /// Key for [SteeringHardwareConfig.stallguardFiltering].
  static const stallguardFiltering = 'sfilt';

  /// Key for [SteeringHardwareConfig.stallguardStop].
  static const stallguardStop = 'sg_stop';

  /// Key for [SteeringHardwareConfig.semin].
  static const semin = 'semin';

  /// Key for [SteeringHardwareConfig.semax].
  static const semax = 'semax';

  /// Key for [SteeringHardwareConfig.coolstepThresholdRPM].
  static const coolstepThresholdRPM = 'TCOOLTHRS_RPM';

  /// Key for [SteeringHardwareConfig.stealthChopThresholdRPM].
  static const stealthChopThresholdRPM = 'TPWMTHRS_RPM';

  /// Key for [SteeringHardwareConfig.chopperMode].
  static const chopperMode = 'chm';

  /// Key for
  /// [SteeringHardwareConfig.highVelocityChopperModeChangeThresholdRPM].
  static const highVelocityChopperModeChangeThresholdRPM = 'THIGH_RPM';

  /// Key for [SteeringHardwareConfig.dcStepThresholdRPM].
  static const dcStepThresholdRPM = 'VDCMIN_RPM';

  /// Key for [SteeringHardwareConfig.fullstepAtHighVelocities].
  static const fullstepAtHighVelocities = 'vhighfs';

  /// Key for [SteeringHardwareConfig.setConstantChopperAtHighVelocities].
  static const setConstantChopperAtHighVelocities = 'vhighchm';

  /// Key for [SteeringHardwareConfig.dcStepLoadMeasurementPulseWidth].
  static const dcStepLoadMeasurementPulseWidth = 'DC_TIME';

  /// Key for [SteeringHardwareConfig.dcStepStallguardSensitivity].
  static const dcStepStallguardSensitivity = 'DC_SG';

  /// Key for [SteeringHardwareConfig.hysteresisStart].
  static const hysteresisStart = 'HSTRT';

  /// Key for [SteeringHardwareConfig.hysteresisEnd].
  static const hysteresisEnd = 'HEND';

  /// Key for [SteeringHardwareConfig.currentHoldDelay].
  static const currentHoldDelay = 'IHOLDDELAY';

  /// Key for [SteeringHardwareConfig.blankTime].
  static const blankTime = 'TBL';

  /// Key for [SteeringHardwareConfig.powerDownTime].
  static const powerDownTime = 'TPOWERDOWN';

  /// Key for [SteeringHardwareConfig.zeroWaitTime].
  static const zeroWaitTime = 'TZEROWAIT';

  /// Key for [SteeringHardwareConfig.enableStealthChop].
  static const enableStealthChop = 'en_pwm_mode';

  /// Key for [SteeringHardwareConfig.automaticCurrentControl].
  static const automaticCurrentControl = 'pwm_autoscale';

  /// Key for [SteeringHardwareConfig.automaticPWMTuning].
  static const automaticPWMTuning = 'pwm_autograd';

  /// Key for [SteeringHardwareConfig.pidP].
  static const pidP = 'pid_P';

  /// Key for [SteeringHardwareConfig.pidI].
  static const pidI = 'pid_I';

  /// Key for [SteeringHardwareConfig.pidD].
  static const pidD = 'pid_D';

  /// Key for [SteeringHardwareConfig.wasMin].
  static const wasMin = 'was_min';

  /// Key for [SteeringHardwareConfig.wasCenter].
  static const wasCenter = 'was_center';

  /// Key for [SteeringHardwareConfig.wasMax].
  static const wasMax = 'was_max';
}

/// An immutable container for handling multiple [SteeringHardwareConfigKey]s
/// in one object.
@immutable
class SteeringHardwareConfigKeysContainer {
  /// An immutable container for handling multiple [SteeringHardwareConfigKey]s
  /// in one object.
  const SteeringHardwareConfigKeysContainer(this.keys);

  /// The [SteeringHardwareConfigKey]s of this.
  final Set<String> keys;

  @override
  int get hashCode => keys.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SteeringHardwareConfigKeysContainer &&
          const SetEquality<String>().equals(keys, other.keys));
}

/// A configuration for a steering wheel motor of a vehicle.
@freezed
class SteeringHardwareConfig with _$SteeringHardwareConfig {
  /// A configuration for a steering wheel motor of a vehicle.
  @Assert(
    '''
    microSteps == 1 ||
    microSteps == 2 ||
    microSteps == 4 ||
    microSteps == 8 ||
    microSteps == 16 ||
    microSteps == 32 ||
    microSteps == 64 ||
    microSteps == 128 ||
    microSteps == 256
    ''',
    'microSteps needs to be a power of 2 up to 256.',
  )
  @Assert(
    'stepsPerRotation==200 || stepsPerRotation==400',
    'stepsPerRotation has to be 200 or 400.',
  )
  @Assert(
    'rmsCurrent>=0 && rmsCurrent<=3000',
    'rmsCurrent should be in range 0 to 3000 mA.',
  )
  @Assert(
    'holdMultiplier>=0 && holdMultiplier<=1',
    'holdMultiplier should be in range 0 to 1.',
  )
  @Assert('maxAcceleration>=0', 'maxAcceleration should be positive.')
  @Assert('maxRPM>=0', 'maxRPM should be positive.')
  @Assert('vStop>=0', 'vStop should be positive.')
  @Assert('vStart>=0', 'vStart should be positive.')
  @Assert('tOff>=0 && tOff<=15', 'tOff should be in range 0 to 15.')
  @Assert('semin>=0 && semin<=15', 'semin should be in range 0 to 15.')
  @Assert(
    'stallguardThreshold>=-64 && stallguardThreshold<=63',
    'stallguardThreshold should be in range -64 to 63.',
  )
  @Assert('semax>=0 && semax<=15', 'semax should be in range 0 to 15.')
  @Assert(
    'coolstepThresholdRPM>=0',
    'coolstepThresholdRPM should be positive.',
  )
  @Assert(
    'stealthChopThresholdRPM>=0',
    'stealthChopThresholdRPM should be positive.',
  )
  @Assert(
    'highVelocityChopperModeChangeThresholdRPM>=0',
    'highVelocityChopperModeChangeThresholdRPM should be positive.',
  )
  @Assert(
    'dcStepThresholdRPM>=0',
    'dcStepThresholdRPM should be positive.',
  )
  @Assert(
    '''dcStepLoadMeasurementPulseWidth>=0 && dcStepLoadMeasurementPulseWidth<=1023''',
    'dcStepLoadMeasurementPulseWidth should be in range 0 to 1023.',
  )
  @Assert(
    'dcStepStallguardSensitivity>=0 && dcStepStallguardSensitivity<=255',
    'dcStepStallguardSensitivity should be in range 0 to 255.',
  )
  @Assert(
    'hysteresisStart>=0 && hysteresisStart<=7',
    'hysteresisStart should be in range 0 to 7.',
  )
  @Assert(
    'hysteresisEnd>=0 && hysteresisEnd<=15',
    'hysteresisEnd should be in range 0 to 15.',
  )
  @Assert(
    'currentHoldDelay>=0 && currentHoldDelay<=15',
    'currentHoldDelay should be in range 0 to 15.',
  )
  @Assert(
    'powerDownTime>=0 && powerDownTime<=255',
    'powerDownTime should be in range 0 to 255 .',
  )
  @Assert(
    'zeroWaitTime>=0 && zeroWaitTime<=65535',
    'zeroWaitTime should be in range 0 to 65535.',
  )
  @Assert(
    'pidP>=0',
    'pidP should be positive.',
  )
  @Assert(
    'pidI>=0',
    'pidI should be positive.',
  )
  @Assert(
    'pidD>=0',
    'pidD should be positive.',
  )
  @Assert(
    'wasMin>=0',
    'wasMin should be positive.',
  )
  @Assert(
    'wasCenter>=0 && wasCenter>wasMin',
    'wasCenter should be positive and larger than wasMin.',
  )
  @Assert(
    'wasMax>=0 && wasMax>wasCenter',
    'wasMax should be positive and larger than wasCenter.',
  )
  const factory SteeringHardwareConfig({
    /// Whether the motor rotation direction should be inverted.
    @JsonKey(name: SteeringHardwareConfigKey.invertDirection)
    @Default(false)
    bool invertDirection,

    /// The number of micro steps to divide one fullstep into.
    @JsonKey(name: SteeringHardwareConfigKey.microSteps)
    @Default(256)
    int microSteps,

    /// The number of fullsteps for one rotation of the motor.
    @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
    @Default(200)
    int stepsPerRotation,

    /// The rated RMS current of the motor.
    @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent)
    @Default(1000)
    int rmsCurrent,

    /// A multiplier for how much current should be applied when holding
    /// position, set to 0 to allow freewheeling.
    @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
    @Default(0)
    double holdMultiplier,

    /// Which mode the motor should be in when holding.
    @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
    @Default(MotorHoldingMode.freewheel)
    MotorHoldingMode freeWheel,

    /// Maximum acceleration in RPM/s^2.
    @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
    @Default(100)
    double maxAcceleration,

    /// Maximum RPM
    @JsonKey(name: SteeringHardwareConfigKey.maxRPM)
    @Default(200)
    double maxRPM,

    /// Stopping velocity, should be higher than [vStart].
    @JsonKey(name: SteeringHardwareConfigKey.vStop) @Default(10) int vStop,

    /// Starting velocity, should be lower than [vStop].
    @JsonKey(name: SteeringHardwareConfigKey.vStart) @Default(0) int vStart,

    /// Off time and driver enable.
    @JsonKey(name: SteeringHardwareConfigKey.tOff) @Default(5) int tOff,

    /// Threshold for detecting a stall.
    @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
    @Default(32)
    int stallguardThreshold,

    /// Whether stall detection should filter over four fullsteps.
    @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
    @Default(false)
    bool stallguardFiltering,

    /// Whether the motor should stop when detecting a stall.
    @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
    @Default(true)
    bool stallguardStop,

    /// When stall reading falls below `32*semin`, the motor current is
    /// increased.
    @JsonKey(name: SteeringHardwareConfigKey.semin) @Default(5) int semin,

    /// When stall reading is equal to or above `32*semax`, the motor current is
    /// decreased to save energy.
    @JsonKey(name: SteeringHardwareConfigKey.semax) @Default(2) int semax,

    /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
    @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
    @Default(10)
    double coolstepThresholdRPM,

    /// Uppper velocity RPM threshold for StealthChop.
    @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
    @Default(40)
    double stealthChopThresholdRPM,

    /// Which stepper chopper mode is used.
    @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
    @Default(ChopperMode.spreadCycle)
    ChopperMode chopperMode,

    /// Lower velocity RPM threshold for switching to a different chopper mode
    /// at high velocities.
    @JsonKey(
      name: SteeringHardwareConfigKey.highVelocityChopperModeChangeThresholdRPM,
    )
    @Default(150)
    double highVelocityChopperModeChangeThresholdRPM,

    /// Lower velocity RPM threhsold for enabling DcStep.
    @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
    @Default(150)
    double dcStepThresholdRPM,

    /// Whether fullstepping should be enabled above
    /// [highVelocityChopperModeChangeThresholdRPM].
    @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
    @Default(false)
    bool fullstepAtHighVelocities,

    /// Whether chopper mode switch to
    /// [ChopperMode.constantTimeOffWithFastDecay] should be done above
    /// [highVelocityChopperModeChangeThresholdRPM].
    @JsonKey(name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
    @Default(false)
    bool setConstantChopperAtHighVelocities,

    /// Reference pulse width for DcStep load measurement.
    @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
    @Default(64)
    int dcStepLoadMeasurementPulseWidth,

    /// Stall detection threshold for DcStep mode.
    @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
    @Default(5)
    int dcStepStallguardSensitivity,

    /// Hysteresis start value.
    @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
    @Default(4)
    int hysteresisStart,

    /// Hysteresis end value.
    @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd)
    @Default(1)
    int hysteresisEnd,

    /// Number of clock cycles until motor powers down after standstill and
    /// [powerDownTime] has expired.
    @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
    @Default(1)
    int currentHoldDelay,

    /// Comparator blank time, number of clock cycles.
    @JsonKey(name: SteeringHardwareConfigKey.blankTime)
    @Default(ComparatorBlankTime.clk24)
    ComparatorBlankTime blankTime,

    /// Power down delay time after standstill.
    @JsonKey(name: SteeringHardwareConfigKey.powerDownTime)
    @Default(1)
    int powerDownTime,

    /// Wait time before powering up after having reached 0 veolcity.
    @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime)
    @Default(1)
    int zeroWaitTime,

    /// Whether StealthChop should enable below [stealthChopThresholdRPM].
    @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
    @Default(false)
    bool enableStealthChop,

    /// Whether PWM amplitude scaling is automatic.
    @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
    @Default(false)
    bool automaticCurrentControl,

    /// Whether automatic tuning of PWM_GRAD is enabled.
    @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
    @Default(false)
    bool automaticPWMTuning,

    /// Proportional gain coefficient for steering.
    @JsonKey(name: SteeringHardwareConfigKey.pidP) @Default(20) double pidP,

    /// Integral gain coefficient for steering.
    @JsonKey(name: SteeringHardwareConfigKey.pidI) @Default(0.13) double pidI,

    /// Derivative gain coefficient for steering.
    @JsonKey(name: SteeringHardwareConfigKey.pidD) @Default(0.06) double pidD,

    /// Minimum reading value for WAS.
    @JsonKey(name: SteeringHardwareConfigKey.wasMin) @Default(250) int wasMin,

    /// Center reading value for WAS.
    @JsonKey(name: SteeringHardwareConfigKey.wasCenter)
    @Default(2000)
    int wasCenter,

    /// Maximum reading value for WAS.
    @JsonKey(name: SteeringHardwareConfigKey.wasMax) @Default(3750) int wasMax,
  }) = _SteeringHardwareConfig;

  /// Private constructor to allow use of methods with freezed models.
  const SteeringHardwareConfig._();

  /// Creates a [SteeringHardwareConfig] object from the [json] object.
  factory SteeringHardwareConfig.fromJson(Map<String, Object?> json) =>
      _$SteeringHardwareConfigFromJson(json);

  /// Parameters for use with a [PidController] in a small separate object.
  PidParameters get pidParameters => PidParameters(p: pidP, i: pidI, d: pidD);

  /// An HTTP header with the parameters corresponding to [keys] for sending a
  /// request to update the motor config on the hardware.
  String httpHeader(Set<String> keys) {
    final json = toJson();
    return keys
        .map((key) {
          var value = json[key];
          if (value == null) {
            return null;
          }
          if (value is bool) {
            value = value ? 1 : 0;
          }
          return '$key=$value';
        })
        .nonNulls
        .join('&');
  }

  /// An HTTP header with all parameters for sending a request to update the
  /// motor config on the hardware.
  String get httpHeaderFull => [
        'invertDirection=${invertDirection ? 1 : 0}',
        'MICRO_STEPS=$microSteps',
        'STEPS_PER_ROT=$stepsPerRotation',
        'RMS_CURRENT=$rmsCurrent',
        'hold_multiplier=$holdMultiplier',
        'freewheel=$freeWheel',
        'AMAX_RPM_S_2=$maxAcceleration',
        'VMAX_RPM=$maxRPM',
        'VSTOP=$vStop',
        'VSTART=$vStart',
        'TOFF=$tOff',
        'SGT=$stallguardThreshold',
        'sg_stop=${stallguardStop ? 1 : 0}',
        'semin=$semin',
        'semax=$semax',
        'TCOOLTHRS_RPM=$coolstepThresholdRPM',
        'TPWMTHRS_RPM=$stealthChopThresholdRPM',
        'chm=${chopperMode.index}',
        '''THIGH_RPM=$highVelocityChopperModeChangeThresholdRPM''',
        'VDCMIN_RPM=$dcStepThresholdRPM',
        'vhighfs=${fullstepAtHighVelocities ? 1 : 0}',
        '''vhighchm=${setConstantChopperAtHighVelocities ? 1 : 0}''',
        'DC_TIME=$dcStepLoadMeasurementPulseWidth',
        'DC_SG=$dcStepStallguardSensitivity',
        'HSTRT=$hysteresisStart',
        'HEND=$hysteresisEnd',
        'IHOLDDELAY=$currentHoldDelay',
        'TBL=${blankTime.index}',
        'TPOWERDONW=$powerDownTime',
        'TZEROWAIT=$zeroWaitTime',
        'en_pwm_mode=${enableStealthChop ? 1 : 0}',
        'pwm_autoscale=${automaticCurrentControl ? 1 : 0}',
        'pwm_autograd=${automaticPWMTuning ? 1 : 0}',
        'pid_P=$pidP',
        'pid_I=$pidI',
        'pid_D=$pidD',
        'was_min=$wasMin',
        'was_center=$wasCenter',
        'was_max=$wasMax',
      ].join('&');
}

/// An enumerator for the choices of chopper mode (chm).
enum ChopperMode {
  /// SpreadCycle, standard mode
  @JsonValue(0)
  spreadCycle,

  ///  Constant off time with fast decay time. Fast decay time is also
  /// terminated when the negative nominal current is reached. Fast decay is
  /// after on time.
  @JsonValue(1)
  constantTimeOffWithFastDecay;
}

/// An enumerator for the choices of motor holdig mode (freewheel).
enum MotorHoldingMode {
  /// Normal operation.
  @JsonValue(0)
  normalOperation,

  /// Freewheel
  @JsonValue(1)
  freewheel,

  /// Passive braking by coil shorted using LS drivers.
  @JsonValue(2)
  passiveBrakeCoilShortLSDrivers,

  /// Passive braking by coil shorted using HS drivers.
  @JsonValue(3)
  passiveBrakeCoilShortHSDrivers;
}

/// An enumerator for the choices of comparator blank time (TBL).
enum ComparatorBlankTime {
  /// 16 clock cycles.
  @JsonValue(0)
  clk16,

  /// 24 clock cycles.
  @JsonValue(1)
  clk24,

  /// 36 clock cycles.
  @JsonValue(2)
  clk36,

  /// 54 clock cycles.
  @JsonValue(3)
  clk54,
}
