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
String _$initializeSimCoreHash() => r'1e8d9724c0f4960984958766a3c29cb25c30691f';

/// Sends initial parameters to  the sim core.
///
/// Copied from [initializeSimCore].
@ProviderFor(initializeSimCore)
final initializeSimCoreProvider = AutoDisposeProvider<void>.internal(
  initializeSimCore,
  name: r'initializeSimCoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initializeSimCoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InitializeSimCoreRef = AutoDisposeProviderRef<void>;
String _$commonSimCoreMessageHandlerHash() =>
    r'bd18013072afeb938d1f5ea60f6343da59c51eef';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for handling the common sim core messages for the state of the
/// simulation.
///
/// Copied from [commonSimCoreMessageHandler].
@ProviderFor(commonSimCoreMessageHandler)
const commonSimCoreMessageHandlerProvider = CommonSimCoreMessageHandlerFamily();

/// A provider for handling the common sim core messages for the state of the
/// simulation.
///
/// Copied from [commonSimCoreMessageHandler].
class CommonSimCoreMessageHandlerFamily extends Family {
  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  ///
  /// Copied from [commonSimCoreMessageHandler].
  const CommonSimCoreMessageHandlerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commonSimCoreMessageHandlerProvider';

  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  ///
  /// Copied from [commonSimCoreMessageHandler].
  CommonSimCoreMessageHandlerProvider call(
    ({
      Vehicle? vehicle,
      num velocity,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      bool hardwareIsConnected
    }) message,
  ) {
    return CommonSimCoreMessageHandlerProvider(
      message,
    );
  }

  @visibleForOverriding
  @override
  CommonSimCoreMessageHandlerProvider getProviderOverride(
    covariant CommonSimCoreMessageHandlerProvider provider,
  ) {
    return call(
      provider.message,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      void Function(CommonSimCoreMessageHandlerRef ref) create) {
    return _$CommonSimCoreMessageHandlerFamilyOverride(this, create);
  }
}

class _$CommonSimCoreMessageHandlerFamilyOverride implements FamilyOverride {
  _$CommonSimCoreMessageHandlerFamilyOverride(
      this.overriddenFamily, this.create);

  final void Function(CommonSimCoreMessageHandlerRef ref) create;

  @override
  final CommonSimCoreMessageHandlerFamily overriddenFamily;

  @override
  CommonSimCoreMessageHandlerProvider getProviderOverride(
    covariant CommonSimCoreMessageHandlerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for handling the common sim core messages for the state of the
/// simulation.
///
/// Copied from [commonSimCoreMessageHandler].
class CommonSimCoreMessageHandlerProvider extends AutoDisposeProvider<void> {
  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  ///
  /// Copied from [commonSimCoreMessageHandler].
  CommonSimCoreMessageHandlerProvider(
    ({
      Vehicle? vehicle,
      num velocity,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      bool hardwareIsConnected
    }) message,
  ) : this._internal(
          (ref) => commonSimCoreMessageHandler(
            ref as CommonSimCoreMessageHandlerRef,
            message,
          ),
          from: commonSimCoreMessageHandlerProvider,
          name: r'commonSimCoreMessageHandlerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commonSimCoreMessageHandlerHash,
          dependencies: CommonSimCoreMessageHandlerFamily._dependencies,
          allTransitiveDependencies:
              CommonSimCoreMessageHandlerFamily._allTransitiveDependencies,
          message: message,
        );

  CommonSimCoreMessageHandlerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
  }) : super.internal();

  final ({
    Vehicle? vehicle,
    num velocity,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    bool hardwareIsConnected
  }) message;

  @override
  Override overrideWith(
    void Function(CommonSimCoreMessageHandlerRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommonSimCoreMessageHandlerProvider._internal(
        (ref) => create(ref as CommonSimCoreMessageHandlerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        message: message,
      ),
    );
  }

  @override
  (
    ({
      Vehicle? vehicle,
      num velocity,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      bool hardwareIsConnected
    }),
  ) get argument {
    return (message,);
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _CommonSimCoreMessageHandlerProviderElement(this);
  }

  CommonSimCoreMessageHandlerProvider _copyWith(
    void Function(CommonSimCoreMessageHandlerRef ref) create,
  ) {
    return CommonSimCoreMessageHandlerProvider._internal(
      (ref) => create(ref as CommonSimCoreMessageHandlerRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      message: message,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommonSimCoreMessageHandlerProvider &&
        other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommonSimCoreMessageHandlerRef on AutoDisposeProviderRef<void> {
  /// The parameter `message` of this provider.
  ({
    Vehicle? vehicle,
    num velocity,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    bool hardwareIsConnected
  }) get message;
}

class _CommonSimCoreMessageHandlerProviderElement
    extends AutoDisposeProviderElement<void>
    with CommonSimCoreMessageHandlerRef {
  _CommonSimCoreMessageHandlerProviderElement(super.provider);

  @override
  ({
    Vehicle? vehicle,
    num velocity,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    bool hardwareIsConnected
  }) get message => (origin as CommonSimCoreMessageHandlerProvider).message;
}

String _$simulatorUpdateFrequencyHash() =>
    r'd33f3a9784212dae5ecc5fd62cea7c40d13ee8f2';

/// A provider for the target simulation update frequency.
///
/// Copied from [SimulatorUpdateFrequency].
@ProviderFor(SimulatorUpdateFrequency)
final simulatorUpdateFrequencyProvider =
    NotifierProvider<SimulatorUpdateFrequency, int>.internal(
  SimulatorUpdateFrequency.new,
  name: r'simulatorUpdateFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simulatorUpdateFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimulatorUpdateFrequency = Notifier<int>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
