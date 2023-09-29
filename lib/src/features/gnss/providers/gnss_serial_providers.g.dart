// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_serial_providers.dart';

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
String _$gnssSerialStreamHash() => r'35ba3a92516efbd95539122fe2ce2ea09afbf37a';

/// A stream of the incoming serial data from the GNSS serial hardware.
///
/// Copied from [gnssSerialStream].
@ProviderFor(gnssSerialStream)
final gnssSerialStreamProvider = StreamProvider<String?>.internal(
  gnssSerialStream,
  name: r'gnssSerialStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssSerialStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GnssSerialStreamRef = StreamProviderRef<String?>;
String _$gnssSerialBaudRateHash() =>
    r'874f5cd83ebbf42df330fa4cf34af78bf81f1da0';

/// A provider for the baud rate for the [GnssSerial] connection.
///
/// Copied from [GnssSerialBaudRate].
@ProviderFor(GnssSerialBaudRate)
final gnssSerialBaudRateProvider =
    NotifierProvider<GnssSerialBaudRate, int>.internal(
  GnssSerialBaudRate.new,
  name: r'gnssSerialBaudRateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssSerialBaudRateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssSerialBaudRate = Notifier<int>;
String _$gnssSerialHash() => r'972c032a7580d134d8a5a23338d8a900d21c173b';

/// A provider for which port [GnssSerial] should use.
///
/// Copied from [GnssSerial].
@ProviderFor(GnssSerial)
final gnssSerialProvider = NotifierProvider<GnssSerial, SerialPort?>.internal(
  GnssSerial.new,
  name: r'gnssSerialProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gnssSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssSerial = Notifier<SerialPort?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
