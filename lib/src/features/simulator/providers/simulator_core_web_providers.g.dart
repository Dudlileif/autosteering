// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulator_core_web_providers.dart';

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

String _$simInputHash() => r'4d390ed2088f9822ccd8b5506a1fe72782489f0e';

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

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.

@ProviderFor(_SimCoreWebInput)
final _simCoreWebInputProvider = _SimCoreWebInputProvider._();

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
final class _SimCoreWebInputProvider
    extends $NotifierProvider<_SimCoreWebInput, StreamController<dynamic>> {
  /// A provider that creates a stream for sending vehicle inputs to the
  /// vehicle simulator when on the web platform.
  _SimCoreWebInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_simCoreWebInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_simCoreWebInputHash();

  @$internal
  @override
  _SimCoreWebInput create() => _SimCoreWebInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StreamController<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StreamController<dynamic>>(value),
    );
  }
}

String _$_simCoreWebInputHash() => r'8f043db7433228bbd0479cd8df8b1aca0e1ddf36';

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.

abstract class _$SimCoreWebInput extends $Notifier<StreamController<dynamic>> {
  StreamController<dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<StreamController<dynamic>, StreamController<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StreamController<dynamic>, StreamController<dynamic>>,
              StreamController<dynamic>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.

@ProviderFor(simCoreWebStream)
final simCoreWebStreamProvider = SimCoreWebStreamProvider._();

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.

final class SimCoreWebStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Vehicle?>, Vehicle?, Stream<Vehicle?>>
    with $FutureModifier<Vehicle?>, $StreamProvider<Vehicle?> {
  /// A provider that creates a stream and watches the vehicle simulator on the
  /// web platform.
  ///
  /// It will update the stream with vehicle updates from the simulator and also
  /// update the vehicle gauge providers.
  SimCoreWebStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simCoreWebStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simCoreWebStreamHash();

  @$internal
  @override
  $StreamProviderElement<Vehicle?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Vehicle?> create(Ref ref) {
    return simCoreWebStream(ref);
  }
}

String _$simCoreWebStreamHash() => r'49195f61d91fcc66910d46b237bcd471f68125d4';

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
    r'c24576f0246161bdfa198f7ff9095467d80094b7';

/// A dummy provider for the web version.

@ProviderFor(simCoreIsolateStream)
final simCoreIsolateStreamProvider = SimCoreIsolateStreamProvider._();

/// A dummy provider for the web version.

final class SimCoreIsolateStreamProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A dummy provider for the web version.
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
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return simCoreIsolateStream(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$simCoreIsolateStreamHash() =>
    r'e31e28aee2c717de9e9db7921cd374d64904e52a';
