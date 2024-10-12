// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_web_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simCoreWebStreamHash() => r'350a25d1fb2561279c32b956f3f49383106aca0b';

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
///
/// Copied from [simCoreWebStream].
@ProviderFor(simCoreWebStream)
final simCoreWebStreamProvider = AutoDisposeStreamProvider<Vehicle?>.internal(
  simCoreWebStream,
  name: r'simCoreWebStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreWebStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreWebStreamRef = AutoDisposeStreamProviderRef<Vehicle?>;
String _$simCoreVehicleDrivingHash() =>
    r'1fc03040c3c55c1d47bad8a1a8a81a6d5d74f7b3';

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
///
/// Copied from [simCoreVehicleDriving].
@ProviderFor(simCoreVehicleDriving)
final simCoreVehicleDrivingProvider = AutoDisposeProvider<void>.internal(
  simCoreVehicleDriving,
  name: r'simCoreVehicleDrivingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreVehicleDrivingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreVehicleDrivingRef = AutoDisposeProviderRef<void>;
String _$simCoreIsolateStreamHash() =>
    r'5ffe8cc4ca7532de5a44eb35c6869b2c72304992';

/// A dummy provider for the web version.
///
/// Copied from [simCoreIsolateStream].
@ProviderFor(simCoreIsolateStream)
final simCoreIsolateStreamProvider = AutoDisposeProvider<void>.internal(
  simCoreIsolateStream,
  name: r'simCoreIsolateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreIsolateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreIsolateStreamRef = AutoDisposeProviderRef<void>;
String _$simInputHash() => r'4d390ed2088f9822ccd8b5506a1fe72782489f0e';

/// A provider for sending messages to the [SimulatorCore].
///
/// Copied from [SimInput].
@ProviderFor(SimInput)
final simInputProvider = NotifierProvider<SimInput, void>.internal(
  SimInput.new,
  name: r'simInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$simInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimInput = Notifier<void>;
String _$simCoreWebInputHash() => r'e321c8dbf06b3976a8e978ad67efc7facd9f8e17';

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
///
/// Copied from [_SimCoreWebInput].
@ProviderFor(_SimCoreWebInput)
final _simCoreWebInputProvider =
    NotifierProvider<_SimCoreWebInput, StreamController<dynamic>>.internal(
  _SimCoreWebInput.new,
  name: r'_simCoreWebInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreWebInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreWebInput = Notifier<StreamController<dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
