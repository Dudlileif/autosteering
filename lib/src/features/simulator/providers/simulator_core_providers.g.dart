// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendMessagesToHardwareHash() =>
    r'139814ce487ed859535b886067e87e51fd310660';

/// A provider for whether we should send messages to the hardware.
///
/// Copied from [sendMessagesToHardware].
@ProviderFor(sendMessagesToHardware)
final sendMessagesToHardwareProvider = AutoDisposeProvider<bool>.internal(
  sendMessagesToHardware,
  name: r'sendMessagesToHardwareProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendMessagesToHardwareHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SendMessagesToHardwareRef = AutoDisposeProviderRef<bool>;
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
String _$initializeSimCoreHash() => r'3fb7254a2d7d2a89f9b422b05dcf20907f6a0712';

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
String _$simCoreWebStreamHash() => r'2255bc683e20fe29672f43438b194a86a0c78d9b';

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
    r'18d195950d32166474f38f46b64c52192953e831';

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
String _$simInputHash() => r'febc933bd84e5bd518cebd4caf8fe8ebf3506abb';

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
String _$sendMessagesToHardwareIfNetworkHash() =>
    r'6d7cdb5fd546be2709271925379a3056e929aadf';

/// A provider for whether we should send messages to the hardware from the
/// Simulator Core when network is available, see [networkAvailable].
///
/// Copied from [SendMessagesToHardwareIfNetwork].
@ProviderFor(SendMessagesToHardwareIfNetwork)
final sendMessagesToHardwareIfNetworkProvider =
    NotifierProvider<SendMessagesToHardwareIfNetwork, bool>.internal(
  SendMessagesToHardwareIfNetwork.new,
  name: r'sendMessagesToHardwareIfNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendMessagesToHardwareIfNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendMessagesToHardwareIfNetwork = Notifier<bool>;
String _$simCoreIsolatePortHash() =>
    r'a1f214c5b2285183a8bffac6fb49c45d592b0d83';

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
String _$simCoreAllowInterpolationHash() =>
    r'62d3d9034ad5436e5e2df9e507b2c2096755b1e1';

/// A provider for whether the sim core should allow interpolation steps
/// between the hardware GNSS updates.
///
/// Copied from [SimCoreAllowInterpolation].
@ProviderFor(SimCoreAllowInterpolation)
final simCoreAllowInterpolationProvider =
    NotifierProvider<SimCoreAllowInterpolation, bool>.internal(
  SimCoreAllowInterpolation.new,
  name: r'simCoreAllowInterpolationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreAllowInterpolationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreAllowInterpolation = Notifier<bool>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
