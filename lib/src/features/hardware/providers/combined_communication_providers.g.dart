// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_communication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$combinedNativeNetworkHash() =>
    r'67b9afa8853d06cca0e46cec44221dd29a179aaa';

/// A provider for combining the native network providers that need to be
/// watched.
///
/// Copied from [_combinedNativeNetwork].
@ProviderFor(_combinedNativeNetwork)
final _combinedNativeNetworkProvider = AutoDisposeProvider<void>.internal(
  _combinedNativeNetwork,
  name: r'_combinedNativeNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedNativeNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _CombinedNativeNetworkRef = AutoDisposeProviderRef<void>;
String _$combinedSerialHash() => r'1be0dcfb897a650492502310a5db5e310c1d7e33';

/// A provider for combining the serial providers that need to be watched.
///
/// Copied from [_combinedSerial].
@ProviderFor(_combinedSerial)
final _combinedSerialProvider = AutoDisposeProvider<void>.internal(
  _combinedSerial,
  name: r'_combinedSerialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _CombinedSerialRef = AutoDisposeProviderRef<void>;
String _$combinedCommunicationHash() =>
    r'f6ce77d9e09ccdefcc66af725ce9983d77bf6c94';

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.
///
/// Copied from [combinedCommunication].
@ProviderFor(combinedCommunication)
final combinedCommunicationProvider = AutoDisposeProvider<void>.internal(
  combinedCommunication,
  name: r'combinedCommunicationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedCommunicationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CombinedCommunicationRef = AutoDisposeProviderRef<void>;
String _$hardwareAliveHash() => r'158f328c1db19e884059d53dec8cce39bb60c838';

/// A provider for whether any hardware is connected and communicating with
/// us.
///
/// Copied from [hardwareAlive].
@ProviderFor(hardwareAlive)
final hardwareAliveProvider = AutoDisposeProvider<bool>.internal(
  hardwareAlive,
  name: r'hardwareAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareAliveRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter