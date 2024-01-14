// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressWlanHash() =>
    r'f83be2448781de1c928f2c96940a5098ffad153e';

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
    r'c97b95b9563fec16579d200be6b447507c4c80af';

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
    r'ec0633874ead1587e91a4e4dc46c2b6040b34908';

/// A provider for the combined state of the [HardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
///
/// Copied from [hardwareCommunicationConfig].
@ProviderFor(hardwareCommunicationConfig)
final hardwareCommunicationConfigProvider = Provider<
    ({
      String hardwareAddress,
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
      String hardwareAddress,
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort
    })>;
String _$hardwareWebCommunicationConfigHash() =>
    r'47df5b5aa2fddae18a9ab1376370094762546f54';

/// A provider for the combined state of the [HardwareAddress],
/// [HardwareWebSocketPort].
///
/// The updated state is automatically sent to the
///
/// Copied from [hardwareWebCommunicationConfig].
@ProviderFor(hardwareWebCommunicationConfig)
final hardwareWebCommunicationConfigProvider =
    Provider<({String hardwareAddress, int hardwareWebSocketPort})>.internal(
  hardwareWebCommunicationConfig,
  name: r'hardwareWebCommunicationConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareWebCommunicationConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareWebCommunicationConfigRef
    = ProviderRef<({String hardwareAddress, int hardwareWebSocketPort})>;
String _$currentConnectionHash() => r'e780fb086d27c63045c0df36c7ad0a10ab0a0425';

/// A provider for the current connection of the device.
///
/// Copied from [currentConnection].
@ProviderFor(currentConnection)
final currentConnectionProvider = StreamProvider<ConnectivityResult>.internal(
  currentConnection,
  name: r'currentConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentConnectionRef = StreamProviderRef<ConnectivityResult>;
String _$networkAvailableHash() => r'efd28f567476da1835b14284f781709ced58fcfe';

/// A provider for whether a network connection can be made.
///
///
/// Copied from [networkAvailable].
@ProviderFor(networkAvailable)
final networkAvailableProvider = Provider<bool>.internal(
  networkAvailable,
  name: r'networkAvailableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkAvailableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkAvailableRef = ProviderRef<bool>;
String _$hardwareNetworkAliveHash() =>
    r'34d239e447fc1d306a7aedb2179959c9d78560d8';

/// A provider for whether there is a connection with the hardware.
///
/// Copied from [HardwareNetworkAlive].
@ProviderFor(HardwareNetworkAlive)
final hardwareNetworkAliveProvider =
    NotifierProvider<HardwareNetworkAlive, bool>.internal(
  HardwareNetworkAlive.new,
  name: r'hardwareNetworkAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareNetworkAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareNetworkAlive = Notifier<bool>;
String _$hardwareAddressHash() => r'9b1f5003b3de55c4044c9ab861156175cccd572c';

/// A provider for the IP adress of the hardware we want to communicate with.
///
/// Copied from [HardwareAddress].
@ProviderFor(HardwareAddress)
final hardwareAddressProvider =
    NotifierProvider<HardwareAddress, String>.internal(
  HardwareAddress.new,
  name: r'hardwareAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareAddress = Notifier<String>;
String _$hardwareUDPReceivePortHash() =>
    r'91dbd7461ad74145dfdb3e30087d93af782aac83';

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
    r'8fb2c394511108ca165925cab8e4d31e8abda11c';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareAddress].
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
    r'afb7bbd829445135aabd30dbc368f7649dbffb61';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareAddress].
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
String _$tcpServerHash() => r'2d075ffd4a3fb8fb20b0d34ba4a1ce07e6107e32';

/// A provider for a TCP server for sending/receiving data via TCP.
///
/// Copied from [TcpServer].
@ProviderFor(TcpServer)
final tcpServerProvider =
    AsyncNotifierProvider<TcpServer, ServerSocket>.internal(
  TcpServer.new,
  name: r'tcpServerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tcpServerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TcpServer = AsyncNotifier<ServerSocket>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
