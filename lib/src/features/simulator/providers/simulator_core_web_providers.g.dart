// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_web_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simCoreWebStreamHash() => r'49195f61d91fcc66910d46b237bcd471f68125d4';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SimCoreWebStreamRef = AutoDisposeStreamProviderRef<Vehicle?>;
String _$simCoreVehicleDrivingHash() =>
    r'09a4fb85cdf270b1147770a36273f5dd6a0502d6';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SimCoreVehicleDrivingRef = AutoDisposeProviderRef<void>;
String _$simCoreIsolateStreamHash() =>
    r'e31e28aee2c717de9e9db7921cd374d64904e52a';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
String _$simCoreWebInputHash() => r'8f043db7433228bbd0479cd8df8b1aca0e1ddf36';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
