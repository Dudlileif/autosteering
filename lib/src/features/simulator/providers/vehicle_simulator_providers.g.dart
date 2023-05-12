// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_simulator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simVehicleDrivingHash() => r'be56dc171d561aa46a385205a2d4bf764406ac8f';

/// See also [simVehicleDriving].
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
    r'35ebf1c032255d3ecf3607822e014716d2d434a4';

/// See also [simVehicleWebStream].
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
    r'b8ecf3600509e91f9a36ec2d3064ad28193ba589';

/// See also [simVehicleIsolateStream].
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

/// See also [SimVehicleInput].
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

/// See also [_SimVehicleIsolatePort].
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

/// See also [_SimVehicleWebInput].
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
