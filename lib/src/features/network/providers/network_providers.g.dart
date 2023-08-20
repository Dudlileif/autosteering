// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressHash() => r'01ce6d3555a1294c42f373ba8efe94e109cc2632';

/// A provider for the IP adress of the device.
///
/// Copied from [deviceIPAdress].
@ProviderFor(deviceIPAdress)
final deviceIPAdressProvider = AutoDisposeFutureProvider<String?>.internal(
  deviceIPAdress,
  name: r'deviceIPAdressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressRef = AutoDisposeFutureProviderRef<String?>;
String _$hardwareCommunicationConfigHash() =>
    r'607c3571bb12f80ce8af3d575d72d23622416ee6';

/// A provider for the combined state of the [HardwareIPAdress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
///
/// Copied from [hardwareCommunicationConfig].
@ProviderFor(hardwareCommunicationConfig)
final hardwareCommunicationConfigProvider = Provider<
    ({
      String hardwareIPAdress,
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort
    })>.internal(
  hardwareCommunicationConfig,
  name: r'hardwareCommunicationConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareCommunicationConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareCommunicationConfigRef = ProviderRef<
    ({
      String hardwareIPAdress,
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort
    })>;
String _$hardwareIPAdressHash() => r'4e1d03593b82c071847884ed91e12d974c7f3c43';

/// A provider for the IP adress of the hardware we want to communicate with.
///
/// Copied from [HardwareIPAdress].
@ProviderFor(HardwareIPAdress)
final hardwareIPAdressProvider =
    NotifierProvider<HardwareIPAdress, String>.internal(
  HardwareIPAdress.new,
  name: r'hardwareIPAdressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareIPAdressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareIPAdress = Notifier<String>;
String _$hardwareUDPReceivePortHash() =>
    r'00d027c40fdf1f82128e0a4f6bd2430894a1ba74';

/// A provider for the UDP receive port for the device.
///
/// Copied from [HardwareUDPReceivePort].
@ProviderFor(HardwareUDPReceivePort)
final hardwareUDPReceivePortProvider =
    NotifierProvider<HardwareUDPReceivePort, int>.internal(
  HardwareUDPReceivePort.new,
  name: r'hardwareUDPReceivePortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareUDPReceivePortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareUDPReceivePort = Notifier<int>;
String _$hardwareUDPSendPortHash() =>
    r'88d58ea54179863cc7e7d1fc652c2479060ebe58';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareIPAdress].
///
/// Copied from [HardwareUDPSendPort].
@ProviderFor(HardwareUDPSendPort)
final hardwareUDPSendPortProvider =
    NotifierProvider<HardwareUDPSendPort, int>.internal(
  HardwareUDPSendPort.new,
  name: r'hardwareUDPSendPortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareUDPSendPortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareUDPSendPort = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
