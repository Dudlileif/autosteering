// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_serial_providers_web.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableSerialPortsHash() =>
    r'b3d0d4f16721c51b3385b14cd754b3009dae809e';

/// A provider for the available serial ports.
///
/// Copied from [availableSerialPorts].
@ProviderFor(availableSerialPorts)
final availableSerialPortsProvider =
    AutoDisposeProvider<List<Object?>>.internal(
  availableSerialPorts,
  name: r'availableSerialPortsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSerialPortsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableSerialPortsRef = AutoDisposeProviderRef<List<Object?>>;
String _$hardwareSerialStreamHash() =>
    r'6e8454698dffa66b756f2bfa565b00c4f821c7e3';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HardwareSerialStreamRef = StreamProviderRef<String?>;
String _$hardwareSerialBaudRateHash() =>
    r'2c397fd6a972584bd3a11441bac56d26184e2964';

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
String _$hardwareSerialHash() => r'94a5a704dd8ae3206030a39d1ef3008a8a442317';

/// A provider for the hardware serial connection.
///
/// Copied from [HardwareSerial].
@ProviderFor(HardwareSerial)
final hardwareSerialProvider =
    NotifierProvider<HardwareSerial, Object?>.internal(
  HardwareSerial.new,
  name: r'hardwareSerialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerial = Notifier<Object?>;
String _$hardwareSerialAliveHash() =>
    r'8e130768da3e3c2eaa24d25165f9c07bcae90822';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
