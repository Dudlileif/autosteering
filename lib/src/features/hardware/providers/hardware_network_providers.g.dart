// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressWlanHash() =>
    r'f83be2448781de1c928f2c96940a5098ffad153e';

/// A provider for the wireless IP address of the device.
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
String _$deviceIPAdressAPHash() => r'38178052a4a97611dc6fc4e8b2ecfb1d5b5b91bb';

/// A provider for the access point host IP address of the device.
///
/// Copied from [deviceIPAdressAP].
@ProviderFor(deviceIPAdressAP)
final deviceIPAdressAPProvider = AutoDisposeFutureProvider<String?>.internal(
  deviceIPAdressAP,
  name: r'deviceIPAdressAPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressAPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressAPRef = AutoDisposeFutureProviderRef<String?>;
String _$deviceIPAdressEthernetHash() =>
    r'c97b95b9563fec16579d200be6b447507c4c80af';

/// A provider for the ethernet IP address of the device.
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
String _$currentConnectionHash() => r'83fb0a2276430d90860e6f4e231047407d2e87e7';

/// A provider for the current connection of the device.
///
/// Copied from [currentConnection].
@ProviderFor(currentConnection)
final currentConnectionProvider =
    StreamProvider<List<ConnectivityResult>>.internal(
  currentConnection,
  name: r'currentConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentConnectionRef = StreamProviderRef<List<ConnectivityResult>>;
String _$networkAvailableHash() => r'ec9225b73339ca99f95d63da9efb9da9d8875c99';

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
String _$tcpServerHash() => r'a705cb8e8f1bac00be4156e488dcb060ea2faa12';

/// A provider for a TCP server for sending/receiving data via TCP.
///
/// Copied from [TcpServer].
@ProviderFor(TcpServer)
final tcpServerProvider = AsyncNotifierProvider<TcpServer, Socket?>.internal(
  TcpServer.new,
  name: r'tcpServerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tcpServerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TcpServer = AsyncNotifier<Socket?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
