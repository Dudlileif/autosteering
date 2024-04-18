// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steering_hardware_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SteeringHardwareConfigImpl _$$SteeringHardwareConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$SteeringHardwareConfigImpl(
      invertDirection: json['invertDirection'] as bool? ?? false,
      microSteps: json['MICRO_STEPS'] as int? ?? 256,
      stepsPerRotation: json['STEPS_PER_ROT'] as int? ?? 200,
      rmsCurrent: json['RMS_CURRENT'] as int? ?? 1000,
      holdMultiplier: (json['hold_multiplier'] as num?)?.toDouble() ?? 0,
      freeWheel:
          $enumDecodeNullable(_$MotorHoldingModeEnumMap, json['freewheel']) ??
              MotorHoldingMode.freewheel,
      maxAcceleration: (json['AMAX_RPM_S_2'] as num?)?.toDouble() ?? 100,
      maxRPM: (json['VMAX_RPM'] as num?)?.toDouble() ?? 200,
      vStop: json['VSTOP'] as int? ?? 10,
      vStart: json['VSTART'] as int? ?? 0,
      tOff: json['TOFF'] as int? ?? 5,
      stallguardThreshold: json['SGT'] as int? ?? 32,
      stallguardFiltering: json['sfilt'] as bool? ?? false,
      stallguardStop: json['sg_stop'] as bool? ?? true,
      semin: json['semin'] as int? ?? 5,
      semax: json['semax'] as int? ?? 2,
      coolstepThresholdRPM: (json['TCOOLTHRS_RPM'] as num?)?.toDouble() ?? 10,
      stealthChopThresholdRPM: (json['TPWMTHRS_RPM'] as num?)?.toDouble() ?? 40,
      chopperMode: $enumDecodeNullable(_$ChopperModeEnumMap, json['chm']) ??
          ChopperMode.spreadCycle,
      highVelocityChopperModeChangeThresholdRPM:
          (json['THIGH_RPM'] as num?)?.toDouble() ?? 150,
      dcStepThresholdRPM: (json['VDCMIN_RPM'] as num?)?.toDouble() ?? 150,
      fullstepAtHighVelocities: json['vhighfs'] as bool? ?? false,
      setConstantChopperAtHighVelocities: json['vhighchm'] as bool? ?? false,
      dcStepLoadMeasurementPulseWidth: json['DC_TIME'] as int? ?? 64,
      dcStepStallguardSensitivity: json['DC_SG'] as int? ?? 5,
      hystersisStart: json['HSTRT'] as int? ?? 4,
      hystersisEnd: json['HEND'] as int? ?? 1,
      currentHoldDelay: json['IHOLDDELAY'] as int? ?? 1,
      blankTime:
          $enumDecodeNullable(_$ComparatorBlankTimeEnumMap, json['TBL']) ??
              ComparatorBlankTime.clk24,
      powerDownTime: json['TPOWERDOWN'] as int? ?? 1,
      zeroWaitTime: json['TZEROWAIT'] as int? ?? 1,
      enableStealthChop: json['en_pwm_mode'] as bool? ?? false,
      automaticCurrentControl: json['pwm_autoscale'] as bool? ?? false,
      automaticPWMTuning: json['pwm_autograd'] as bool? ?? false,
      pidP: (json['pid_P'] as num?)?.toDouble() ?? 20,
      pidI: (json['pid_I'] as num?)?.toDouble() ?? 0.13,
      pidD: (json['pid_D'] as num?)?.toDouble() ?? 0.06,
      wasMin: json['was_min'] as int? ?? 250,
      wasCenter: json['was_center'] as int? ?? 2000,
      wasMax: json['was_max'] as int? ?? 3750,
    );

Map<String, dynamic> _$$SteeringHardwareConfigImplToJson(
        _$SteeringHardwareConfigImpl instance) =>
    <String, dynamic>{
      'invertDirection': instance.invertDirection,
      'MICRO_STEPS': instance.microSteps,
      'STEPS_PER_ROT': instance.stepsPerRotation,
      'RMS_CURRENT': instance.rmsCurrent,
      'hold_multiplier': instance.holdMultiplier,
      'freewheel': _$MotorHoldingModeEnumMap[instance.freeWheel]!,
      'AMAX_RPM_S_2': instance.maxAcceleration,
      'VMAX_RPM': instance.maxRPM,
      'VSTOP': instance.vStop,
      'VSTART': instance.vStart,
      'TOFF': instance.tOff,
      'SGT': instance.stallguardThreshold,
      'sfilt': instance.stallguardFiltering,
      'sg_stop': instance.stallguardStop,
      'semin': instance.semin,
      'semax': instance.semax,
      'TCOOLTHRS_RPM': instance.coolstepThresholdRPM,
      'TPWMTHRS_RPM': instance.stealthChopThresholdRPM,
      'chm': _$ChopperModeEnumMap[instance.chopperMode]!,
      'THIGH_RPM': instance.highVelocityChopperModeChangeThresholdRPM,
      'VDCMIN_RPM': instance.dcStepThresholdRPM,
      'vhighfs': instance.fullstepAtHighVelocities,
      'vhighchm': instance.setConstantChopperAtHighVelocities,
      'DC_TIME': instance.dcStepLoadMeasurementPulseWidth,
      'DC_SG': instance.dcStepStallguardSensitivity,
      'HSTRT': instance.hystersisStart,
      'HEND': instance.hystersisEnd,
      'IHOLDDELAY': instance.currentHoldDelay,
      'TBL': _$ComparatorBlankTimeEnumMap[instance.blankTime]!,
      'TPOWERDOWN': instance.powerDownTime,
      'TZEROWAIT': instance.zeroWaitTime,
      'en_pwm_mode': instance.enableStealthChop,
      'pwm_autoscale': instance.automaticCurrentControl,
      'pwm_autograd': instance.automaticPWMTuning,
      'pid_P': instance.pidP,
      'pid_I': instance.pidI,
      'pid_D': instance.pidD,
      'was_min': instance.wasMin,
      'was_center': instance.wasCenter,
      'was_max': instance.wasMax,
    };

const _$MotorHoldingModeEnumMap = {
  MotorHoldingMode.normalOperation: 0,
  MotorHoldingMode.freewheel: 1,
  MotorHoldingMode.passiveBrakeCoilShortLSDrivers: 2,
  MotorHoldingMode.passiveBrakeCoilShortHSDrivers: 3,
};

const _$ChopperModeEnumMap = {
  ChopperMode.spreadCycle: 0,
  ChopperMode.constantTimeOffWithFastDecay: 1,
};

const _$ComparatorBlankTimeEnumMap = {
  ComparatorBlankTime.clk16: 0,
  ComparatorBlankTime.clk24: 1,
  ComparatorBlankTime.clk36: 2,
  ComparatorBlankTime.clk54: 3,
};
