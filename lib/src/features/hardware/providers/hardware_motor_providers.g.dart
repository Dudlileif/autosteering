// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_motor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSteeringHardwareConfigHash() =>
    r'eb13c44ba561f28f0b8a0f68e23438200d44675a';

/// A provider for getting the motor configuration from the hardware.
///
/// Copied from [getSteeringHardwareConfig].
@ProviderFor(getSteeringHardwareConfig)
final getSteeringHardwareConfigProvider = FutureProvider<void>.internal(
  getSteeringHardwareConfig,
  name: r'getSteeringHardwareConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSteeringHardwareConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSteeringHardwareConfigRef = FutureProviderRef<void>;
String _$sendSteeringHardwareConfigHash() =>
    r'dd8dc0dce988ea17839a598cb7013c845946ef99';

/// A provider for updating the motor configuration on the hardware
///
/// Copied from [sendSteeringHardwareConfig].
@ProviderFor(sendSteeringHardwareConfig)
final sendSteeringHardwareConfigProvider = FutureProvider<void>.internal(
  sendSteeringHardwareConfig,
  name: r'sendSteeringHardwareConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendSteeringHardwareConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SendSteeringHardwareConfigRef = FutureProviderRef<void>;
String _$steeringMotorWasTargetHash() =>
    r'8c4800171e50833b3f3208064bf689fa6920a60d';

/// A provider for the WAS target for the steering motor when using guidance.
///
/// Copied from [SteeringMotorWasTarget].
@ProviderFor(SteeringMotorWasTarget)
final steeringMotorWasTargetProvider =
    AutoDisposeNotifierProvider<SteeringMotorWasTarget, int?>.internal(
  SteeringMotorWasTarget.new,
  name: r'steeringMotorWasTargetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorWasTargetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorWasTarget = AutoDisposeNotifier<int?>;
String _$steeringMotorActualRPMHash() =>
    r'd28dc8f5619531c4cee35a05ff99919fbfb6de7e';

/// A provider for the actual current steering motor rpm when using guidance.
///
/// Copied from [SteeringMotorActualRPM].
@ProviderFor(SteeringMotorActualRPM)
final steeringMotorActualRPMProvider =
    AutoDisposeNotifierProvider<SteeringMotorActualRPM, double?>.internal(
  SteeringMotorActualRPM.new,
  name: r'steeringMotorActualRPMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorActualRPMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorActualRPM = AutoDisposeNotifier<double?>;
String _$steeringMotorStatusHash() =>
    r'3f5d060c8911540c0b36aecf0f271c317ade9592';

/// A provider for the steering motor is enabled when using guidance.
///
/// Copied from [SteeringMotorStatus].
@ProviderFor(SteeringMotorStatus)
final steeringMotorStatusProvider =
    AutoDisposeNotifierProvider<SteeringMotorStatus, MotorStatus?>.internal(
  SteeringMotorStatus.new,
  name: r'steeringMotorStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStatus = AutoDisposeNotifier<MotorStatus?>;
String _$steeringMotorCurrentScaleHash() =>
    r'c52c0596ac876f4cccc91c963754d01926e29977';

/// A provider for the steering motor Stallguard reading.
///
/// Copied from [SteeringMotorCurrentScale].
@ProviderFor(SteeringMotorCurrentScale)
final steeringMotorCurrentScaleProvider =
    AutoDisposeNotifierProvider<SteeringMotorCurrentScale, int?>.internal(
  SteeringMotorCurrentScale.new,
  name: r'steeringMotorCurrentScaleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorCurrentScaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorCurrentScale = AutoDisposeNotifier<int?>;
String _$steeringMotorStallguardHash() =>
    r'7a84b1dd93fc377020cb3512aaffd8394c3878af';

/// A provider for the steering motor Stallguard reading.
///
/// Copied from [SteeringMotorStallguard].
@ProviderFor(SteeringMotorStallguard)
final steeringMotorStallguardProvider =
    AutoDisposeNotifierProvider<SteeringMotorStallguard, int?>.internal(
  SteeringMotorStallguard.new,
  name: r'steeringMotorStallguardProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStallguardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStallguard = AutoDisposeNotifier<int?>;
String _$steeringMotorEnableCalibrationHash() =>
    r'62ac03a0e427369fe607e45dae029cf7150f9c41';

/// A provider whether the steering motor should be in calibration mode.
///
/// Copied from [SteeringMotorEnableCalibration].
@ProviderFor(SteeringMotorEnableCalibration)
final steeringMotorEnableCalibrationProvider =
    NotifierProvider<SteeringMotorEnableCalibration, bool>.internal(
  SteeringMotorEnableCalibration.new,
  name: r'steeringMotorEnableCalibrationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorEnableCalibrationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorEnableCalibration = Notifier<bool>;
String _$steeringMotorRotationHash() =>
    r'11750d94c0a381b6e1fd0d1e79f96325d479df5a';

/// A provider for the current rotational position of the steering motor.
///
/// Copied from [SteeringMotorRotation].
@ProviderFor(SteeringMotorRotation)
final steeringMotorRotationProvider =
    AutoDisposeNotifierProvider<SteeringMotorRotation, double?>.internal(
  SteeringMotorRotation.new,
  name: r'steeringMotorRotationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorRotationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorRotation = AutoDisposeNotifier<double?>;
String _$steeringMotorTargetRotationHash() =>
    r'eedd69cbbcb7501f6885b762dd8d863afedd121c';

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.
///
/// Copied from [SteeringMotorTargetRotation].
@ProviderFor(SteeringMotorTargetRotation)
final steeringMotorTargetRotationProvider =
    AutoDisposeNotifierProvider<SteeringMotorTargetRotation, double?>.internal(
  SteeringMotorTargetRotation.new,
  name: r'steeringMotorTargetRotationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorTargetRotationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorTargetRotation = AutoDisposeNotifier<double?>;
String _$steeringMotorStepsPerWasIncrementMinToCenterHash() =>
    r'a1f4849d6caaacc84c516944ca07db181f0b641f';

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.
///
/// Copied from [SteeringMotorStepsPerWasIncrementMinToCenter].
@ProviderFor(SteeringMotorStepsPerWasIncrementMinToCenter)
final steeringMotorStepsPerWasIncrementMinToCenterProvider =
    AutoDisposeNotifierProvider<SteeringMotorStepsPerWasIncrementMinToCenter,
        double?>.internal(
  SteeringMotorStepsPerWasIncrementMinToCenter.new,
  name: r'steeringMotorStepsPerWasIncrementMinToCenterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStepsPerWasIncrementMinToCenterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStepsPerWasIncrementMinToCenter
    = AutoDisposeNotifier<double?>;
String _$steeringMotorStepsPerWasIncrementCenterToMaxHash() =>
    r'e933f5c3156df444f449bdb7731ca19e392e5806';

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.
///
/// Copied from [SteeringMotorStepsPerWasIncrementCenterToMax].
@ProviderFor(SteeringMotorStepsPerWasIncrementCenterToMax)
final steeringMotorStepsPerWasIncrementCenterToMaxProvider =
    AutoDisposeNotifierProvider<SteeringMotorStepsPerWasIncrementCenterToMax,
        double?>.internal(
  SteeringMotorStepsPerWasIncrementCenterToMax.new,
  name: r'steeringMotorStepsPerWasIncrementCenterToMaxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStepsPerWasIncrementCenterToMaxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStepsPerWasIncrementCenterToMax
    = AutoDisposeNotifier<double?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
