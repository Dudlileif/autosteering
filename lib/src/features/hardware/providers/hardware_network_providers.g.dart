// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressWlanHash() =>
    r'8e71712cf22af98a29678a6e4b8425f7074a70d5';

/// A provider for the wireless IP address of the device.
///
/// Copied from [deviceIPAdressWlan].
@ProviderFor(deviceIPAdressWlan)
final deviceIPAdressWlanProvider = Provider<String?>.internal(
  deviceIPAdressWlan,
  name: r'deviceIPAdressWlanProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressWlanHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressWlanRef = ProviderRef<String?>;
String _$deviceIPAdressAPHash() => r'43da6ed39ad3f505db37110cb2481d8f5ee6642a';

/// A provider for the access point host IP address of the device.
///
/// Copied from [deviceIPAdressAP].
@ProviderFor(deviceIPAdressAP)
final deviceIPAdressAPProvider = Provider<String?>.internal(
  deviceIPAdressAP,
  name: r'deviceIPAdressAPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressAPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressAPRef = ProviderRef<String?>;
String _$deviceIPAdressEthernetHash() =>
    r'd0b3e493db864ca4b7d683293a50b2722bf627a9';

/// A provider for the ethernet IP address of the device.
///
/// Copied from [deviceIPAdressEthernet].
@ProviderFor(deviceIPAdressEthernet)
final deviceIPAdressEthernetProvider = Provider<String?>.internal(
  deviceIPAdressEthernet,
  name: r'deviceIPAdressEthernetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAdressEthernetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceIPAdressEthernetRef = ProviderRef<String?>;
String _$hardwareCommunicationConfigHash() =>
    r'3633f1b1258bcc18ff12ebf4d4469b438aa22931';

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
///
/// Copied from [hardwareCommunicationConfig].
@ProviderFor(hardwareCommunicationConfig)
final hardwareCommunicationConfigProvider = Provider<
    ({
      String steeringHardwareAddress,
      String remoteControlHardwareAddress,
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
      String steeringHardwareAddress,
      String remoteControlHardwareAddress,
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort
    })>;
String _$networkAvailableHash() => r'f5f42aa1be914492fbf0e5a6baad5c6854229ad7';

/// A provider for whether a network connection can be made.
///
/// If using VPN while being an access point, communication with hardware
/// is only possible if the subnet of the access point is disallowed throught
/// the VPN.
/// For WireGuard the allowed IPs to put in the client can be calculated
/// here:
/// https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/.
/// If the access point host has IP 192.168.38.49, then input
/// Allowed IPs: 0.0.0.0/0,::/0
/// Disallowed IPs: 192.168.38.0/24
/// Copy the resulting Allowed IPs to the WireGuard client.
/// On Android the subnet might change every time the device reboots, so more
/// subnets should be added to Disallowed IPs.
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
String _$steeringHardwareNetworkAliveHash() =>
    r'349e2d89fd44c884ef2492747c7feec18ab76530';

/// A provider for whether there is a connection with the steering hardware.
///
/// Copied from [SteeringHardwareNetworkAlive].
@ProviderFor(SteeringHardwareNetworkAlive)
final steeringHardwareNetworkAliveProvider =
    NotifierProvider<SteeringHardwareNetworkAlive, bool>.internal(
  SteeringHardwareNetworkAlive.new,
  name: r'steeringHardwareNetworkAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringHardwareNetworkAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringHardwareNetworkAlive = Notifier<bool>;
String _$remoteControlHardwareNetworkAliveHash() =>
    r'609957ce4523257f5267104473652f29a7f1735c';

/// A provider for whether there is a connection with the remote control
/// hardware.
///
/// Copied from [RemoteControlHardwareNetworkAlive].
@ProviderFor(RemoteControlHardwareNetworkAlive)
final remoteControlHardwareNetworkAliveProvider =
    NotifierProvider<RemoteControlHardwareNetworkAlive, bool>.internal(
  RemoteControlHardwareNetworkAlive.new,
  name: r'remoteControlHardwareNetworkAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteControlHardwareNetworkAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteControlHardwareNetworkAlive = Notifier<bool>;
String _$networkInterfacesHash() => r'266036be313e3b83042620c5dde1da749893a17a';

/// A provider for all the
///
/// Copied from [NetworkInterfaces].
@ProviderFor(NetworkInterfaces)
final networkInterfacesProvider =
    NotifierProvider<NetworkInterfaces, List<NetworkInterface>>.internal(
  NetworkInterfaces.new,
  name: r'networkInterfacesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkInterfacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkInterfaces = Notifier<List<NetworkInterface>>;
String _$steeringHardwareAddressHash() =>
    r'6997c150b25bf3f17de05bcd365bcbe1bb744234';

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.
///
/// Copied from [SteeringHardwareAddress].
@ProviderFor(SteeringHardwareAddress)
final steeringHardwareAddressProvider =
    NotifierProvider<SteeringHardwareAddress, String>.internal(
  SteeringHardwareAddress.new,
  name: r'steeringHardwareAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringHardwareAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringHardwareAddress = Notifier<String>;
String _$remoteControlHardwareAddressHash() =>
    r'c4d2e7ae1463b76c1fc62d1defe2b10a4930977b';

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.
///
/// Copied from [RemoteControlHardwareAddress].
@ProviderFor(RemoteControlHardwareAddress)
final remoteControlHardwareAddressProvider =
    NotifierProvider<RemoteControlHardwareAddress, String>.internal(
  RemoteControlHardwareAddress.new,
  name: r'remoteControlHardwareAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteControlHardwareAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteControlHardwareAddress = Notifier<String>;
String _$hardwareUDPReceivePortHash() =>
    r'9dc859a8609c4fc1e6edfbd8350735f1a57bbbca';

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
    r'8feeee8cfb37b2d1535a07ca03fa3cf535b5f7c7';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].
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
String _$tcpServerHash() => r'd6dbfb973642beb24197ba21b9dba07ed1e434af';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
