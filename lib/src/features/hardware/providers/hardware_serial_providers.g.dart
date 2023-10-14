// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_serial_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableSerialPortsHash() =>
    r'c8572cd86484a91be1ff9fd0fa5efe702e911172';

/// A provider for the available serial ports.
///
/// Copied from [availableSerialPorts].
@ProviderFor(availableSerialPorts)
final availableSerialPortsProvider =
    AutoDisposeProvider<List<SerialPort>>.internal(
  availableSerialPorts,
  name: r'availableSerialPortsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSerialPortsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AvailableSerialPortsRef = AutoDisposeProviderRef<List<SerialPort>>;
String _$hardwareSerialStreamHash() =>
    r'b4d7f6ba0054851b7e014f2dcc687826ab4e9b6b';

/// A stream of the incoming serial data from the connected hardware.
///
/// Copied from [hardwareSerialStream].
@ProviderFor(hardwareSerialStream)
final hardwareSerialStreamProvider = StreamProvider<String?>.internal(
  hardwareSerialStream,
  name: r'hardwareSerialStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareSerialStreamRef = StreamProviderRef<String?>;
String _$hardwareSerialBaudRateHash() =>
    r'44e0974b8d9a3527549121492e82f5c4423eeed4';

/// A provider for the baud rate for the [HardwareSerial] connection.
///
/// Copied from [HardwareSerialBaudRate].
@ProviderFor(HardwareSerialBaudRate)
final hardwareSerialBaudRateProvider =
    NotifierProvider<HardwareSerialBaudRate, int>.internal(
  HardwareSerialBaudRate.new,
  name: r'hardwareSerialBaudRateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialBaudRateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerialBaudRate = Notifier<int>;
String _$hardwareSerialHash() => r'c3ca0aa09f23c1163729edf3ccf97a54592a5e3c';

/// A provider for the hardware serial connection.
///
/// Copied from [HardwareSerial].
@ProviderFor(HardwareSerial)
final hardwareSerialProvider =
    NotifierProvider<HardwareSerial, SerialPort?>.internal(
  HardwareSerial.new,
  name: r'hardwareSerialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerial = Notifier<SerialPort?>;
String _$hardwareSerialAliveHash() =>
    r'a417b5ed2368d79950973ac4fbaa935a98583ae9';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
///
/// Copied from [HardwareSerialAlive].
@ProviderFor(HardwareSerialAlive)
final hardwareSerialAliveProvider =
    NotifierProvider<HardwareSerialAlive, bool>.internal(
  HardwareSerialAlive.new,
  name: r'hardwareSerialAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerialAlive = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
