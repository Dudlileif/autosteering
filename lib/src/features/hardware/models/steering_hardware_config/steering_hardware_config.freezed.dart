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
  /// Whether the motor rotation direction should be reversed.
  @JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
  bool get reverseDirection => throw _privateConstructorUsedError;

  /// The number of micro steps to divide one fullstep into.
  @JsonKey(name: SteeringHardwareConfigKey.microSteps)
  int get microSteps => throw _privateConstructorUsedError;

  /// The number of fullsteps for one rotation of the motor.
  @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
  int get stepsPerRotation => throw _privateConstructorUsedError;

  /// The rated RMS current of the motor.
  @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent)
  int get rmsCurrent => throw _privateConstructorUsedError;

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
  double get holdMultiplier => throw _privateConstructorUsedError;

  /// Which mode the motor should be in when holding.
  @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
  MotorHoldingMode get freeWheel => throw _privateConstructorUsedError;

  /// Maximum acceleration in RPM/s.
  @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
  double get maxAcceleration => throw _privateConstructorUsedError;

  /// Maximum RPM
  @JsonKey(name: SteeringHardwareConfigKey.maxRPM)
  double get maxRPM => throw _privateConstructorUsedError;

  /// Stopping velocity, should be higher than [vStart].
  @JsonKey(name: SteeringHardwareConfigKey.vStop)
  int get vStop => throw _privateConstructorUsedError;

  /// Starting velocity, should be lower than [vStop].
  @JsonKey(name: SteeringHardwareConfigKey.vStart)
  int get vStart => throw _privateConstructorUsedError;

  /// Off time and driver enable.
  @JsonKey(name: SteeringHardwareConfigKey.tOff)
  int get tOff => throw _privateConstructorUsedError;

  /// Threshold for detecting a stall.
  @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
  int get stallguardThreshold => throw _privateConstructorUsedError;

  /// Whether stall detection should filter over four fullsteps.
  @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
  bool get stallguardFiltering => throw _privateConstructorUsedError;

  /// Whether the motor should stop when detecting a stall.
  @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
  bool get stallguardStop => throw _privateConstructorUsedError;

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @JsonKey(name: SteeringHardwareConfigKey.semin)
  int get semin => throw _privateConstructorUsedError;

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @JsonKey(name: SteeringHardwareConfigKey.semax)
  int get semax => throw _privateConstructorUsedError;

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
  double get coolstepThresholdRPM => throw _privateConstructorUsedError;

  /// Uppper velocity RPM threshold for StealthChop.
  @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
  double get stealthChopThresholdRPM => throw _privateConstructorUsedError;

  /// Which stepper chopper mode is used.
  @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
  bool get chopperMode => throw _privateConstructorUsedError;

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @JsonKey(
      name: SteeringHardwareConfigKey.highVelocityChopperModeChangeThresholdRPM)
  double get highVelocityChopperModeChangeThresholdRPM =>
      throw _privateConstructorUsedError;

  /// Lower velocity RPM threhsold for enabling DcStep.
  @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
  double get dcStepThresholdRPM => throw _privateConstructorUsedError;

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
  bool get fullstepAtHighVelocities => throw _privateConstructorUsedError;

  /// Whether chopper mode switch to 1 should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @JsonKey(name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
  bool get setConstantChopperAtHighVelocities =>
      throw _privateConstructorUsedError;

  /// Reference pulse width for DcStep load measurement.
  @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
  int get dcStepLoadMeasurementPulseWidth => throw _privateConstructorUsedError;

  /// Stall detection threshold for DcStep mode.
  @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
  int get dcStepStallguardSensitivity => throw _privateConstructorUsedError;

  /// Hysteresis start value.
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
  int get hysteresisStart => throw _privateConstructorUsedError;

  /// Hysteresis end value.
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd)
  int get hysteresisEnd => throw _privateConstructorUsedError;

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
  int get currentHoldDelay => throw _privateConstructorUsedError;

  /// Comparator blank time, number of clock cycles.
  @JsonKey(name: SteeringHardwareConfigKey.blankTime)
  ComparatorBlankTime get blankTime => throw _privateConstructorUsedError;

  /// Power down delay time after standstill.
  @JsonKey(name: SteeringHardwareConfigKey.powerDownTime)
  int get powerDownTime => throw _privateConstructorUsedError;

  /// Wait time before powering up after having reached 0 veolcity.
  @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime)
  int get zeroWaitTime => throw _privateConstructorUsedError;

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
  bool get enableStealthChop => throw _privateConstructorUsedError;

  /// Whether PWM amplitude scaling is automatic.
  @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
  bool get automaticCurrentControl => throw _privateConstructorUsedError;

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
  bool get automaticPWMTuning => throw _privateConstructorUsedError;

  /// Proportional gain coefficient for steering.
  @JsonKey(name: SteeringHardwareConfigKey.pidP)
  double get pidP => throw _privateConstructorUsedError;

  /// Integral gain coefficient for steering.
  @JsonKey(name: SteeringHardwareConfigKey.pidI)
  double get pidI => throw _privateConstructorUsedError;

  /// Derivative gain coefficient for steering.
  @JsonKey(name: SteeringHardwareConfigKey.pidD)
  double get pidD => throw _privateConstructorUsedError;

  /// Minimum reading value for WAS.
  @JsonKey(name: SteeringHardwareConfigKey.wasMin)
  int get wasMin => throw _privateConstructorUsedError;

  /// Center reading value for WAS.
  @JsonKey(name: SteeringHardwareConfigKey.wasCenter)
  int get wasCenter => throw _privateConstructorUsedError;

  /// Maximum reading value for WAS.
  @JsonKey(name: SteeringHardwareConfigKey.wasMax)
  int get wasMax => throw _privateConstructorUsedError;

  /// Serializes this SteeringHardwareConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SteeringHardwareConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
      bool reverseDirection,
      @JsonKey(name: SteeringHardwareConfigKey.microSteps) int microSteps,
      @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
      int stepsPerRotation,
      @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent) int rmsCurrent,
      @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
      double holdMultiplier,
      @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
      MotorHoldingMode freeWheel,
      @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
      double maxAcceleration,
      @JsonKey(name: SteeringHardwareConfigKey.maxRPM) double maxRPM,
      @JsonKey(name: SteeringHardwareConfigKey.vStop) int vStop,
      @JsonKey(name: SteeringHardwareConfigKey.vStart) int vStart,
      @JsonKey(name: SteeringHardwareConfigKey.tOff) int tOff,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
      int stallguardThreshold,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
      bool stallguardFiltering,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
      bool stallguardStop,
      @JsonKey(name: SteeringHardwareConfigKey.semin) int semin,
      @JsonKey(name: SteeringHardwareConfigKey.semax) int semax,
      @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
      double coolstepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
      double stealthChopThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.chopperMode) bool chopperMode,
      @JsonKey(
          name: SteeringHardwareConfigKey
              .highVelocityChopperModeChangeThresholdRPM)
      double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
      double dcStepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
      bool fullstepAtHighVelocities,
      @JsonKey(
          name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
      bool setConstantChopperAtHighVelocities,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
      int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
      int dcStepStallguardSensitivity,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
      int hysteresisStart,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd) int hysteresisEnd,
      @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
      int currentHoldDelay,
      @JsonKey(name: SteeringHardwareConfigKey.blankTime)
      ComparatorBlankTime blankTime,
      @JsonKey(name: SteeringHardwareConfigKey.powerDownTime) int powerDownTime,
      @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime) int zeroWaitTime,
      @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
      bool enableStealthChop,
      @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
      bool automaticCurrentControl,
      @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
      bool automaticPWMTuning,
      @JsonKey(name: SteeringHardwareConfigKey.pidP) double pidP,
      @JsonKey(name: SteeringHardwareConfigKey.pidI) double pidI,
      @JsonKey(name: SteeringHardwareConfigKey.pidD) double pidD,
      @JsonKey(name: SteeringHardwareConfigKey.wasMin) int wasMin,
      @JsonKey(name: SteeringHardwareConfigKey.wasCenter) int wasCenter,
      @JsonKey(name: SteeringHardwareConfigKey.wasMax) int wasMax});
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

  /// Create a copy of SteeringHardwareConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reverseDirection = null,
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
    Object? hysteresisStart = null,
    Object? hysteresisEnd = null,
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
      reverseDirection: null == reverseDirection
          ? _value.reverseDirection
          : reverseDirection // ignore: cast_nullable_to_non_nullable
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
              as bool,
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
      hysteresisStart: null == hysteresisStart
          ? _value.hysteresisStart
          : hysteresisStart // ignore: cast_nullable_to_non_nullable
              as int,
      hysteresisEnd: null == hysteresisEnd
          ? _value.hysteresisEnd
          : hysteresisEnd // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
      bool reverseDirection,
      @JsonKey(name: SteeringHardwareConfigKey.microSteps) int microSteps,
      @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
      int stepsPerRotation,
      @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent) int rmsCurrent,
      @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
      double holdMultiplier,
      @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
      MotorHoldingMode freeWheel,
      @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
      double maxAcceleration,
      @JsonKey(name: SteeringHardwareConfigKey.maxRPM) double maxRPM,
      @JsonKey(name: SteeringHardwareConfigKey.vStop) int vStop,
      @JsonKey(name: SteeringHardwareConfigKey.vStart) int vStart,
      @JsonKey(name: SteeringHardwareConfigKey.tOff) int tOff,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
      int stallguardThreshold,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
      bool stallguardFiltering,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
      bool stallguardStop,
      @JsonKey(name: SteeringHardwareConfigKey.semin) int semin,
      @JsonKey(name: SteeringHardwareConfigKey.semax) int semax,
      @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
      double coolstepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
      double stealthChopThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.chopperMode) bool chopperMode,
      @JsonKey(
          name: SteeringHardwareConfigKey
              .highVelocityChopperModeChangeThresholdRPM)
      double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
      double dcStepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
      bool fullstepAtHighVelocities,
      @JsonKey(
          name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
      bool setConstantChopperAtHighVelocities,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
      int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
      int dcStepStallguardSensitivity,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
      int hysteresisStart,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd) int hysteresisEnd,
      @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
      int currentHoldDelay,
      @JsonKey(name: SteeringHardwareConfigKey.blankTime)
      ComparatorBlankTime blankTime,
      @JsonKey(name: SteeringHardwareConfigKey.powerDownTime) int powerDownTime,
      @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime) int zeroWaitTime,
      @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
      bool enableStealthChop,
      @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
      bool automaticCurrentControl,
      @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
      bool automaticPWMTuning,
      @JsonKey(name: SteeringHardwareConfigKey.pidP) double pidP,
      @JsonKey(name: SteeringHardwareConfigKey.pidI) double pidI,
      @JsonKey(name: SteeringHardwareConfigKey.pidD) double pidD,
      @JsonKey(name: SteeringHardwareConfigKey.wasMin) int wasMin,
      @JsonKey(name: SteeringHardwareConfigKey.wasCenter) int wasCenter,
      @JsonKey(name: SteeringHardwareConfigKey.wasMax) int wasMax});
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

  /// Create a copy of SteeringHardwareConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reverseDirection = null,
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
    Object? hysteresisStart = null,
    Object? hysteresisEnd = null,
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
      reverseDirection: null == reverseDirection
          ? _value.reverseDirection
          : reverseDirection // ignore: cast_nullable_to_non_nullable
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
              as bool,
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
      hysteresisStart: null == hysteresisStart
          ? _value.hysteresisStart
          : hysteresisStart // ignore: cast_nullable_to_non_nullable
              as int,
      hysteresisEnd: null == hysteresisEnd
          ? _value.hysteresisEnd
          : hysteresisEnd // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
      this.reverseDirection = false,
      @JsonKey(name: SteeringHardwareConfigKey.microSteps)
      this.microSteps = 256,
      @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
      this.stepsPerRotation = 200,
      @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent)
      this.rmsCurrent = 1000,
      @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
      this.holdMultiplier = 0,
      @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
      this.freeWheel = MotorHoldingMode.freewheel,
      @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
      this.maxAcceleration = 80,
      @JsonKey(name: SteeringHardwareConfigKey.maxRPM) this.maxRPM = 150,
      @JsonKey(name: SteeringHardwareConfigKey.vStop) this.vStop = 10,
      @JsonKey(name: SteeringHardwareConfigKey.vStart) this.vStart = 0,
      @JsonKey(name: SteeringHardwareConfigKey.tOff) this.tOff = 5,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
      this.stallguardThreshold = 32,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
      this.stallguardFiltering = false,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
      this.stallguardStop = true,
      @JsonKey(name: SteeringHardwareConfigKey.semin) this.semin = 5,
      @JsonKey(name: SteeringHardwareConfigKey.semax) this.semax = 2,
      @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
      this.coolstepThresholdRPM = 50,
      @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
      this.stealthChopThresholdRPM = 40,
      @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
      this.chopperMode = false,
      @JsonKey(name: SteeringHardwareConfigKey.highVelocityChopperModeChangeThresholdRPM)
      this.highVelocityChopperModeChangeThresholdRPM = 150,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
      this.dcStepThresholdRPM = 150,
      @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
      this.fullstepAtHighVelocities = false,
      @JsonKey(name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
      this.setConstantChopperAtHighVelocities = false,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
      this.dcStepLoadMeasurementPulseWidth = 64,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
      this.dcStepStallguardSensitivity = 5,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart) this.hysteresisStart = 4,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd) this.hysteresisEnd = 1,
      @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay) this.currentHoldDelay = 1,
      @JsonKey(name: SteeringHardwareConfigKey.blankTime) this.blankTime = ComparatorBlankTime.clk24,
      @JsonKey(name: SteeringHardwareConfigKey.powerDownTime) this.powerDownTime = 1,
      @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime) this.zeroWaitTime = 1,
      @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop) this.enableStealthChop = false,
      @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl) this.automaticCurrentControl = false,
      @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning) this.automaticPWMTuning = false,
      @JsonKey(name: SteeringHardwareConfigKey.pidP) this.pidP = 3,
      @JsonKey(name: SteeringHardwareConfigKey.pidI) this.pidI = 0,
      @JsonKey(name: SteeringHardwareConfigKey.pidD) this.pidD = 2,
      @JsonKey(name: SteeringHardwareConfigKey.wasMin) this.wasMin = 250,
      @JsonKey(name: SteeringHardwareConfigKey.wasCenter) this.wasCenter = 2000,
      @JsonKey(name: SteeringHardwareConfigKey.wasMax) this.wasMax = 3750})
      : assert(
            microSteps == 0 ||
                microSteps == 2 ||
                microSteps == 4 ||
                microSteps == 8 ||
                microSteps == 16 ||
                microSteps == 32 ||
                microSteps == 64 ||
                microSteps == 128 ||
                microSteps == 256,
            'microSteps needs to be 0 or a power of 2 from 2 up to 256.'),
        assert(stepsPerRotation == 200 || stepsPerRotation == 400,
            'stepsPerRotation has to be 200 or 400.'),
        assert(rmsCurrent >= 0 && rmsCurrent <= 3000,
            'rmsCurrent should be in range 0 to 3000 mA.'),
        assert(holdMultiplier >= 0 && holdMultiplier <= 1,
            'holdMultiplier should be in range 0 to 1.'),
        assert(maxAcceleration > 0, 'maxAcceleration should be positive.'),
        assert(maxRPM > 0, 'maxRPM should be positive.'),
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
        assert(hysteresisStart >= 0 && hysteresisStart <= 7,
            'hysteresisStart should be in range 0 to 7.'),
        assert(hysteresisEnd >= 0 && hysteresisEnd <= 15,
            'hysteresisEnd should be in range 0 to 15.'),
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

  /// Whether the motor rotation direction should be reversed.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
  final bool reverseDirection;

  /// The number of micro steps to divide one fullstep into.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.microSteps)
  final int microSteps;

  /// The number of fullsteps for one rotation of the motor.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
  final int stepsPerRotation;

  /// The rated RMS current of the motor.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent)
  final int rmsCurrent;

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
  final double holdMultiplier;

  /// Which mode the motor should be in when holding.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
  final MotorHoldingMode freeWheel;

  /// Maximum acceleration in RPM/s.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
  final double maxAcceleration;

  /// Maximum RPM
  @override
  @JsonKey(name: SteeringHardwareConfigKey.maxRPM)
  final double maxRPM;

  /// Stopping velocity, should be higher than [vStart].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.vStop)
  final int vStop;

  /// Starting velocity, should be lower than [vStop].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.vStart)
  final int vStart;

  /// Off time and driver enable.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.tOff)
  final int tOff;

  /// Threshold for detecting a stall.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
  final int stallguardThreshold;

  /// Whether stall detection should filter over four fullsteps.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
  final bool stallguardFiltering;

  /// Whether the motor should stop when detecting a stall.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
  final bool stallguardStop;

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.semin)
  final int semin;

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.semax)
  final int semax;

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
  final double coolstepThresholdRPM;

  /// Uppper velocity RPM threshold for StealthChop.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
  final double stealthChopThresholdRPM;

  /// Which stepper chopper mode is used.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
  final bool chopperMode;

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @override
  @JsonKey(
      name: SteeringHardwareConfigKey.highVelocityChopperModeChangeThresholdRPM)
  final double highVelocityChopperModeChangeThresholdRPM;

  /// Lower velocity RPM threhsold for enabling DcStep.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
  final double dcStepThresholdRPM;

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
  final bool fullstepAtHighVelocities;

  /// Whether chopper mode switch to 1 should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
  final bool setConstantChopperAtHighVelocities;

  /// Reference pulse width for DcStep load measurement.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
  final int dcStepLoadMeasurementPulseWidth;

  /// Stall detection threshold for DcStep mode.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
  final int dcStepStallguardSensitivity;

  /// Hysteresis start value.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
  final int hysteresisStart;

  /// Hysteresis end value.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd)
  final int hysteresisEnd;

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
  final int currentHoldDelay;

  /// Comparator blank time, number of clock cycles.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.blankTime)
  final ComparatorBlankTime blankTime;

  /// Power down delay time after standstill.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.powerDownTime)
  final int powerDownTime;

  /// Wait time before powering up after having reached 0 veolcity.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime)
  final int zeroWaitTime;

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
  final bool enableStealthChop;

  /// Whether PWM amplitude scaling is automatic.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
  final bool automaticCurrentControl;

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
  final bool automaticPWMTuning;

  /// Proportional gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidP)
  final double pidP;

  /// Integral gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidI)
  final double pidI;

  /// Derivative gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidD)
  final double pidD;

  /// Minimum reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasMin)
  final int wasMin;

  /// Center reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasCenter)
  final int wasCenter;

  /// Maximum reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasMax)
  final int wasMax;

  @override
  String toString() {
    return 'SteeringHardwareConfig(reverseDirection: $reverseDirection, microSteps: $microSteps, stepsPerRotation: $stepsPerRotation, rmsCurrent: $rmsCurrent, holdMultiplier: $holdMultiplier, freeWheel: $freeWheel, maxAcceleration: $maxAcceleration, maxRPM: $maxRPM, vStop: $vStop, vStart: $vStart, tOff: $tOff, stallguardThreshold: $stallguardThreshold, stallguardFiltering: $stallguardFiltering, stallguardStop: $stallguardStop, semin: $semin, semax: $semax, coolstepThresholdRPM: $coolstepThresholdRPM, stealthChopThresholdRPM: $stealthChopThresholdRPM, chopperMode: $chopperMode, highVelocityChopperModeChangeThresholdRPM: $highVelocityChopperModeChangeThresholdRPM, dcStepThresholdRPM: $dcStepThresholdRPM, fullstepAtHighVelocities: $fullstepAtHighVelocities, setConstantChopperAtHighVelocities: $setConstantChopperAtHighVelocities, dcStepLoadMeasurementPulseWidth: $dcStepLoadMeasurementPulseWidth, dcStepStallguardSensitivity: $dcStepStallguardSensitivity, hysteresisStart: $hysteresisStart, hysteresisEnd: $hysteresisEnd, currentHoldDelay: $currentHoldDelay, blankTime: $blankTime, powerDownTime: $powerDownTime, zeroWaitTime: $zeroWaitTime, enableStealthChop: $enableStealthChop, automaticCurrentControl: $automaticCurrentControl, automaticPWMTuning: $automaticPWMTuning, pidP: $pidP, pidI: $pidI, pidD: $pidD, wasMin: $wasMin, wasCenter: $wasCenter, wasMax: $wasMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SteeringHardwareConfigImpl &&
            (identical(other.reverseDirection, reverseDirection) ||
                other.reverseDirection == reverseDirection) &&
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
            (identical(other.hysteresisStart, hysteresisStart) ||
                other.hysteresisStart == hysteresisStart) &&
            (identical(other.hysteresisEnd, hysteresisEnd) ||
                other.hysteresisEnd == hysteresisEnd) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reverseDirection,
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
        hysteresisStart,
        hysteresisEnd,
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

  /// Create a copy of SteeringHardwareConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
      final bool reverseDirection,
      @JsonKey(name: SteeringHardwareConfigKey.microSteps) final int microSteps,
      @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
      final int stepsPerRotation,
      @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent) final int rmsCurrent,
      @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
      final double holdMultiplier,
      @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
      final MotorHoldingMode freeWheel,
      @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
      final double maxAcceleration,
      @JsonKey(name: SteeringHardwareConfigKey.maxRPM) final double maxRPM,
      @JsonKey(name: SteeringHardwareConfigKey.vStop) final int vStop,
      @JsonKey(name: SteeringHardwareConfigKey.vStart) final int vStart,
      @JsonKey(name: SteeringHardwareConfigKey.tOff) final int tOff,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
      final int stallguardThreshold,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
      final bool stallguardFiltering,
      @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
      final bool stallguardStop,
      @JsonKey(name: SteeringHardwareConfigKey.semin) final int semin,
      @JsonKey(name: SteeringHardwareConfigKey.semax) final int semax,
      @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
      final double coolstepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
      final double stealthChopThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
      final bool chopperMode,
      @JsonKey(
          name: SteeringHardwareConfigKey
              .highVelocityChopperModeChangeThresholdRPM)
      final double highVelocityChopperModeChangeThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
      final double dcStepThresholdRPM,
      @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
      final bool fullstepAtHighVelocities,
      @JsonKey(
          name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
      final bool setConstantChopperAtHighVelocities,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
      final int dcStepLoadMeasurementPulseWidth,
      @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
      final int dcStepStallguardSensitivity,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
      final int hysteresisStart,
      @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd)
      final int hysteresisEnd,
      @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
      final int currentHoldDelay,
      @JsonKey(name: SteeringHardwareConfigKey.blankTime)
      final ComparatorBlankTime blankTime,
      @JsonKey(name: SteeringHardwareConfigKey.powerDownTime)
      final int powerDownTime,
      @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime)
      final int zeroWaitTime,
      @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
      final bool enableStealthChop,
      @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
      final bool automaticCurrentControl,
      @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
      final bool automaticPWMTuning,
      @JsonKey(name: SteeringHardwareConfigKey.pidP) final double pidP,
      @JsonKey(name: SteeringHardwareConfigKey.pidI) final double pidI,
      @JsonKey(name: SteeringHardwareConfigKey.pidD) final double pidD,
      @JsonKey(name: SteeringHardwareConfigKey.wasMin) final int wasMin,
      @JsonKey(name: SteeringHardwareConfigKey.wasCenter) final int wasCenter,
      @JsonKey(name: SteeringHardwareConfigKey.wasMax)
      final int wasMax}) = _$SteeringHardwareConfigImpl;
  const _SteeringHardwareConfig._() : super._();

  factory _SteeringHardwareConfig.fromJson(Map<String, dynamic> json) =
      _$SteeringHardwareConfigImpl.fromJson;

  /// Whether the motor rotation direction should be reversed.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.reverseDirection)
  bool get reverseDirection;

  /// The number of micro steps to divide one fullstep into.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.microSteps)
  int get microSteps;

  /// The number of fullsteps for one rotation of the motor.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stepsPerRotation)
  int get stepsPerRotation;

  /// The rated RMS current of the motor.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.rmsCurrent)
  int get rmsCurrent;

  /// A multiplier for how much current should be applied when holding
  /// position, set to 0 to allow freewheeling.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.holdMultiplier)
  double get holdMultiplier;

  /// Which mode the motor should be in when holding.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.freeWheel)
  MotorHoldingMode get freeWheel;

  /// Maximum acceleration in RPM/s.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.maxAcceleration)
  double get maxAcceleration;

  /// Maximum RPM
  @override
  @JsonKey(name: SteeringHardwareConfigKey.maxRPM)
  double get maxRPM;

  /// Stopping velocity, should be higher than [vStart].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.vStop)
  int get vStop;

  /// Starting velocity, should be lower than [vStop].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.vStart)
  int get vStart;

  /// Off time and driver enable.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.tOff)
  int get tOff;

  /// Threshold for detecting a stall.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardThreshold)
  int get stallguardThreshold;

  /// Whether stall detection should filter over four fullsteps.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardFiltering)
  bool get stallguardFiltering;

  /// Whether the motor should stop when detecting a stall.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stallguardStop)
  bool get stallguardStop;

  /// When stall reading falls below `32*semin`, the motor current is
  /// increased.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.semin)
  int get semin;

  /// When stall reading is equal to or above `32*semax`, the motor current is
  /// decreased to save energy.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.semax)
  int get semax;

  /// Lower velocity RPM threshold to enable CoolStep and StallGuard.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.coolstepThresholdRPM)
  double get coolstepThresholdRPM;

  /// Uppper velocity RPM threshold for StealthChop.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.stealthChopThresholdRPM)
  double get stealthChopThresholdRPM;

  /// Which stepper chopper mode is used.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.chopperMode)
  bool get chopperMode;

  /// Lower velocity RPM threshold for switching to a different chopper mode
  /// at high velocities.
  @override
  @JsonKey(
      name: SteeringHardwareConfigKey.highVelocityChopperModeChangeThresholdRPM)
  double get highVelocityChopperModeChangeThresholdRPM;

  /// Lower velocity RPM threhsold for enabling DcStep.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepThresholdRPM)
  double get dcStepThresholdRPM;

  /// Whether fullstepping should be enabled above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.fullstepAtHighVelocities)
  bool get fullstepAtHighVelocities;

  /// Whether chopper mode switch to 1 should be done above
  /// [highVelocityChopperModeChangeThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.setConstantChopperAtHighVelocities)
  bool get setConstantChopperAtHighVelocities;

  /// Reference pulse width for DcStep load measurement.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepLoadMeasurementPulseWidth)
  int get dcStepLoadMeasurementPulseWidth;

  /// Stall detection threshold for DcStep mode.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.dcStepStallguardSensitivity)
  int get dcStepStallguardSensitivity;

  /// Hysteresis start value.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisStart)
  int get hysteresisStart;

  /// Hysteresis end value.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.hysteresisEnd)
  int get hysteresisEnd;

  /// Number of clock cycles until motor powers down after standstill and
  /// [powerDownTime] has expired.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.currentHoldDelay)
  int get currentHoldDelay;

  /// Comparator blank time, number of clock cycles.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.blankTime)
  ComparatorBlankTime get blankTime;

  /// Power down delay time after standstill.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.powerDownTime)
  int get powerDownTime;

  /// Wait time before powering up after having reached 0 veolcity.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.zeroWaitTime)
  int get zeroWaitTime;

  /// Whether StealthChop should enable below [stealthChopThresholdRPM].
  @override
  @JsonKey(name: SteeringHardwareConfigKey.enableStealthChop)
  bool get enableStealthChop;

  /// Whether PWM amplitude scaling is automatic.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.automaticCurrentControl)
  bool get automaticCurrentControl;

  /// Whether automatic tuning of PWM_GRAD is enabled.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.automaticPWMTuning)
  bool get automaticPWMTuning;

  /// Proportional gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidP)
  double get pidP;

  /// Integral gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidI)
  double get pidI;

  /// Derivative gain coefficient for steering.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.pidD)
  double get pidD;

  /// Minimum reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasMin)
  int get wasMin;

  /// Center reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasCenter)
  int get wasCenter;

  /// Maximum reading value for WAS.
  @override
  @JsonKey(name: SteeringHardwareConfigKey.wasMax)
  int get wasMax;

  /// Create a copy of SteeringHardwareConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SteeringHardwareConfigImplCopyWith<_$SteeringHardwareConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
