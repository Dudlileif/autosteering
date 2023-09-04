// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressWlanHash() =>
    r'ec2d871c08b0813194a7519595f738d1f00b3efa';

/// A provider for the wireless IP adress of the device.
///
/// Copied from [deviceIPAdressWlan].
@ProviderFor(deviceIPAdressWlan)
final deviceIPAdressWlanProvider = AutoDisposeFutureProvider<String?>.internal(
  deviceIPAdressWlan,
  name: r'deviceIPAdressWlanProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressWlanHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressWlanRef = AutoDisposeFutureProviderRef<String?>;
String _$deviceIPAdressEthernetHash() =>
    r'4a7c7ec62c2bd4531a202830bada839e890dc0ac';

/// A provider for the wireless IP adress of the device.
///
/// Copied from [deviceIPAdressEthernet].
@ProviderFor(deviceIPAdressEthernet)
final deviceIPAdressEthernetProvider =
    AutoDisposeFutureProvider<String?>.internal(
  deviceIPAdressEthernet,
  name: r'deviceIPAdressEthernetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressEthernetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressEthernetRef = AutoDisposeFutureProviderRef<String?>;
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
String _$hardwareWebCommunicationConfigHash() =>
    r'ffa785022e1c36c2883c7a23898f55a16a1b1567';

/// A provider for the combined state of the [HardwareIPAdress],
/// [HardwareWebSocketPort].
///
/// The updated state is automatically sent to the
///
/// Copied from [hardwareWebCommunicationConfig].
@ProviderFor(hardwareWebCommunicationConfig)
final hardwareWebCommunicationConfigProvider =
    Provider<({String hardwareIPAdress, int hardwareWebSocketPort})>.internal(
  hardwareWebCommunicationConfig,
  name: r'hardwareWebCommunicationConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareWebCommunicationConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareWebCommunicationConfigRef
    = ProviderRef<({String hardwareIPAdress, int hardwareWebSocketPort})>;
String _$hardwareIsConnectedHash() =>
    r'868c2a8319a69cbd23814e20bc583381cccd7a8c';

/// A provider for whether there is a connection with the hardware.
///
/// Copied from [HardwareIsConnected].
@ProviderFor(HardwareIsConnected)
final hardwareIsConnectedProvider =
    NotifierProvider<HardwareIsConnected, bool>.internal(
  HardwareIsConnected.new,
  name: r'hardwareIsConnectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareIsConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareIsConnected = Notifier<bool>;
String _$hardwareIPAdressHash() => r'9e16807c2fc2e38718ce21576b0ea9a32d5c87f0';

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
    r'b3dcb3a4792c18833d84b60b7d559199b7868510';

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
    r'bd08e39eec4b4b1216c6072a64dfe6af0f2ed76a';

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
String _$hardwareWebSocketPortHash() =>
    r'e5cc5998b00cce1c57443a9c928d1dcd3ab5ccb7';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareIPAdress].
///
/// Copied from [HardwareWebSocketPort].
@ProviderFor(HardwareWebSocketPort)
final hardwareWebSocketPortProvider =
    NotifierProvider<HardwareWebSocketPort, int>.internal(
  HardwareWebSocketPort.new,
  name: r'hardwareWebSocketPortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareWebSocketPortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareWebSocketPort = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
