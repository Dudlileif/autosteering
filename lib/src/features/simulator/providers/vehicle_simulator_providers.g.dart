// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_simulator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simVehicleDrivingHash() => r'be56dc171d561aa46a385205a2d4bf764406ac8f';

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
///
/// Copied from [simVehicleDriving].
@ProviderFor(simVehicleDriving)
final simVehicleDrivingProvider = AutoDisposeFutureProvider<void>.internal(
  simVehicleDriving,
  name: r'simVehicleDrivingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleDrivingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimVehicleDrivingRef = AutoDisposeFutureProviderRef<void>;
String _$simVehicleWebStreamHash() =>
    r'a80d35d1c3096960f294753353308dcadfe3dc50';

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
    r'122e29af528cd2dc0aa4d889f99bcbb9708fd552';

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
String _$simVehicleInputHash() => r'6d3e54cc2067bd06966437f73a29c17e318ccc68';

/// A provider used to send vehicle input data to the simulation thread/worker.
///
/// It will automatically select the right type of thread/worker depending
/// on the platform.
///
/// Copied from [SimVehicleInput].
@ProviderFor(SimVehicleInput)
final simVehicleInputProvider =
    NotifierProvider<SimVehicleInput, SimPlatform>.internal(
  SimVehicleInput.new,
  name: r'simVehicleInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simVehicleInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimVehicleInput = Notifier<SimPlatform>;
String _$simVehicleIsolatePortHash() =>
    r'2d97a0640c019e8c43506747a04eac2dcab1c5c4';

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimVehicleInput].
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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
