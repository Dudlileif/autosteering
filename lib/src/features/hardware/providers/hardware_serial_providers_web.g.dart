// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_serial_providers_web.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the available serial ports.

@ProviderFor(availableSerialPorts)
final availableSerialPortsProvider = AvailableSerialPortsProvider._();

/// A provider for the available serial ports.

final class AvailableSerialPortsProvider
    extends $FunctionalProvider<List<Object?>, List<Object?>, List<Object?>>
    with $Provider<List<Object?>> {
  /// A provider for the available serial ports.
  AvailableSerialPortsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableSerialPortsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableSerialPortsHash();

  @$internal
  @override
  $ProviderElement<List<Object?>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Object?> create(Ref ref) {
    return availableSerialPorts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Object?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Object?>>(value),
    );
  }
}

String _$availableSerialPortsHash() =>
    r'b3d0d4f16721c51b3385b14cd754b3009dae809e';

/// A provider for the baud rate for the [HardwareSerial] connection.

@ProviderFor(HardwareSerialBaudRate)
final hardwareSerialBaudRateProvider = HardwareSerialBaudRateProvider._();

/// A provider for the baud rate for the [HardwareSerial] connection.
final class HardwareSerialBaudRateProvider
    extends $NotifierProvider<HardwareSerialBaudRate, int> {
  /// A provider for the baud rate for the [HardwareSerial] connection.
  HardwareSerialBaudRateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareSerialBaudRateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareSerialBaudRateHash();

  @$internal
  @override
  HardwareSerialBaudRate create() => HardwareSerialBaudRate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$hardwareSerialBaudRateHash() =>
    r'2c397fd6a972584bd3a11441bac56d26184e2964';

/// A provider for the baud rate for the [HardwareSerial] connection.

abstract class _$HardwareSerialBaudRate extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the hardware serial connection.

@ProviderFor(HardwareSerial)
final hardwareSerialProvider = HardwareSerialProvider._();

/// A provider for the hardware serial connection.
final class HardwareSerialProvider
    extends $NotifierProvider<HardwareSerial, Object?> {
  /// A provider for the hardware serial connection.
  HardwareSerialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareSerialProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareSerialHash();

  @$internal
  @override
  HardwareSerial create() => HardwareSerial();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Object? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Object?>(value),
    );
  }
}

String _$hardwareSerialHash() => r'94a5a704dd8ae3206030a39d1ef3008a8a442317';

/// A provider for the hardware serial connection.

abstract class _$HardwareSerial extends $Notifier<Object?> {
  Object? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Object?, Object?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Object?, Object?>,
              Object?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A stream of the incoming serial data from the connected hardware.

@ProviderFor(hardwareSerialStream)
final hardwareSerialStreamProvider = HardwareSerialStreamProvider._();

/// A stream of the incoming serial data from the connected hardware.

final class HardwareSerialStreamProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  /// A stream of the incoming serial data from the connected hardware.
  HardwareSerialStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareSerialStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareSerialStreamHash();

  @$internal
  @override
  $StreamProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String?> create(Ref ref) {
    return hardwareSerialStream(ref);
  }
}

String _$hardwareSerialStreamHash() =>
    r'6e8454698dffa66b756f2bfa565b00c4f821c7e3';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.

@ProviderFor(HardwareSerialAlive)
final hardwareSerialAliveProvider = HardwareSerialAliveProvider._();

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
final class HardwareSerialAliveProvider
    extends $NotifierProvider<HardwareSerialAlive, bool> {
  /// A provider for telling whether the [HardwareSerial] is receiving data.
  ///
  /// If not set to true in the last second, it will invalidate itself and
  /// restart as false.
  HardwareSerialAliveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareSerialAliveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareSerialAliveHash();

  @$internal
  @override
  HardwareSerialAlive create() => HardwareSerialAlive();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareSerialAliveHash() =>
    r'eae0e9a3fa31b3cdf352ca1e5c333d0b9434d928';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.

abstract class _$HardwareSerialAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
