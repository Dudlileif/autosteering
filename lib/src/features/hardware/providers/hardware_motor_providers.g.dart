// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_motor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$steeringMotorTargetRPMHash() =>
    r'0874dfc1c524044c70b77638b9aaa3c648c98bed';

/// A provider for the target steering motor rpm when using guidance.
///
/// Copied from [SteeringMotorTargetRPM].
@ProviderFor(SteeringMotorTargetRPM)
final steeringMotorTargetRPMProvider =
    AutoDisposeNotifierProvider<SteeringMotorTargetRPM, double?>.internal(
  SteeringMotorTargetRPM.new,
  name: r'steeringMotorTargetRPMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorTargetRPMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorTargetRPM = AutoDisposeNotifier<double?>;
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
    r'64f4b3c1f6cf92e4896d87e90461ffaa99425c87';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
