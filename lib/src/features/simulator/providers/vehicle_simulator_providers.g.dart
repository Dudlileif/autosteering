// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_simulator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simVehicleDrivingHash() => r'db7b25f8888abae70ca3c4192e40765778f87687';

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
///
/// Copied from [simVehicleDriving].
@ProviderFor(simVehicleDriving)
final simVehicleDrivingProvider = AutoDisposeProvider<void>.internal(
  simVehicleDriving,
  name: r'simVehicleDrivingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleDrivingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimVehicleDrivingRef = AutoDisposeProviderRef<void>;
String _$simVehicleWebStreamHash() =>
    r'7386e17a025dfc5c273591ce7150114193458da8';

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
///
/// Copied from [simVehicleWebStream].
@ProviderFor(simVehicleWebStream)
final simVehicleWebStreamProvider =
    AutoDisposeStreamProvider<Vehicle?>.internal(
  simVehicleWebStream,
  name: r'simVehicleWebStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleWebStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimVehicleWebStreamRef = AutoDisposeStreamProviderRef<Vehicle?>;
String _$simVehicleIsolateStreamHash() =>
    r'0bae406f6e8eb06d9e4ee3c1c9af1e66cda4fb0d';

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
///
/// Copied from [simVehicleIsolateStream].
@ProviderFor(simVehicleIsolateStream)
final simVehicleIsolateStreamProvider =
    AutoDisposeStreamProvider<Vehicle>.internal(
  simVehicleIsolateStream,
  name: r'simVehicleIsolateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleIsolateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimVehicleIsolateStreamRef = AutoDisposeStreamProviderRef<Vehicle>;
String _$simInputHash() => r'9c4794614e6f6395f9b5fa233c4c4a9dbb38243f';

/// A provider used to send vehicle input data to the simulation thread/worker.
///
/// It will automatically select the right type of thread/worker depending
/// on the platform.
///
/// Copied from [SimInput].
@ProviderFor(SimInput)
final simInputProvider = NotifierProvider<SimInput, SimPlatform>.internal(
  SimInput.new,
  name: r'simInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$simInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimInput = Notifier<SimPlatform>;
String _$simVehicleIsolatePortHash() =>
    r'2d97a0640c019e8c43506747a04eac2dcab1c5c4';

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
///
/// Copied from [_SimVehicleIsolatePort].
@ProviderFor(_SimVehicleIsolatePort)
final _simVehicleIsolatePortProvider =
    NotifierProvider<_SimVehicleIsolatePort, SendPort?>.internal(
  _SimVehicleIsolatePort.new,
  name: r'_simVehicleIsolatePortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleIsolatePortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleIsolatePort = Notifier<SendPort?>;
String _$simVehicleWebInputHash() =>
    r'fa42aa4d307021c610da4f894436f6920fe30f8f';

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
///
/// Copied from [_SimVehicleWebInput].
@ProviderFor(_SimVehicleWebInput)
final _simVehicleWebInputProvider =
    NotifierProvider<_SimVehicleWebInput, StreamController<dynamic>>.internal(
  _SimVehicleWebInput.new,
  name: r'_simVehicleWebInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleWebInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleWebInput = Notifier<StreamController<dynamic>>;
String _$simVehicleAutoCenterSteeringHash() =>
    r'f0ef7498715fdcc0908fb2e5b867129c8484496d';

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
///
/// Copied from [SimVehicleAutoCenterSteering].
@ProviderFor(SimVehicleAutoCenterSteering)
final simVehicleAutoCenterSteeringProvider =
    NotifierProvider<SimVehicleAutoCenterSteering, bool>.internal(
  SimVehicleAutoCenterSteering.new,
  name: r'simVehicleAutoCenterSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleAutoCenterSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleAutoCenterSteering = Notifier<bool>;
String _$simVehicleAutoSlowDownHash() =>
    r'e6f8146e571d296065971b3becfe1d53cb094a56';

/// A provider for whether the vehicle should slow down when no input is
/// provided.
///
/// Copied from [SimVehicleAutoSlowDown].
@ProviderFor(SimVehicleAutoSlowDown)
final simVehicleAutoSlowDownProvider =
    NotifierProvider<SimVehicleAutoSlowDown, bool>.internal(
  SimVehicleAutoSlowDown.new,
  name: r'simVehicleAutoSlowDownProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleAutoSlowDownHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleAutoSlowDown = Notifier<bool>;
String _$simVehicleAcceleratorHash() =>
    r'e8da7b1b6fbb05294a32a70630edeced11659c01';

/// A provider for accelerating the vehicle in the simulator, typically
/// used by hotkeys/keyboard.
///
/// Copied from [SimVehicleAccelerator].
@ProviderFor(SimVehicleAccelerator)
final simVehicleAcceleratorProvider =
    NotifierProvider<SimVehicleAccelerator, Timer?>.internal(
  SimVehicleAccelerator.new,
  name: r'simVehicleAcceleratorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleAcceleratorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleAccelerator = Notifier<Timer?>;
String _$simVehicleSteeringHash() =>
    r'5cd25e089212adb51e8bab1946d71f14779d6ba1';

/// A provider for steering the vehicle in the simulator, typically
/// used by hotkeys/keyboard.
///
/// Copied from [SimVehicleSteering].
@ProviderFor(SimVehicleSteering)
final simVehicleSteeringProvider =
    NotifierProvider<SimVehicleSteering, Timer?>.internal(
  SimVehicleSteering.new,
  name: r'simVehicleSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleSteering = Notifier<Timer?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
