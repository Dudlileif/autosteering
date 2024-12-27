// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_communication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$combinedNativeNetworkHash() =>
    r'fdf61f1ce741b7a893b7d96cffc2471ce92fcd97';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _CombinedNativeNetworkRef = AutoDisposeProviderRef<void>;
String _$combinedSerialHash() => r'6ec5620fc4b903429782dd75665f56b4584cac2c';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _CombinedSerialRef = AutoDisposeProviderRef<void>;
String _$combinedCommunicationHash() =>
    r'3674c86e1684f5a867aa5868875ecc87dae318fc';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CombinedCommunicationRef = AutoDisposeProviderRef<void>;
String _$hardwareAliveHash() => r'50658d49b282388b8f604df97b9aeedf910341f7';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HardwareAliveRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
