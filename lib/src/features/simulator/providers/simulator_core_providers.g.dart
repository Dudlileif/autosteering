// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simCoreVehicleDrivingHash() =>
    r'8acb9b5d9174501d183dc8f36bca8474a8ac5f53';

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
String _$simCoreWebStreamHash() => r'058f68c20d1b6621b4b596a66f9f0a199d150ac6';

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
String _$simCoreIsolateStreamHash() =>
    r'5acb12447e1f9e86574abfe5e16cd4d6bfbc29b5';

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
///
/// Copied from [simCoreIsolateStream].
@ProviderFor(simCoreIsolateStream)
final simCoreIsolateStreamProvider =
    AutoDisposeStreamProvider<Vehicle>.internal(
  simCoreIsolateStream,
  name: r'simCoreIsolateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreIsolateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreIsolateStreamRef = AutoDisposeStreamProviderRef<Vehicle>;
String _$simInputHash() => r'926721dd39a10596031a61d756176822f7f2c035';

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
String _$simCoreIsolatePortHash() =>
    r'ec18ccf2fc3e7ed57eecfa5c764ddca7c3ca8f7f';

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
///
/// Copied from [_SimCoreIsolatePort].
@ProviderFor(_SimCoreIsolatePort)
final _simCoreIsolatePortProvider =
    NotifierProvider<_SimCoreIsolatePort, SendPort?>.internal(
  _SimCoreIsolatePort.new,
  name: r'_simCoreIsolatePortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreIsolatePortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreIsolatePort = Notifier<SendPort?>;
String _$simCoreWebInputHash() => r'65903b67486f8720aed32e93f7a2f2526fd8c4b6';

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
String _$simCoreAllowManualInputHash() =>
    r'2d610224146e2bb67d3cf747cc462a72a5769943';

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
///
/// Copied from [SimCoreAllowManualInput].
@ProviderFor(SimCoreAllowManualInput)
final simCoreAllowManualInputProvider =
    NotifierProvider<SimCoreAllowManualInput, bool>.internal(
  SimCoreAllowManualInput.new,
  name: r'simCoreAllowManualInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreAllowManualInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreAllowManualInput = Notifier<bool>;
String _$simCoreVehicleAutoCenterSteeringHash() =>
    r'ce2af638380722f81e78cc3406720e787cb72518';

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
///
/// Copied from [SimCoreVehicleAutoCenterSteering].
@ProviderFor(SimCoreVehicleAutoCenterSteering)
final simCoreVehicleAutoCenterSteeringProvider =
    NotifierProvider<SimCoreVehicleAutoCenterSteering, bool>.internal(
  SimCoreVehicleAutoCenterSteering.new,
  name: r'simCoreVehicleAutoCenterSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreVehicleAutoCenterSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreVehicleAutoCenterSteering = Notifier<bool>;
String _$simCoreVehicleAutoSlowDownHash() =>
    r'c5d7a66ec2ed0e6612817a991524413c67035f93';

/// A provider for whether the vehicle should slow down when no input is
/// provided.
///
/// Copied from [SimCoreVehicleAutoSlowDown].
@ProviderFor(SimCoreVehicleAutoSlowDown)
final simCoreVehicleAutoSlowDownProvider =
    NotifierProvider<SimCoreVehicleAutoSlowDown, bool>.internal(
  SimCoreVehicleAutoSlowDown.new,
  name: r'simCoreVehicleAutoSlowDownProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreVehicleAutoSlowDownHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreVehicleAutoSlowDown = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
