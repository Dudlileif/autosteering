// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steering_hardware_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SteeringHardwareConfig _$SteeringHardwareConfigFromJson(
    Map<String, dynamic> json) {
  return _SteeringHardwareConfig.fromJson(json);
}

/// @nodoc
mixin _$SteeringHardwareConfig {
  /// Whehter the motor rotation direction should be inverted.
  @JsonKey(name: 'invertDirection')
  bool get invertDirection => throw _privateConstructorUsedError;

  /// The number of micro steps to divide one fullstep into.
  @JsonKey(name: 'MICRO_STEPS')
  int get microSteps => throw _privateConstructorUsedError;

  /// The number of fullsteps for one rotation of the motor.
  @JsonKey(name: 'STEPS_PER_ROT')
  int get stepsPerRotation => throw _privateConstructorUsedError;

  /// The rated RMS current of the motor.
  @JsonKey(name: 'RMS_CURRENT')
  int get rmsCurrent => throw _privateConstructorUsedError;

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @JsonKey(name: 'hold_multiplier')
  double get holdMultiplier => throw _privateConstructorUsedError;

  /// Which mode the motor should be in when holding.
  @JsonKey(name: 'freewheel')
  MotorHoldingMode get freeWheel => throw _privateConstructorUsedError;

  /// Maximum acceleration in RPM/s^2.
  @JsonKey(name: 'AMAX_RPM_S_2')
  double get maxAcceleration => throw _privateConstructorUsedError;

  /// Maximum RPM
  @JsonKey(name: 'VMAX_RPM')
  double get maxRPM => throw _privateConstructorUsedError;

  /// Stopping velocity, should be higher than [vStart].
  @JsonKey(name: 'VSTOP')
  int get vStop => throw _privateConstructorUsedError;

  /// Starting velocity, should be lower than [vStop].
  @JsonKey(name: 'VSTART')
  int get vStart => throw _privateConstructorUsedError;

  /// Off time and driver enable.
  @JsonKey(name: 'TOFF')
  int get tOff => throw _privateConstructorUsedError;

  /// Threshold for detecting a stall.
  @JsonKey(name: 'SGT')
  int get stallguardThreshold => throw _privateConstructorUsedError;

  /// Whether stall detection should filter over four fullsteps.
  @JsonKey(name: 'sfilt')
  bool get stallguardFiltering => throw _privateConstructorUsedError;

  /// Whether the motor should stop when detecting a stall.
  @JsonKey(name: 'sg_stop')
  bool get stallguardStop => throw _privateConstructorUsedError;

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @JsonKey(name: 'semin')
  int get semin => throw _privateConstructorUsedError;

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @JsonKey(name: 'semax')
  int get semax => throw _privateConstructorUsedError;

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @JsonKey(name: 'TCOOLTHRS_RPM')
  double get coolstepThresholdRPM => throw _privateConstructorUsedError;

  /// Uppper velocity RPM threshold for StealthChop.
  @JsonKey(name: 'TPWMTHRS_RPM')
  double get stealthChopThresholdRPM => throw _privateConstructorUsedError;

  /// Which stepper chopper mode is used.
  @JsonKey(name: 'chm')
  ChopperMode get chopperMode => throw _privateConstructorUsedError;

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @JsonKey(name: 'THIGH_RPM')
  double get highVelocityChopperModeChangeThresholdRPM =>
      throw _privateConstructorUsedError;

  /// Lower velocity RPM threhsold for enabling DcStep.
  @JsonKey(name: 'VDCMIN_RPM')
  double get dcStepThresholdRPM => throw _privateConstructorUsedError;

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: 'vhighfs')
  bool get fullstepAtHighVelocities => throw _privateConstructorUsedError;

  /// Whether chopper mode switch to
  /// [ChopperMode.constantTimeOffWithFastDecay] should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: 'vhighchm')
  bool get setConstantChopperAtHighVelocities =>
      throw _privateConstructorUsedError;

  /// Reference pulse width for DcStep load measurement.
  @JsonKey(name: 'DC_TIME')
  int get dcStepLoadMeasurementPulseWidth => throw _privateConstructorUsedError;

  /// Stall detection threshold for DcStep mode.
  @JsonKey(name: 'DC_SG')
  int get dcStepStallguardSensitivity => throw _privateConstructorUsedError;

  /// Hysteresis start value.
  @JsonKey(name: 'HSTRT')
  int get hystersisStart => throw _privateConstructorUsedError;

  /// Hysteresis end value.
  @JsonKey(name: 'HEND')
  int get hystersisEnd => throw _privateConstructorUsedError;

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @JsonKey(name: 'IHOLDDELAY')
  int get currentHoldDelay => throw _privateConstructorUsedError;

  /// Comparator blank time, number of clock cycles.
  @JsonKey(name: 'TBL')
  ComparatorBlankTime get blankTime => throw _privateConstructorUsedError;

  /// Power down delay time after standstill.
  @JsonKey(name: 'TPOWERDOWN')
  int get powerDownTime => throw _privateConstructorUsedError;

  /// Wait time before powering up after having reached 0 veolcity.
  @JsonKey(name: 'TZEROWAIT')
  int get zeroWaitTime => throw _privateConstructorUsedError;

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @JsonKey(name: 'en_pwm_mode')
  bool get enableStealthChop => throw _privateConstructorUsedError;

  /// Whether PWM amplitude scaling is automatic.
  @JsonKey(name: 'pwm_autoscale')
  bool get automaticCurrentControl => throw _privateConstructorUsedError;

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @JsonKey(name: 'pwm_autograd')
  bool get automaticPWMTuning => throw _privateConstructorUsedError;

  /// Proportional gain coefficient for steering.
  @JsonKey(name: 'pid_P')
  double get pidP => throw _privateConstructorUsedError;

  /// Integral gain coefficient for steering.
  @JsonKey(name: 'pid_I')
  double get pidI => throw _privateConstructorUsedError;

  /// Derivative gain coefficient for steering.
  @JsonKey(name: 'pid_D')
  double get pidD => throw _privateConstructorUsedError;

  /// Minimum reading value for WAS.
  @JsonKey(name: 'was_min')
  int get wasMin => throw _privateConstructorUsedError;

  /// Center reading value for WAS.
  @JsonKey(name: 'was_center')
  int get wasCenter => throw _privateConstructorUsedError;

  /// Maximum reading value for WAS.
  @JsonKey(name: 'was_max')
  int get wasMax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SteeringHardwareConfigCopyWith<SteeringHardwareConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SteeringHardwareConfigCopyWith<$Res> {
  factory $SteeringHardwareConfigCopyWith(SteeringHardwareConfig value,
          $Res Function(SteeringHardwareConfig) then) =
      _$SteeringHardwareConfigCopyWithImpl<$Res, SteeringHardwareConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invertDirection') bool invertDirection,
      @JsonKey(name: 'MICRO_STEPS') int microSteps,
      @JsonKey(name: 'STEPS_PER_ROT') int stepsPerRotation,
      @JsonKey(name: 'RMS_CURRENT') int rmsCurrent,
      @JsonKey(name: 'hold_multiplier') double holdMultiplier,
      @JsonKey(name: 'freewheel') MotorHoldingMode freeWheel,
      @JsonKey(name: 'AMAX_RPM_S_2') double maxAcceleration,
      @JsonKey(name: 'VMAX_RPM') double maxRPM,
      @JsonKey(name: 'VSTOP') int vStop,
      @JsonKey(name: 'VSTART') int vStart,
      @JsonKey(name: 'TOFF') int tOff,
      @JsonKey(name: 'SGT') int stallguardThreshold,
      @JsonKey(name: 'sfilt') bool stallguardFiltering,
      @JsonKey(name: 'sg_stop') bool stallguardStop,
      @JsonKey(name: 'semin') int semin,
      @JsonKey(name: 'semax') int semax,
      @JsonKey(name: 'TCOOLTHRS_RPM') double coolstepThresholdRPM,
      @JsonKey(name: 'TPWMTHRS_RPM') double stealthChopThresholdRPM,
      @JsonKey(name: 'chm') ChopperMode chopperMode,
      @JsonKey(name: 'THIGH_RPM')
      double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: 'VDCMIN_RPM') double dcStepThresholdRPM,
      @JsonKey(name: 'vhighfs') bool fullstepAtHighVelocities,
      @JsonKey(name: 'vhighchm') bool setConstantChopperAtHighVelocities,
      @JsonKey(name: 'DC_TIME') int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: 'DC_SG') int dcStepStallguardSensitivity,
      @JsonKey(name: 'HSTRT') int hystersisStart,
      @JsonKey(name: 'HEND') int hystersisEnd,
      @JsonKey(name: 'IHOLDDELAY') int currentHoldDelay,
      @JsonKey(name: 'TBL') ComparatorBlankTime blankTime,
      @JsonKey(name: 'TPOWERDOWN') int powerDownTime,
      @JsonKey(name: 'TZEROWAIT') int zeroWaitTime,
      @JsonKey(name: 'en_pwm_mode') bool enableStealthChop,
      @JsonKey(name: 'pwm_autoscale') bool automaticCurrentControl,
      @JsonKey(name: 'pwm_autograd') bool automaticPWMTuning,
      @JsonKey(name: 'pid_P') double pidP,
      @JsonKey(name: 'pid_I') double pidI,
      @JsonKey(name: 'pid_D') double pidD,
      @JsonKey(name: 'was_min') int wasMin,
      @JsonKey(name: 'was_center') int wasCenter,
      @JsonKey(name: 'was_max') int wasMax});
}

/// @nodoc
class _$SteeringHardwareConfigCopyWithImpl<$Res,
        $Val extends SteeringHardwareConfig>
    implements $SteeringHardwareConfigCopyWith<$Res> {
  _$SteeringHardwareConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertDirection = null,
    Object? microSteps = null,
    Object? stepsPerRotation = null,
    Object? rmsCurrent = null,
    Object? holdMultiplier = null,
    Object? freeWheel = null,
    Object? maxAcceleration = null,
    Object? maxRPM = null,
    Object? vStop = null,
    Object? vStart = null,
    Object? tOff = null,
    Object? stallguardThreshold = null,
    Object? stallguardFiltering = null,
    Object? stallguardStop = null,
    Object? semin = null,
    Object? semax = null,
    Object? coolstepThresholdRPM = null,
    Object? stealthChopThresholdRPM = null,
    Object? chopperMode = null,
    Object? highVelocityChopperModeChangeThresholdRPM = null,
    Object? dcStepThresholdRPM = null,
    Object? fullstepAtHighVelocities = null,
    Object? setConstantChopperAtHighVelocities = null,
    Object? dcStepLoadMeasurementPulseWidth = null,
    Object? dcStepStallguardSensitivity = null,
    Object? hystersisStart = null,
    Object? hystersisEnd = null,
    Object? currentHoldDelay = null,
    Object? blankTime = null,
    Object? powerDownTime = null,
    Object? zeroWaitTime = null,
    Object? enableStealthChop = null,
    Object? automaticCurrentControl = null,
    Object? automaticPWMTuning = null,
    Object? pidP = null,
    Object? pidI = null,
    Object? pidD = null,
    Object? wasMin = null,
    Object? wasCenter = null,
    Object? wasMax = null,
  }) {
    return _then(_value.copyWith(
      invertDirection: null == invertDirection
          ? _value.invertDirection
          : invertDirection // ignore: cast_nullable_to_non_nullable
              as bool,
      microSteps: null == microSteps
          ? _value.microSteps
          : microSteps // ignore: cast_nullable_to_non_nullable
              as int,
      stepsPerRotation: null == stepsPerRotation
          ? _value.stepsPerRotation
          : stepsPerRotation // ignore: cast_nullable_to_non_nullable
              as int,
      rmsCurrent: null == rmsCurrent
          ? _value.rmsCurrent
          : rmsCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      holdMultiplier: null == holdMultiplier
          ? _value.holdMultiplier
          : holdMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      freeWheel: null == freeWheel
          ? _value.freeWheel
          : freeWheel // ignore: cast_nullable_to_non_nullable
              as MotorHoldingMode,
      maxAcceleration: null == maxAcceleration
          ? _value.maxAcceleration
          : maxAcceleration // ignore: cast_nullable_to_non_nullable
              as double,
      maxRPM: null == maxRPM
          ? _value.maxRPM
          : maxRPM // ignore: cast_nullable_to_non_nullable
              as double,
      vStop: null == vStop
          ? _value.vStop
          : vStop // ignore: cast_nullable_to_non_nullable
              as int,
      vStart: null == vStart
          ? _value.vStart
          : vStart // ignore: cast_nullable_to_non_nullable
              as int,
      tOff: null == tOff
          ? _value.tOff
          : tOff // ignore: cast_nullable_to_non_nullable
              as int,
      stallguardThreshold: null == stallguardThreshold
          ? _value.stallguardThreshold
          : stallguardThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      stallguardFiltering: null == stallguardFiltering
          ? _value.stallguardFiltering
          : stallguardFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      stallguardStop: null == stallguardStop
          ? _value.stallguardStop
          : stallguardStop // ignore: cast_nullable_to_non_nullable
              as bool,
      semin: null == semin
          ? _value.semin
          : semin // ignore: cast_nullable_to_non_nullable
              as int,
      semax: null == semax
          ? _value.semax
          : semax // ignore: cast_nullable_to_non_nullable
              as int,
      coolstepThresholdRPM: null == coolstepThresholdRPM
          ? _value.coolstepThresholdRPM
          : coolstepThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      stealthChopThresholdRPM: null == stealthChopThresholdRPM
          ? _value.stealthChopThresholdRPM
          : stealthChopThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      chopperMode: null == chopperMode
          ? _value.chopperMode
          : chopperMode // ignore: cast_nullable_to_non_nullable
              as ChopperMode,
      highVelocityChopperModeChangeThresholdRPM: null ==
              highVelocityChopperModeChangeThresholdRPM
          ? _value.highVelocityChopperModeChangeThresholdRPM
          : highVelocityChopperModeChangeThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      dcStepThresholdRPM: null == dcStepThresholdRPM
          ? _value.dcStepThresholdRPM
          : dcStepThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      fullstepAtHighVelocities: null == fullstepAtHighVelocities
          ? _value.fullstepAtHighVelocities
          : fullstepAtHighVelocities // ignore: cast_nullable_to_non_nullable
              as bool,
      setConstantChopperAtHighVelocities: null ==
              setConstantChopperAtHighVelocities
          ? _value.setConstantChopperAtHighVelocities
          : setConstantChopperAtHighVelocities // ignore: cast_nullable_to_non_nullable
              as bool,
      dcStepLoadMeasurementPulseWidth: null == dcStepLoadMeasurementPulseWidth
          ? _value.dcStepLoadMeasurementPulseWidth
          : dcStepLoadMeasurementPulseWidth // ignore: cast_nullable_to_non_nullable
              as int,
      dcStepStallguardSensitivity: null == dcStepStallguardSensitivity
          ? _value.dcStepStallguardSensitivity
          : dcStepStallguardSensitivity // ignore: cast_nullable_to_non_nullable
              as int,
      hystersisStart: null == hystersisStart
          ? _value.hystersisStart
          : hystersisStart // ignore: cast_nullable_to_non_nullable
              as int,
      hystersisEnd: null == hystersisEnd
          ? _value.hystersisEnd
          : hystersisEnd // ignore: cast_nullable_to_non_nullable
              as int,
      currentHoldDelay: null == currentHoldDelay
          ? _value.currentHoldDelay
          : currentHoldDelay // ignore: cast_nullable_to_non_nullable
              as int,
      blankTime: null == blankTime
          ? _value.blankTime
          : blankTime // ignore: cast_nullable_to_non_nullable
              as ComparatorBlankTime,
      powerDownTime: null == powerDownTime
          ? _value.powerDownTime
          : powerDownTime // ignore: cast_nullable_to_non_nullable
              as int,
      zeroWaitTime: null == zeroWaitTime
          ? _value.zeroWaitTime
          : zeroWaitTime // ignore: cast_nullable_to_non_nullable
              as int,
      enableStealthChop: null == enableStealthChop
          ? _value.enableStealthChop
          : enableStealthChop // ignore: cast_nullable_to_non_nullable
              as bool,
      automaticCurrentControl: null == automaticCurrentControl
          ? _value.automaticCurrentControl
          : automaticCurrentControl // ignore: cast_nullable_to_non_nullable
              as bool,
      automaticPWMTuning: null == automaticPWMTuning
          ? _value.automaticPWMTuning
          : automaticPWMTuning // ignore: cast_nullable_to_non_nullable
              as bool,
      pidP: null == pidP
          ? _value.pidP
          : pidP // ignore: cast_nullable_to_non_nullable
              as double,
      pidI: null == pidI
          ? _value.pidI
          : pidI // ignore: cast_nullable_to_non_nullable
              as double,
      pidD: null == pidD
          ? _value.pidD
          : pidD // ignore: cast_nullable_to_non_nullable
              as double,
      wasMin: null == wasMin
          ? _value.wasMin
          : wasMin // ignore: cast_nullable_to_non_nullable
              as int,
      wasCenter: null == wasCenter
          ? _value.wasCenter
          : wasCenter // ignore: cast_nullable_to_non_nullable
              as int,
      wasMax: null == wasMax
          ? _value.wasMax
          : wasMax // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SteeringHardwareConfigImplCopyWith<$Res>
    implements $SteeringHardwareConfigCopyWith<$Res> {
  factory _$$SteeringHardwareConfigImplCopyWith(
          _$SteeringHardwareConfigImpl value,
          $Res Function(_$SteeringHardwareConfigImpl) then) =
      __$$SteeringHardwareConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invertDirection') bool invertDirection,
      @JsonKey(name: 'MICRO_STEPS') int microSteps,
      @JsonKey(name: 'STEPS_PER_ROT') int stepsPerRotation,
      @JsonKey(name: 'RMS_CURRENT') int rmsCurrent,
      @JsonKey(name: 'hold_multiplier') double holdMultiplier,
      @JsonKey(name: 'freewheel') MotorHoldingMode freeWheel,
      @JsonKey(name: 'AMAX_RPM_S_2') double maxAcceleration,
      @JsonKey(name: 'VMAX_RPM') double maxRPM,
      @JsonKey(name: 'VSTOP') int vStop,
      @JsonKey(name: 'VSTART') int vStart,
      @JsonKey(name: 'TOFF') int tOff,
      @JsonKey(name: 'SGT') int stallguardThreshold,
      @JsonKey(name: 'sfilt') bool stallguardFiltering,
      @JsonKey(name: 'sg_stop') bool stallguardStop,
      @JsonKey(name: 'semin') int semin,
      @JsonKey(name: 'semax') int semax,
      @JsonKey(name: 'TCOOLTHRS_RPM') double coolstepThresholdRPM,
      @JsonKey(name: 'TPWMTHRS_RPM') double stealthChopThresholdRPM,
      @JsonKey(name: 'chm') ChopperMode chopperMode,
      @JsonKey(name: 'THIGH_RPM')
      double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: 'VDCMIN_RPM') double dcStepThresholdRPM,
      @JsonKey(name: 'vhighfs') bool fullstepAtHighVelocities,
      @JsonKey(name: 'vhighchm') bool setConstantChopperAtHighVelocities,
      @JsonKey(name: 'DC_TIME') int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: 'DC_SG') int dcStepStallguardSensitivity,
      @JsonKey(name: 'HSTRT') int hystersisStart,
      @JsonKey(name: 'HEND') int hystersisEnd,
      @JsonKey(name: 'IHOLDDELAY') int currentHoldDelay,
      @JsonKey(name: 'TBL') ComparatorBlankTime blankTime,
      @JsonKey(name: 'TPOWERDOWN') int powerDownTime,
      @JsonKey(name: 'TZEROWAIT') int zeroWaitTime,
      @JsonKey(name: 'en_pwm_mode') bool enableStealthChop,
      @JsonKey(name: 'pwm_autoscale') bool automaticCurrentControl,
      @JsonKey(name: 'pwm_autograd') bool automaticPWMTuning,
      @JsonKey(name: 'pid_P') double pidP,
      @JsonKey(name: 'pid_I') double pidI,
      @JsonKey(name: 'pid_D') double pidD,
      @JsonKey(name: 'was_min') int wasMin,
      @JsonKey(name: 'was_center') int wasCenter,
      @JsonKey(name: 'was_max') int wasMax});
}

/// @nodoc
class __$$SteeringHardwareConfigImplCopyWithImpl<$Res>
    extends _$SteeringHardwareConfigCopyWithImpl<$Res,
        _$SteeringHardwareConfigImpl>
    implements _$$SteeringHardwareConfigImplCopyWith<$Res> {
  __$$SteeringHardwareConfigImplCopyWithImpl(
      _$SteeringHardwareConfigImpl _value,
      $Res Function(_$SteeringHardwareConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertDirection = null,
    Object? microSteps = null,
    Object? stepsPerRotation = null,
    Object? rmsCurrent = null,
    Object? holdMultiplier = null,
    Object? freeWheel = null,
    Object? maxAcceleration = null,
    Object? maxRPM = null,
    Object? vStop = null,
    Object? vStart = null,
    Object? tOff = null,
    Object? stallguardThreshold = null,
    Object? stallguardFiltering = null,
    Object? stallguardStop = null,
    Object? semin = null,
    Object? semax = null,
    Object? coolstepThresholdRPM = null,
    Object? stealthChopThresholdRPM = null,
    Object? chopperMode = null,
    Object? highVelocityChopperModeChangeThresholdRPM = null,
    Object? dcStepThresholdRPM = null,
    Object? fullstepAtHighVelocities = null,
    Object? setConstantChopperAtHighVelocities = null,
    Object? dcStepLoadMeasurementPulseWidth = null,
    Object? dcStepStallguardSensitivity = null,
    Object? hystersisStart = null,
    Object? hystersisEnd = null,
    Object? currentHoldDelay = null,
    Object? blankTime = null,
    Object? powerDownTime = null,
    Object? zeroWaitTime = null,
    Object? enableStealthChop = null,
    Object? automaticCurrentControl = null,
    Object? automaticPWMTuning = null,
    Object? pidP = null,
    Object? pidI = null,
    Object? pidD = null,
    Object? wasMin = null,
    Object? wasCenter = null,
    Object? wasMax = null,
  }) {
    return _then(_$SteeringHardwareConfigImpl(
      invertDirection: null == invertDirection
          ? _value.invertDirection
          : invertDirection // ignore: cast_nullable_to_non_nullable
              as bool,
      microSteps: null == microSteps
          ? _value.microSteps
          : microSteps // ignore: cast_nullable_to_non_nullable
              as int,
      stepsPerRotation: null == stepsPerRotation
          ? _value.stepsPerRotation
          : stepsPerRotation // ignore: cast_nullable_to_non_nullable
              as int,
      rmsCurrent: null == rmsCurrent
          ? _value.rmsCurrent
          : rmsCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      holdMultiplier: null == holdMultiplier
          ? _value.holdMultiplier
          : holdMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      freeWheel: null == freeWheel
          ? _value.freeWheel
          : freeWheel // ignore: cast_nullable_to_non_nullable
              as MotorHoldingMode,
      maxAcceleration: null == maxAcceleration
          ? _value.maxAcceleration
          : maxAcceleration // ignore: cast_nullable_to_non_nullable
              as double,
      maxRPM: null == maxRPM
          ? _value.maxRPM
          : maxRPM // ignore: cast_nullable_to_non_nullable
              as double,
      vStop: null == vStop
          ? _value.vStop
          : vStop // ignore: cast_nullable_to_non_nullable
              as int,
      vStart: null == vStart
          ? _value.vStart
          : vStart // ignore: cast_nullable_to_non_nullable
              as int,
      tOff: null == tOff
          ? _value.tOff
          : tOff // ignore: cast_nullable_to_non_nullable
              as int,
      stallguardThreshold: null == stallguardThreshold
          ? _value.stallguardThreshold
          : stallguardThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      stallguardFiltering: null == stallguardFiltering
          ? _value.stallguardFiltering
          : stallguardFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      stallguardStop: null == stallguardStop
          ? _value.stallguardStop
          : stallguardStop // ignore: cast_nullable_to_non_nullable
              as bool,
      semin: null == semin
          ? _value.semin
          : semin // ignore: cast_nullable_to_non_nullable
              as int,
      semax: null == semax
          ? _value.semax
          : semax // ignore: cast_nullable_to_non_nullable
              as int,
      coolstepThresholdRPM: null == coolstepThresholdRPM
          ? _value.coolstepThresholdRPM
          : coolstepThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      stealthChopThresholdRPM: null == stealthChopThresholdRPM
          ? _value.stealthChopThresholdRPM
          : stealthChopThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      chopperMode: null == chopperMode
          ? _value.chopperMode
          : chopperMode // ignore: cast_nullable_to_non_nullable
              as ChopperMode,
      highVelocityChopperModeChangeThresholdRPM: null ==
              highVelocityChopperModeChangeThresholdRPM
          ? _value.highVelocityChopperModeChangeThresholdRPM
          : highVelocityChopperModeChangeThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      dcStepThresholdRPM: null == dcStepThresholdRPM
          ? _value.dcStepThresholdRPM
          : dcStepThresholdRPM // ignore: cast_nullable_to_non_nullable
              as double,
      fullstepAtHighVelocities: null == fullstepAtHighVelocities
          ? _value.fullstepAtHighVelocities
          : fullstepAtHighVelocities // ignore: cast_nullable_to_non_nullable
              as bool,
      setConstantChopperAtHighVelocities: null ==
              setConstantChopperAtHighVelocities
          ? _value.setConstantChopperAtHighVelocities
          : setConstantChopperAtHighVelocities // ignore: cast_nullable_to_non_nullable
              as bool,
      dcStepLoadMeasurementPulseWidth: null == dcStepLoadMeasurementPulseWidth
          ? _value.dcStepLoadMeasurementPulseWidth
          : dcStepLoadMeasurementPulseWidth // ignore: cast_nullable_to_non_nullable
              as int,
      dcStepStallguardSensitivity: null == dcStepStallguardSensitivity
          ? _value.dcStepStallguardSensitivity
          : dcStepStallguardSensitivity // ignore: cast_nullable_to_non_nullable
              as int,
      hystersisStart: null == hystersisStart
          ? _value.hystersisStart
          : hystersisStart // ignore: cast_nullable_to_non_nullable
              as int,
      hystersisEnd: null == hystersisEnd
          ? _value.hystersisEnd
          : hystersisEnd // ignore: cast_nullable_to_non_nullable
              as int,
      currentHoldDelay: null == currentHoldDelay
          ? _value.currentHoldDelay
          : currentHoldDelay // ignore: cast_nullable_to_non_nullable
              as int,
      blankTime: null == blankTime
          ? _value.blankTime
          : blankTime // ignore: cast_nullable_to_non_nullable
              as ComparatorBlankTime,
      powerDownTime: null == powerDownTime
          ? _value.powerDownTime
          : powerDownTime // ignore: cast_nullable_to_non_nullable
              as int,
      zeroWaitTime: null == zeroWaitTime
          ? _value.zeroWaitTime
          : zeroWaitTime // ignore: cast_nullable_to_non_nullable
              as int,
      enableStealthChop: null == enableStealthChop
          ? _value.enableStealthChop
          : enableStealthChop // ignore: cast_nullable_to_non_nullable
              as bool,
      automaticCurrentControl: null == automaticCurrentControl
          ? _value.automaticCurrentControl
          : automaticCurrentControl // ignore: cast_nullable_to_non_nullable
              as bool,
      automaticPWMTuning: null == automaticPWMTuning
          ? _value.automaticPWMTuning
          : automaticPWMTuning // ignore: cast_nullable_to_non_nullable
              as bool,
      pidP: null == pidP
          ? _value.pidP
          : pidP // ignore: cast_nullable_to_non_nullable
              as double,
      pidI: null == pidI
          ? _value.pidI
          : pidI // ignore: cast_nullable_to_non_nullable
              as double,
      pidD: null == pidD
          ? _value.pidD
          : pidD // ignore: cast_nullable_to_non_nullable
              as double,
      wasMin: null == wasMin
          ? _value.wasMin
          : wasMin // ignore: cast_nullable_to_non_nullable
              as int,
      wasCenter: null == wasCenter
          ? _value.wasCenter
          : wasCenter // ignore: cast_nullable_to_non_nullable
              as int,
      wasMax: null == wasMax
          ? _value.wasMax
          : wasMax // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SteeringHardwareConfigImpl extends _SteeringHardwareConfig {
  const _$SteeringHardwareConfigImpl(
      {@JsonKey(name: 'invertDirection') this.invertDirection = false,
      @JsonKey(name: 'MICRO_STEPS') this.microSteps = 256,
      @JsonKey(name: 'STEPS_PER_ROT') this.stepsPerRotation = 200,
      @JsonKey(name: 'RMS_CURRENT') this.rmsCurrent = 1000,
      @JsonKey(name: 'hold_multiplier') this.holdMultiplier = 0,
      @JsonKey(name: 'freewheel') this.freeWheel = MotorHoldingMode.freewheel,
      @JsonKey(name: 'AMAX_RPM_S_2') this.maxAcceleration = 100,
      @JsonKey(name: 'VMAX_RPM') this.maxRPM = 200,
      @JsonKey(name: 'VSTOP') this.vStop = 10,
      @JsonKey(name: 'VSTART') this.vStart = 0,
      @JsonKey(name: 'TOFF') this.tOff = 5,
      @JsonKey(name: 'SGT') this.stallguardThreshold = 32,
      @JsonKey(name: 'sfilt') this.stallguardFiltering = false,
      @JsonKey(name: 'sg_stop') this.stallguardStop = true,
      @JsonKey(name: 'semin') this.semin = 5,
      @JsonKey(name: 'semax') this.semax = 2,
      @JsonKey(name: 'TCOOLTHRS_RPM') this.coolstepThresholdRPM = 10,
      @JsonKey(name: 'TPWMTHRS_RPM') this.stealthChopThresholdRPM = 40,
      @JsonKey(name: 'chm') this.chopperMode = ChopperMode.spreadCycle,
      @JsonKey(name: 'THIGH_RPM')
      this.highVelocityChopperModeChangeThresholdRPM = 150,
      @JsonKey(name: 'VDCMIN_RPM') this.dcStepThresholdRPM = 150,
      @JsonKey(name: 'vhighfs') this.fullstepAtHighVelocities = false,
      @JsonKey(name: 'vhighchm')
      this.setConstantChopperAtHighVelocities = false,
      @JsonKey(name: 'DC_TIME') this.dcStepLoadMeasurementPulseWidth = 64,
      @JsonKey(name: 'DC_SG') this.dcStepStallguardSensitivity = 5,
      @JsonKey(name: 'HSTRT') this.hystersisStart = 4,
      @JsonKey(name: 'HEND') this.hystersisEnd = 1,
      @JsonKey(name: 'IHOLDDELAY') this.currentHoldDelay = 1,
      @JsonKey(name: 'TBL') this.blankTime = ComparatorBlankTime.clk24,
      @JsonKey(name: 'TPOWERDOWN') this.powerDownTime = 1,
      @JsonKey(name: 'TZEROWAIT') this.zeroWaitTime = 1,
      @JsonKey(name: 'en_pwm_mode') this.enableStealthChop = false,
      @JsonKey(name: 'pwm_autoscale') this.automaticCurrentControl = false,
      @JsonKey(name: 'pwm_autograd') this.automaticPWMTuning = false,
      @JsonKey(name: 'pid_P') this.pidP = 20,
      @JsonKey(name: 'pid_I') this.pidI = 0.13,
      @JsonKey(name: 'pid_D') this.pidD = 0.06,
      @JsonKey(name: 'was_min') this.wasMin = 250,
      @JsonKey(name: 'was_center') this.wasCenter = 2000,
      @JsonKey(name: 'was_max') this.wasMax = 3750})
      : assert(
            microSteps == 1 ||
                microSteps == 2 ||
                microSteps == 4 ||
                microSteps == 8 ||
                microSteps == 16 ||
                microSteps == 32 ||
                microSteps == 64 ||
                microSteps == 128 ||
                microSteps == 256,
            'microSteps needs to be a power of 2 up to 256.'),
        assert(stepsPerRotation == 200 || stepsPerRotation == 400,
            'stepsPerRotation has to be 200 or 400.'),
        assert(rmsCurrent >= 0 && rmsCurrent <= 3000,
            'rmsCurrent should be in range 0 to 3000 mA.'),
        assert(holdMultiplier >= 0 && holdMultiplier <= 1,
            'holdMultiplier should be in range 0 to 1.'),
        assert(maxAcceleration >= 0, 'maxAcceleration should be positive.'),
        assert(maxRPM >= 0, 'maxRPM should be positive.'),
        assert(vStop >= 0, 'vStop should be positive.'),
        assert(vStart >= 0, 'vStart should be positive.'),
        assert(tOff >= 0 && tOff <= 15, 'tOff should be in range 0 to 15.'),
        assert(semin >= 0 && semin <= 15, 'semin should be in range 0 to 15.'),
        assert(stallguardThreshold >= -64 && stallguardThreshold <= 63,
            'stallguardThreshold should be in range -64 to 63.'),
        assert(semax >= 0 && semax <= 15, 'semax should be in range 0 to 15.'),
        assert(coolstepThresholdRPM >= 0,
            'coolstepThresholdRPM should be positive.'),
        assert(stealthChopThresholdRPM >= 0,
            'stealthChopThresholdRPM should be positive.'),
        assert(highVelocityChopperModeChangeThresholdRPM >= 0,
            'highVelocityChopperModeChangeThresholdRPM should be positive.'),
        assert(
            dcStepThresholdRPM >= 0, 'dcStepThresholdRPM should be positive.'),
        assert(
            dcStepLoadMeasurementPulseWidth >= 0 &&
                dcStepLoadMeasurementPulseWidth <= 1023,
            'dcStepLoadMeasurementPulseWidth should be in range 0 to 1023.'),
        assert(
            dcStepStallguardSensitivity >= 0 &&
                dcStepStallguardSensitivity <= 255,
            'dcStepStallguardSensitivity should be in range 0 to 255.'),
        assert(hystersisStart >= 0 && hystersisStart <= 7,
            'hystersisStart should be in range 0 to 7.'),
        assert(hystersisEnd >= 0 && hystersisEnd <= 15,
            'hystersisEnd should be in range 0 to 15.'),
        assert(currentHoldDelay >= 0 && currentHoldDelay <= 15,
            'currentHoldDelay should be in range 0 to 15.'),
        assert(powerDownTime >= 0 && powerDownTime <= 255,
            'powerDownTime should be in range 0 to 255 .'),
        assert(zeroWaitTime >= 0 && zeroWaitTime <= 65535,
            'zeroWaitTime should be in range 0 to 65535.'),
        assert(pidP >= 0, 'pidP should be positive.'),
        assert(pidI >= 0, 'pidI should be positive.'),
        assert(pidD >= 0, 'pidD should be positive.'),
        assert(wasMin >= 0, 'wasMin should be positive.'),
        assert(wasCenter >= 0 && wasCenter > wasMin,
            'wasCenter should be positive and larger than wasMin.'),
        assert(wasMax >= 0 && wasMax > wasCenter,
            'wasMax should be positive and larger than wasCenter.'),
        super._();

  factory _$SteeringHardwareConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SteeringHardwareConfigImplFromJson(json);

  /// Whehter the motor rotation direction should be inverted.
  @override
  @JsonKey(name: 'invertDirection')
  final bool invertDirection;

  /// The number of micro steps to divide one fullstep into.
  @override
  @JsonKey(name: 'MICRO_STEPS')
  final int microSteps;

  /// The number of fullsteps for one rotation of the motor.
  @override
  @JsonKey(name: 'STEPS_PER_ROT')
  final int stepsPerRotation;

  /// The rated RMS current of the motor.
  @override
  @JsonKey(name: 'RMS_CURRENT')
  final int rmsCurrent;

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @override
  @JsonKey(name: 'hold_multiplier')
  final double holdMultiplier;

  /// Which mode the motor should be in when holding.
  @override
  @JsonKey(name: 'freewheel')
  final MotorHoldingMode freeWheel;

  /// Maximum acceleration in RPM/s^2.
  @override
  @JsonKey(name: 'AMAX_RPM_S_2')
  final double maxAcceleration;

  /// Maximum RPM
  @override
  @JsonKey(name: 'VMAX_RPM')
  final double maxRPM;

  /// Stopping velocity, should be higher than [vStart].
  @override
  @JsonKey(name: 'VSTOP')
  final int vStop;

  /// Starting velocity, should be lower than [vStop].
  @override
  @JsonKey(name: 'VSTART')
  final int vStart;

  /// Off time and driver enable.
  @override
  @JsonKey(name: 'TOFF')
  final int tOff;

  /// Threshold for detecting a stall.
  @override
  @JsonKey(name: 'SGT')
  final int stallguardThreshold;

  /// Whether stall detection should filter over four fullsteps.
  @override
  @JsonKey(name: 'sfilt')
  final bool stallguardFiltering;

  /// Whether the motor should stop when detecting a stall.
  @override
  @JsonKey(name: 'sg_stop')
  final bool stallguardStop;

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @override
  @JsonKey(name: 'semin')
  final int semin;

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @override
  @JsonKey(name: 'semax')
  final int semax;

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @override
  @JsonKey(name: 'TCOOLTHRS_RPM')
  final double coolstepThresholdRPM;

  /// Uppper velocity RPM threshold for StealthChop.
  @override
  @JsonKey(name: 'TPWMTHRS_RPM')
  final double stealthChopThresholdRPM;

  /// Which stepper chopper mode is used.
  @override
  @JsonKey(name: 'chm')
  final ChopperMode chopperMode;

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @override
  @JsonKey(name: 'THIGH_RPM')
  final double highVelocityChopperModeChangeThresholdRPM;

  /// Lower velocity RPM threhsold for enabling DcStep.
  @override
  @JsonKey(name: 'VDCMIN_RPM')
  final double dcStepThresholdRPM;

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: 'vhighfs')
  final bool fullstepAtHighVelocities;

  /// Whether chopper mode switch to
  /// [ChopperMode.constantTimeOffWithFastDecay] should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: 'vhighchm')
  final bool setConstantChopperAtHighVelocities;

  /// Reference pulse width for DcStep load measurement.
  @override
  @JsonKey(name: 'DC_TIME')
  final int dcStepLoadMeasurementPulseWidth;

  /// Stall detection threshold for DcStep mode.
  @override
  @JsonKey(name: 'DC_SG')
  final int dcStepStallguardSensitivity;

  /// Hysteresis start value.
  @override
  @JsonKey(name: 'HSTRT')
  final int hystersisStart;

  /// Hysteresis end value.
  @override
  @JsonKey(name: 'HEND')
  final int hystersisEnd;

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @override
  @JsonKey(name: 'IHOLDDELAY')
  final int currentHoldDelay;

  /// Comparator blank time, number of clock cycles.
  @override
  @JsonKey(name: 'TBL')
  final ComparatorBlankTime blankTime;

  /// Power down delay time after standstill.
  @override
  @JsonKey(name: 'TPOWERDOWN')
  final int powerDownTime;

  /// Wait time before powering up after having reached 0 veolcity.
  @override
  @JsonKey(name: 'TZEROWAIT')
  final int zeroWaitTime;

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @override
  @JsonKey(name: 'en_pwm_mode')
  final bool enableStealthChop;

  /// Whether PWM amplitude scaling is automatic.
  @override
  @JsonKey(name: 'pwm_autoscale')
  final bool automaticCurrentControl;

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @override
  @JsonKey(name: 'pwm_autograd')
  final bool automaticPWMTuning;

  /// Proportional gain coefficient for steering.
  @override
  @JsonKey(name: 'pid_P')
  final double pidP;

  /// Integral gain coefficient for steering.
  @override
  @JsonKey(name: 'pid_I')
  final double pidI;

  /// Derivative gain coefficient for steering.
  @override
  @JsonKey(name: 'pid_D')
  final double pidD;

  /// Minimum reading value for WAS.
  @override
  @JsonKey(name: 'was_min')
  final int wasMin;

  /// Center reading value for WAS.
  @override
  @JsonKey(name: 'was_center')
  final int wasCenter;

  /// Maximum reading value for WAS.
  @override
  @JsonKey(name: 'was_max')
  final int wasMax;

  @override
  String toString() {
    return 'SteeringHardwareConfig(invertDirection: $invertDirection, microSteps: $microSteps, stepsPerRotation: $stepsPerRotation, rmsCurrent: $rmsCurrent, holdMultiplier: $holdMultiplier, freeWheel: $freeWheel, maxAcceleration: $maxAcceleration, maxRPM: $maxRPM, vStop: $vStop, vStart: $vStart, tOff: $tOff, stallguardThreshold: $stallguardThreshold, stallguardFiltering: $stallguardFiltering, stallguardStop: $stallguardStop, semin: $semin, semax: $semax, coolstepThresholdRPM: $coolstepThresholdRPM, stealthChopThresholdRPM: $stealthChopThresholdRPM, chopperMode: $chopperMode, highVelocityChopperModeChangeThresholdRPM: $highVelocityChopperModeChangeThresholdRPM, dcStepThresholdRPM: $dcStepThresholdRPM, fullstepAtHighVelocities: $fullstepAtHighVelocities, setConstantChopperAtHighVelocities: $setConstantChopperAtHighVelocities, dcStepLoadMeasurementPulseWidth: $dcStepLoadMeasurementPulseWidth, dcStepStallguardSensitivity: $dcStepStallguardSensitivity, hystersisStart: $hystersisStart, hystersisEnd: $hystersisEnd, currentHoldDelay: $currentHoldDelay, blankTime: $blankTime, powerDownTime: $powerDownTime, zeroWaitTime: $zeroWaitTime, enableStealthChop: $enableStealthChop, automaticCurrentControl: $automaticCurrentControl, automaticPWMTuning: $automaticPWMTuning, pidP: $pidP, pidI: $pidI, pidD: $pidD, wasMin: $wasMin, wasCenter: $wasCenter, wasMax: $wasMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SteeringHardwareConfigImpl &&
            (identical(other.invertDirection, invertDirection) ||
                other.invertDirection == invertDirection) &&
            (identical(other.microSteps, microSteps) ||
                other.microSteps == microSteps) &&
            (identical(other.stepsPerRotation, stepsPerRotation) ||
                other.stepsPerRotation == stepsPerRotation) &&
            (identical(other.rmsCurrent, rmsCurrent) ||
                other.rmsCurrent == rmsCurrent) &&
            (identical(other.holdMultiplier, holdMultiplier) ||
                other.holdMultiplier == holdMultiplier) &&
            (identical(other.freeWheel, freeWheel) ||
                other.freeWheel == freeWheel) &&
            (identical(other.maxAcceleration, maxAcceleration) ||
                other.maxAcceleration == maxAcceleration) &&
            (identical(other.maxRPM, maxRPM) || other.maxRPM == maxRPM) &&
            (identical(other.vStop, vStop) || other.vStop == vStop) &&
            (identical(other.vStart, vStart) || other.vStart == vStart) &&
            (identical(other.tOff, tOff) || other.tOff == tOff) &&
            (identical(other.stallguardThreshold, stallguardThreshold) ||
                other.stallguardThreshold == stallguardThreshold) &&
            (identical(other.stallguardFiltering, stallguardFiltering) ||
                other.stallguardFiltering == stallguardFiltering) &&
            (identical(other.stallguardStop, stallguardStop) ||
                other.stallguardStop == stallguardStop) &&
            (identical(other.semin, semin) || other.semin == semin) &&
            (identical(other.semax, semax) || other.semax == semax) &&
            (identical(other.coolstepThresholdRPM, coolstepThresholdRPM) ||
                other.coolstepThresholdRPM == coolstepThresholdRPM) &&
            (identical(other.stealthChopThresholdRPM, stealthChopThresholdRPM) ||
                other.stealthChopThresholdRPM == stealthChopThresholdRPM) &&
            (identical(other.chopperMode, chopperMode) ||
                other.chopperMode == chopperMode) &&
            (identical(other.highVelocityChopperModeChangeThresholdRPM, highVelocityChopperModeChangeThresholdRPM) ||
                other.highVelocityChopperModeChangeThresholdRPM ==
                    highVelocityChopperModeChangeThresholdRPM) &&
            (identical(other.dcStepThresholdRPM, dcStepThresholdRPM) ||
                other.dcStepThresholdRPM == dcStepThresholdRPM) &&
            (identical(other.fullstepAtHighVelocities, fullstepAtHighVelocities) ||
                other.fullstepAtHighVelocities == fullstepAtHighVelocities) &&
            (identical(other.setConstantChopperAtHighVelocities, setConstantChopperAtHighVelocities) ||
                other.setConstantChopperAtHighVelocities ==
                    setConstantChopperAtHighVelocities) &&
            (identical(other.dcStepLoadMeasurementPulseWidth, dcStepLoadMeasurementPulseWidth) ||
                other.dcStepLoadMeasurementPulseWidth ==
                    dcStepLoadMeasurementPulseWidth) &&
            (identical(other.dcStepStallguardSensitivity, dcStepStallguardSensitivity) ||
                other.dcStepStallguardSensitivity ==
                    dcStepStallguardSensitivity) &&
            (identical(other.hystersisStart, hystersisStart) ||
                other.hystersisStart == hystersisStart) &&
            (identical(other.hystersisEnd, hystersisEnd) ||
                other.hystersisEnd == hystersisEnd) &&
            (identical(other.currentHoldDelay, currentHoldDelay) ||
                other.currentHoldDelay == currentHoldDelay) &&
            (identical(other.blankTime, blankTime) ||
                other.blankTime == blankTime) &&
            (identical(other.powerDownTime, powerDownTime) ||
                other.powerDownTime == powerDownTime) &&
            (identical(other.zeroWaitTime, zeroWaitTime) ||
                other.zeroWaitTime == zeroWaitTime) &&
            (identical(other.enableStealthChop, enableStealthChop) ||
                other.enableStealthChop == enableStealthChop) &&
            (identical(other.automaticCurrentControl, automaticCurrentControl) || other.automaticCurrentControl == automaticCurrentControl) &&
            (identical(other.automaticPWMTuning, automaticPWMTuning) || other.automaticPWMTuning == automaticPWMTuning) &&
            (identical(other.pidP, pidP) || other.pidP == pidP) &&
            (identical(other.pidI, pidI) || other.pidI == pidI) &&
            (identical(other.pidD, pidD) || other.pidD == pidD) &&
            (identical(other.wasMin, wasMin) || other.wasMin == wasMin) &&
            (identical(other.wasCenter, wasCenter) || other.wasCenter == wasCenter) &&
            (identical(other.wasMax, wasMax) || other.wasMax == wasMax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        invertDirection,
        microSteps,
        stepsPerRotation,
        rmsCurrent,
        holdMultiplier,
        freeWheel,
        maxAcceleration,
        maxRPM,
        vStop,
        vStart,
        tOff,
        stallguardThreshold,
        stallguardFiltering,
        stallguardStop,
        semin,
        semax,
        coolstepThresholdRPM,
        stealthChopThresholdRPM,
        chopperMode,
        highVelocityChopperModeChangeThresholdRPM,
        dcStepThresholdRPM,
        fullstepAtHighVelocities,
        setConstantChopperAtHighVelocities,
        dcStepLoadMeasurementPulseWidth,
        dcStepStallguardSensitivity,
        hystersisStart,
        hystersisEnd,
        currentHoldDelay,
        blankTime,
        powerDownTime,
        zeroWaitTime,
        enableStealthChop,
        automaticCurrentControl,
        automaticPWMTuning,
        pidP,
        pidI,
        pidD,
        wasMin,
        wasCenter,
        wasMax
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SteeringHardwareConfigImplCopyWith<_$SteeringHardwareConfigImpl>
      get copyWith => __$$SteeringHardwareConfigImplCopyWithImpl<
          _$SteeringHardwareConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SteeringHardwareConfigImplToJson(
      this,
    );
  }
}

abstract class _SteeringHardwareConfig extends SteeringHardwareConfig {
  const factory _SteeringHardwareConfig(
      {@JsonKey(name: 'invertDirection') final bool invertDirection,
      @JsonKey(name: 'MICRO_STEPS') final int microSteps,
      @JsonKey(name: 'STEPS_PER_ROT') final int stepsPerRotation,
      @JsonKey(name: 'RMS_CURRENT') final int rmsCurrent,
      @JsonKey(name: 'hold_multiplier') final double holdMultiplier,
      @JsonKey(name: 'freewheel') final MotorHoldingMode freeWheel,
      @JsonKey(name: 'AMAX_RPM_S_2') final double maxAcceleration,
      @JsonKey(name: 'VMAX_RPM') final double maxRPM,
      @JsonKey(name: 'VSTOP') final int vStop,
      @JsonKey(name: 'VSTART') final int vStart,
      @JsonKey(name: 'TOFF') final int tOff,
      @JsonKey(name: 'SGT') final int stallguardThreshold,
      @JsonKey(name: 'sfilt') final bool stallguardFiltering,
      @JsonKey(name: 'sg_stop') final bool stallguardStop,
      @JsonKey(name: 'semin') final int semin,
      @JsonKey(name: 'semax') final int semax,
      @JsonKey(name: 'TCOOLTHRS_RPM') final double coolstepThresholdRPM,
      @JsonKey(name: 'TPWMTHRS_RPM') final double stealthChopThresholdRPM,
      @JsonKey(name: 'chm') final ChopperMode chopperMode,
      @JsonKey(name: 'THIGH_RPM')
      final double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: 'VDCMIN_RPM') final double dcStepThresholdRPM,
      @JsonKey(name: 'vhighfs') final bool fullstepAtHighVelocities,
      @JsonKey(name: 'vhighchm') final bool setConstantChopperAtHighVelocities,
      @JsonKey(name: 'DC_TIME') final int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: 'DC_SG') final int dcStepStallguardSensitivity,
      @JsonKey(name: 'HSTRT') final int hystersisStart,
      @JsonKey(name: 'HEND') final int hystersisEnd,
      @JsonKey(name: 'IHOLDDELAY') final int currentHoldDelay,
      @JsonKey(name: 'TBL') final ComparatorBlankTime blankTime,
      @JsonKey(name: 'TPOWERDOWN') final int powerDownTime,
      @JsonKey(name: 'TZEROWAIT') final int zeroWaitTime,
      @JsonKey(name: 'en_pwm_mode') final bool enableStealthChop,
      @JsonKey(name: 'pwm_autoscale') final bool automaticCurrentControl,
      @JsonKey(name: 'pwm_autograd') final bool automaticPWMTuning,
      @JsonKey(name: 'pid_P') final double pidP,
      @JsonKey(name: 'pid_I') final double pidI,
      @JsonKey(name: 'pid_D') final double pidD,
      @JsonKey(name: 'was_min') final int wasMin,
      @JsonKey(name: 'was_center') final int wasCenter,
      @JsonKey(name: 'was_max')
      final int wasMax}) = _$SteeringHardwareConfigImpl;
  const _SteeringHardwareConfig._() : super._();

  factory _SteeringHardwareConfig.fromJson(Map<String, dynamic> json) =
      _$SteeringHardwareConfigImpl.fromJson;

  @override

  /// Whehter the motor rotation direction should be inverted.
  @JsonKey(name: 'invertDirection')
  bool get invertDirection;
  @override

  /// The number of micro steps to divide one fullstep into.
  @JsonKey(name: 'MICRO_STEPS')
  int get microSteps;
  @override

  /// The number of fullsteps for one rotation of the motor.
  @JsonKey(name: 'STEPS_PER_ROT')
  int get stepsPerRotation;
  @override

  /// The rated RMS current of the motor.
  @JsonKey(name: 'RMS_CURRENT')
  int get rmsCurrent;
  @override

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @JsonKey(name: 'hold_multiplier')
  double get holdMultiplier;
  @override

  /// Which mode the motor should be in when holding.
  @JsonKey(name: 'freewheel')
  MotorHoldingMode get freeWheel;
  @override

  /// Maximum acceleration in RPM/s^2.
  @JsonKey(name: 'AMAX_RPM_S_2')
  double get maxAcceleration;
  @override

  /// Maximum RPM
  @JsonKey(name: 'VMAX_RPM')
  double get maxRPM;
  @override

  /// Stopping velocity, should be higher than [vStart].
  @JsonKey(name: 'VSTOP')
  int get vStop;
  @override

  /// Starting velocity, should be lower than [vStop].
  @JsonKey(name: 'VSTART')
  int get vStart;
  @override

  /// Off time and driver enable.
  @JsonKey(name: 'TOFF')
  int get tOff;
  @override

  /// Threshold for detecting a stall.
  @JsonKey(name: 'SGT')
  int get stallguardThreshold;
  @override

  /// Whether stall detection should filter over four fullsteps.
  @JsonKey(name: 'sfilt')
  bool get stallguardFiltering;
  @override

  /// Whether the motor should stop when detecting a stall.
  @JsonKey(name: 'sg_stop')
  bool get stallguardStop;
  @override

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @JsonKey(name: 'semin')
  int get semin;
  @override

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @JsonKey(name: 'semax')
  int get semax;
  @override

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @JsonKey(name: 'TCOOLTHRS_RPM')
  double get coolstepThresholdRPM;
  @override

  /// Uppper velocity RPM threshold for StealthChop.
  @JsonKey(name: 'TPWMTHRS_RPM')
  double get stealthChopThresholdRPM;
  @override

  /// Which stepper chopper mode is used.
  @JsonKey(name: 'chm')
  ChopperMode get chopperMode;
  @override

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @JsonKey(name: 'THIGH_RPM')
  double get highVelocityChopperModeChangeThresholdRPM;
  @override

  /// Lower velocity RPM threhsold for enabling DcStep.
  @JsonKey(name: 'VDCMIN_RPM')
  double get dcStepThresholdRPM;
  @override

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: 'vhighfs')
  bool get fullstepAtHighVelocities;
  @override

  /// Whether chopper mode switch to
  /// [ChopperMode.constantTimeOffWithFastDecay] should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: 'vhighchm')
  bool get setConstantChopperAtHighVelocities;
  @override

  /// Reference pulse width for DcStep load measurement.
  @JsonKey(name: 'DC_TIME')
  int get dcStepLoadMeasurementPulseWidth;
  @override

  /// Stall detection threshold for DcStep mode.
  @JsonKey(name: 'DC_SG')
  int get dcStepStallguardSensitivity;
  @override

  /// Hysteresis start value.
  @JsonKey(name: 'HSTRT')
  int get hystersisStart;
  @override

  /// Hysteresis end value.
  @JsonKey(name: 'HEND')
  int get hystersisEnd;
  @override

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @JsonKey(name: 'IHOLDDELAY')
  int get currentHoldDelay;
  @override

  /// Comparator blank time, number of clock cycles.
  @JsonKey(name: 'TBL')
  ComparatorBlankTime get blankTime;
  @override

  /// Power down delay time after standstill.
  @JsonKey(name: 'TPOWERDOWN')
  int get powerDownTime;
  @override

  /// Wait time before powering up after having reached 0 veolcity.
  @JsonKey(name: 'TZEROWAIT')
  int get zeroWaitTime;
  @override

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @JsonKey(name: 'en_pwm_mode')
  bool get enableStealthChop;
  @override

  /// Whether PWM amplitude scaling is automatic.
  @JsonKey(name: 'pwm_autoscale')
  bool get automaticCurrentControl;
  @override

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @JsonKey(name: 'pwm_autograd')
  bool get automaticPWMTuning;
  @override

  /// Proportional gain coefficient for steering.
  @JsonKey(name: 'pid_P')
  double get pidP;
  @override

  /// Integral gain coefficient for steering.
  @JsonKey(name: 'pid_I')
  double get pidI;
  @override

  /// Derivative gain coefficient for steering.
  @JsonKey(name: 'pid_D')
  double get pidD;
  @override

  /// Minimum reading value for WAS.
  @JsonKey(name: 'was_min')
  int get wasMin;
  @override

  /// Center reading value for WAS.
  @JsonKey(name: 'was_center')
  int get wasCenter;
  @override

  /// Maximum reading value for WAS.
  @JsonKey(name: 'was_max')
  int get wasMax;
  @override
  @JsonKey(ignore: true)
  _$$SteeringHardwareConfigImplCopyWith<_$SteeringHardwareConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
