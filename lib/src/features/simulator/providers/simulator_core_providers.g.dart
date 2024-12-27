// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initializeSimCoreHash() => r'b6782d15711cd9826e18b550b287d5e5d7f6c0c3';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitializeSimCoreRef = AutoDisposeProviderRef<void>;
String _$commonSimCoreMessageHandlerHash() =>
    r'2c49713add585966458e235a78b8ce41b0f480d9';

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
class CommonSimCoreMessageHandlerFamily extends Family<void> {
  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  ///
  /// Copied from [commonSimCoreMessageHandler].
  const CommonSimCoreMessageHandlerFamily();

  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  ///
  /// Copied from [commonSimCoreMessageHandler].
  CommonSimCoreMessageHandlerProvider call(
    ({
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      Vehicle? vehicle,
      num velocity
    }) message,
  ) {
    return CommonSimCoreMessageHandlerProvider(
      message,
    );
  }

  @override
  CommonSimCoreMessageHandlerProvider getProviderOverride(
    covariant CommonSimCoreMessageHandlerProvider provider,
  ) {
    return call(
      provider.message,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commonSimCoreMessageHandlerProvider';
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
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      Vehicle? vehicle,
      num velocity
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
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
  }) : super.internal();

  final ({
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    Vehicle? vehicle,
    num velocity
  }) message;

  @override
  Override overrideWith(
    void Function(CommonSimCoreMessageHandlerRef provider) create,
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
  AutoDisposeProviderElement<void> createElement() {
    return _CommonSimCoreMessageHandlerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommonSimCoreMessageHandlerRef on AutoDisposeProviderRef<void> {
  /// The parameter `message` of this provider.
  ({
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    Vehicle? vehicle,
    num velocity
  }) get message;
}

class _CommonSimCoreMessageHandlerProviderElement
    extends AutoDisposeProviderElement<void>
    with CommonSimCoreMessageHandlerRef {
  _CommonSimCoreMessageHandlerProviderElement(super.provider);

  @override
  ({
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    Vehicle? vehicle,
    num velocity
  }) get message => (origin as CommonSimCoreMessageHandlerProvider).message;
}

String _$simulatorUpdateFrequencyHash() =>
    r'243ddb12de06609631629d1655e12c7d0b5816f5';

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
    r'2ee429d37ec0314b613ab9c199e5990a6079793e';

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
    r'1aaf9e232d7baa934a060672734142c14272e4c7';

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
    r'4796bcf08585c70c193cf82df4fb693dc16be643';

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
    r'183d2cfaf7042551c3c3b097ee622884f3c2cc46';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
