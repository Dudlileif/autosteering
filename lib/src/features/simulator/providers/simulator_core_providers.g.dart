// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the target simulation update frequency.

@ProviderFor(SimulatorUpdateFrequency)
final simulatorUpdateFrequencyProvider = SimulatorUpdateFrequencyProvider._();

/// A provider for the target simulation update frequency.
final class SimulatorUpdateFrequencyProvider
    extends $NotifierProvider<SimulatorUpdateFrequency, int> {
  /// A provider for the target simulation update frequency.
  SimulatorUpdateFrequencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simulatorUpdateFrequencyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simulatorUpdateFrequencyHash();

  @$internal
  @override
  SimulatorUpdateFrequency create() => SimulatorUpdateFrequency();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$simulatorUpdateFrequencyHash() =>
    r'243ddb12de06609631629d1655e12c7d0b5816f5';

/// A provider for the target simulation update frequency.

abstract class _$SimulatorUpdateFrequency extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Sends initial parameters to the sim core.

@ProviderFor(initializeSimCore)
final initializeSimCoreProvider = InitializeSimCoreProvider._();

/// Sends initial parameters to the sim core.

final class InitializeSimCoreProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Sends initial parameters to the sim core.
  InitializeSimCoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeSimCoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeSimCoreHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return initializeSimCore(ref);
  }
}

String _$initializeSimCoreHash() => r'c9d8d9e5da06776956f76909b67bd925482137ed';

/// A provider for handling the common sim core messages for the state of the
/// simulation.

@ProviderFor(commonSimCoreMessageHandler)
final commonSimCoreMessageHandlerProvider =
    CommonSimCoreMessageHandlerFamily._();

/// A provider for handling the common sim core messages for the state of the
/// simulation.

final class CommonSimCoreMessageHandlerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for handling the common sim core messages for the state of the
  /// simulation.
  CommonSimCoreMessageHandlerProvider._({
    required CommonSimCoreMessageHandlerFamily super.from,
    required ({
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      Vehicle? vehicle,
      num velocity,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'commonSimCoreMessageHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commonSimCoreMessageHandlerHash();

  @override
  String toString() {
    return r'commonSimCoreMessageHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    final argument =
        this.argument
            as ({
              ABTracking? abTracking,
              AutosteeringState autosteeringState,
              num bearing,
              num distance,
              PathTracking? pathTracking,
              Vehicle? vehicle,
              num velocity,
            });
    return commonSimCoreMessageHandler(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommonSimCoreMessageHandlerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commonSimCoreMessageHandlerHash() =>
    r'2c49713add585966458e235a78b8ce41b0f480d9';

/// A provider for handling the common sim core messages for the state of the
/// simulation.

final class CommonSimCoreMessageHandlerFamily extends $Family
    with
        $FunctionalFamilyOverride<
          void,
          ({
            ABTracking? abTracking,
            AutosteeringState autosteeringState,
            num bearing,
            num distance,
            PathTracking? pathTracking,
            Vehicle? vehicle,
            num velocity,
          })
        > {
  CommonSimCoreMessageHandlerFamily._()
    : super(
        retry: null,
        name: r'commonSimCoreMessageHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for handling the common sim core messages for the state of the
  /// simulation.

  CommonSimCoreMessageHandlerProvider call(
    ({
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      Vehicle? vehicle,
      num velocity,
    })
    message,
  ) => CommonSimCoreMessageHandlerProvider._(argument: message, from: this);

  @override
  String toString() => r'commonSimCoreMessageHandlerProvider';
}

/// A provider for whether long breaks in the program (i.e. when using
/// breakpoints) should be allowed and not restart the sim core in
/// debug mode.

@ProviderFor(SimCoreDebugAllowLongBreaks)
final simCoreDebugAllowLongBreaksProvider =
    SimCoreDebugAllowLongBreaksProvider._();

/// A provider for whether long breaks in the program (i.e. when using
/// breakpoints) should be allowed and not restart the sim core in
/// debug mode.
final class SimCoreDebugAllowLongBreaksProvider
    extends $NotifierProvider<SimCoreDebugAllowLongBreaks, bool> {
  /// A provider for whether long breaks in the program (i.e. when using
  /// breakpoints) should be allowed and not restart the sim core in
  /// debug mode.
  SimCoreDebugAllowLongBreaksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreDebugAllowLongBreaksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreDebugAllowLongBreaksHash();

  @$internal
  @override
  SimCoreDebugAllowLongBreaks create() => SimCoreDebugAllowLongBreaks();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$simCoreDebugAllowLongBreaksHash() =>
    r'f53980f91f616f7793d52dd2332281cab8661f26';

/// A provider for whether long breaks in the program (i.e. when using
/// breakpoints) should be allowed and not restart the sim core in
/// debug mode.

abstract class _$SimCoreDebugAllowLongBreaks extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the sim core should allow manual inputs from the
/// user, i.e. not only sensors from the vehicle.

@ProviderFor(SimCoreAllowManualInput)
final simCoreAllowManualInputProvider = SimCoreAllowManualInputProvider._();

/// A provider for whether the sim core should allow manual inputs from the
/// user, i.e. not only sensors from the vehicle.
final class SimCoreAllowManualInputProvider
    extends $NotifierProvider<SimCoreAllowManualInput, bool> {
  /// A provider for whether the sim core should allow manual inputs from the
  /// user, i.e. not only sensors from the vehicle.
  SimCoreAllowManualInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreAllowManualInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreAllowManualInputHash();

  @$internal
  @override
  SimCoreAllowManualInput create() => SimCoreAllowManualInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$simCoreAllowManualInputHash() =>
    r'2ee429d37ec0314b613ab9c199e5990a6079793e';

/// A provider for whether the sim core should allow manual inputs from the
/// user, i.e. not only sensors from the vehicle.

abstract class _$SimCoreAllowManualInput extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the sim core should allow interpolation steps
/// between the hardware GNSS updates.

@ProviderFor(SimCoreAllowInterpolation)
final simCoreAllowInterpolationProvider = SimCoreAllowInterpolationProvider._();

/// A provider for whether the sim core should allow interpolation steps
/// between the hardware GNSS updates.
final class SimCoreAllowInterpolationProvider
    extends $NotifierProvider<SimCoreAllowInterpolation, bool> {
  /// A provider for whether the sim core should allow interpolation steps
  /// between the hardware GNSS updates.
  SimCoreAllowInterpolationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreAllowInterpolationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreAllowInterpolationHash();

  @$internal
  @override
  SimCoreAllowInterpolation create() => SimCoreAllowInterpolation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$simCoreAllowInterpolationHash() =>
    r'a44091c788f2ebfc7487dc11bb8cad2b9a526772';

/// A provider for whether the sim core should allow interpolation steps
/// between the hardware GNSS updates.

abstract class _$SimCoreAllowInterpolation extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the steering automatically should recenter when
/// no input is provided.

@ProviderFor(SimCoreVehicleAutoCenterSteering)
final simCoreVehicleAutoCenterSteeringProvider =
    SimCoreVehicleAutoCenterSteeringProvider._();

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
final class SimCoreVehicleAutoCenterSteeringProvider
    extends $NotifierProvider<SimCoreVehicleAutoCenterSteering, bool> {
  /// A provider for whether the steering automatically should recenter when
  /// no input is provided.
  SimCoreVehicleAutoCenterSteeringProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreVehicleAutoCenterSteeringProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreVehicleAutoCenterSteeringHash();

  @$internal
  @override
  SimCoreVehicleAutoCenterSteering create() =>
      SimCoreVehicleAutoCenterSteering();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$simCoreVehicleAutoCenterSteeringHash() =>
    r'4796bcf08585c70c193cf82df4fb693dc16be643';

/// A provider for whether the steering automatically should recenter when
/// no input is provided.

abstract class _$SimCoreVehicleAutoCenterSteering extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the vehicle should slow down when no input is
/// provided.

@ProviderFor(SimCoreVehicleAutoSlowDown)
final simCoreVehicleAutoSlowDownProvider =
    SimCoreVehicleAutoSlowDownProvider._();

/// A provider for whether the vehicle should slow down when no input is
/// provided.
final class SimCoreVehicleAutoSlowDownProvider
    extends $NotifierProvider<SimCoreVehicleAutoSlowDown, bool> {
  /// A provider for whether the vehicle should slow down when no input is
  /// provided.
  SimCoreVehicleAutoSlowDownProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreVehicleAutoSlowDownProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreVehicleAutoSlowDownHash();

  @$internal
  @override
  SimCoreVehicleAutoSlowDown create() => SimCoreVehicleAutoSlowDown();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$simCoreVehicleAutoSlowDownHash() =>
    r'183d2cfaf7042551c3c3b097ee622884f3c2cc46';

/// A provider for whether the vehicle should slow down when no input is
/// provided.

abstract class _$SimCoreVehicleAutoSlowDown extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
