// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_serial_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the available serial ports.

@ProviderFor(availableSerialPorts)
const availableSerialPortsProvider = AvailableSerialPortsProvider._();

/// A provider for the available serial ports.

final class AvailableSerialPortsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SerialPort>>,
          List<SerialPort>,
          FutureOr<List<SerialPort>>
        >
    with $FutureModifier<List<SerialPort>>, $FutureProvider<List<SerialPort>> {
  /// A provider for the available serial ports.
  const AvailableSerialPortsProvider._()
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
  $FutureProviderElement<List<SerialPort>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SerialPort>> create(Ref ref) {
    return availableSerialPorts(ref);
  }
}

String _$availableSerialPortsHash() =>
    r'3140d69d8580f4f654efa509455d45b4896696a1';

/// A provider for the baud rate for the [HardwareSerial] connection.

@ProviderFor(HardwareSerialBaudRate)
const hardwareSerialBaudRateProvider = HardwareSerialBaudRateProvider._();

/// A provider for the baud rate for the [HardwareSerial] connection.
final class HardwareSerialBaudRateProvider
    extends $NotifierProvider<HardwareSerialBaudRate, int> {
  /// A provider for the baud rate for the [HardwareSerial] connection.
  const HardwareSerialBaudRateProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the hardware serial connection.

@ProviderFor(HardwareSerial)
const hardwareSerialProvider = HardwareSerialProvider._();

/// A provider for the hardware serial connection.
final class HardwareSerialProvider
    extends $NotifierProvider<HardwareSerial, SerialPort?> {
  /// A provider for the hardware serial connection.
  const HardwareSerialProvider._()
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
  Override overrideWithValue(SerialPort? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SerialPort?>(value),
    );
  }
}

String _$hardwareSerialHash() => r'6222ed823383a29d42b1e02d6705be3ddeaac555';

/// A provider for the hardware serial connection.

abstract class _$HardwareSerial extends $Notifier<SerialPort?> {
  SerialPort? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SerialPort?, SerialPort?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SerialPort?, SerialPort?>,
              SerialPort?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A stream of the incoming serial data from the connected hardware.

@ProviderFor(hardwareSerialStream)
const hardwareSerialStreamProvider = HardwareSerialStreamProvider._();

/// A stream of the incoming serial data from the connected hardware.

final class HardwareSerialStreamProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  /// A stream of the incoming serial data from the connected hardware.
  const HardwareSerialStreamProvider._()
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
    r'0107f77cb40b79a8b4103bd1d150b7883dab976d';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.

@ProviderFor(HardwareSerialAlive)
const hardwareSerialAliveProvider = HardwareSerialAliveProvider._();

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
  const HardwareSerialAliveProvider._()
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
    r'8e130768da3e3c2eaa24d25165f9c07bcae90822';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.

abstract class _$HardwareSerialAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
