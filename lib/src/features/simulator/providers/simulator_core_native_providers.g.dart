// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_native_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for sending messages to the [SimulatorCore].

@ProviderFor(SimInput)
final simInputProvider = SimInputProvider._();

/// A provider for sending messages to the [SimulatorCore].
final class SimInputProvider extends $NotifierProvider<SimInput, void> {
  /// A provider for sending messages to the [SimulatorCore].
  SimInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simInputHash();

  @$internal
  @override
  SimInput create() => SimInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$simInputHash() => r'dfc8c3fc330abaece77b1bf54227fab9a59ac2d9';

/// A provider for sending messages to the [SimulatorCore].

abstract class _$SimInput extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for keeping the isolate [SendPort] when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].

@ProviderFor(_SimCoreIsolatePort)
final _simCoreIsolatePortProvider = _SimCoreIsolatePortProvider._();

/// A provider for keeping the isolate [SendPort] when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
final class _SimCoreIsolatePortProvider
    extends $NotifierProvider<_SimCoreIsolatePort, SendPort?> {
  /// A provider for keeping the isolate [SendPort] when working on a
  /// native platform. Vehicle inputs gets directed here from [SimInput].
  _SimCoreIsolatePortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_simCoreIsolatePortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_simCoreIsolatePortHash();

  @$internal
  @override
  _SimCoreIsolatePort create() => _SimCoreIsolatePort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendPort? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendPort?>(value),
    );
  }
}

String _$_simCoreIsolatePortHash() =>
    r'b6be1600be89e864fec6a4dd14b09f95f9144126';

/// A provider for keeping the isolate [SendPort] when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].

abstract class _$SimCoreIsolatePort extends $Notifier<SendPort?> {
  SendPort? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SendPort?, SendPort?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SendPort?, SendPort?>,
              SendPort?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.

@ProviderFor(simCoreIsolateStream)
final simCoreIsolateStreamProvider = SimCoreIsolateStreamProvider._();

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.

final class SimCoreIsolateStreamProvider
    extends $FunctionalProvider<AsyncValue<Vehicle>, Vehicle, Stream<Vehicle>>
    with $FutureModifier<Vehicle>, $StreamProvider<Vehicle> {
  /// A provider that creates a stream and watches the vehicle simulator on the
  /// native platforms.
  ///
  /// It will update the stream with vehicle updates from the simulator and also
  /// update the vehicle gauge providers.
  SimCoreIsolateStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreIsolateStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreIsolateStreamHash();

  @$internal
  @override
  $StreamProviderElement<Vehicle> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Vehicle> create(Ref ref) {
    return simCoreIsolateStream(ref);
  }
}

String _$simCoreIsolateStreamHash() =>
    r'5c27c66fca1bf1b085dbcae25f3e7861d2fc2441';

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.

@ProviderFor(simCoreVehicleDriving)
final simCoreVehicleDrivingProvider = SimCoreVehicleDrivingProvider._();

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.

final class SimCoreVehicleDrivingProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider that watches the simulated vehicle and updates the map
  /// position when necessary.
  SimCoreVehicleDrivingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreVehicleDrivingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreVehicleDrivingHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return simCoreVehicleDriving(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$simCoreVehicleDrivingHash() =>
    r'2aee37a2af6fc4a14587a4c5231ed6a351b7798c';
