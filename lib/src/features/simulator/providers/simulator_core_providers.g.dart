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
String _$initializeSimCoreHash() => r'1ae9a7d60ad25aab1eb337d77bae209a1506f648';

/// Sends initial parameters to  the sim core.
///
/// Copied from [_initializeSimCore].
@ProviderFor(_initializeSimCore)
final _initializeSimCoreProvider = AutoDisposeProvider<void>.internal(
  _initializeSimCore,
  name: r'_initializeSimCoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initializeSimCoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _InitializeSimCoreRef = AutoDisposeProviderRef<void>;
String _$simCoreWebStreamHash() => r'3d093a0a5d8cb189e9129eed03269add826f306a';

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
    r'd375c8d6962b3b5646c22bb03c8eb8b6f1172cae';

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
String _$simInputHash() => r'65f035ef813a68d16247eaac30516c9fc57895f9';

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
    r'2cf09d1f8eab081032c86565cd2b830a0e335cab';

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
String _$simCoreWebInputHash() => r'f4a93494026dd13f1138a894b7a23f84cf39c9de';

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
String _$simCoreDebugAllowLongBreaksHash() =>
    r'f53980f91f616f7793d52dd2332281cab8661f26';

/// A provider for whether long breaks in the program (i.e. when using
/// breakpoints) should be allowed and not restart the sim core in
/// debug mode.
///
/// Copied from [SimCoreDebugAllowLongBreaks].
@ProviderFor(SimCoreDebugAllowLongBreaks)
final simCoreDebugAllowLongBreaksProvider =
    NotifierProvider<SimCoreDebugAllowLongBreaks, bool>.internal(
  SimCoreDebugAllowLongBreaks.new,
  name: r'simCoreDebugAllowLongBreaksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreDebugAllowLongBreaksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreDebugAllowLongBreaks = Notifier<bool>;
String _$simCoreAllowManualInputHash() =>
    r'6d5c8c79ee57841155736403f685c88f7587f39e';

/// A provider for whether the sim core should allow manual inputs from the
/// user, i.e. not only sensors from the vehicle.
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
    r'0d48d6d46f67170250b16d9a8bc0b1dd43d0cc6b';

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
    r'daeeb925351e6d9b780309d0afe5556b2913705b';

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
