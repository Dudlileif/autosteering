// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hardwareCommunicationConfigHash() =>
    r'2b6f034132f0d933e3fc4f5bc0b2a14d33d3e689';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HardwareCommunicationConfigRef = ProviderRef<
    ({
      String steeringHardwareAddress,
      String remoteControlHardwareAddress,
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort
    })>;
String _$steeringHardwareNetworkAliveHash() =>
    r'e68b0de191f2f1c5cfdd51810d8f36000619e83f';

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
    r'08ff67c407ee215a57f4d72b6bdaf19d4fb802c6';

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
String _$deviceIPAddressWlanHash() =>
    r'92f57b37c3ab7a20c3eee06664e6ac62eaeeb9f7';

/// A provider for the wireless IP address of the device.
///
/// Copied from [DeviceIPAddressWlan].
@ProviderFor(DeviceIPAddressWlan)
final deviceIPAddressWlanProvider =
    NotifierProvider<DeviceIPAddressWlan, String?>.internal(
  DeviceIPAddressWlan.new,
  name: r'deviceIPAddressWlanProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAddressWlanHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeviceIPAddressWlan = Notifier<String?>;
String _$deviceIPAddressAPHash() => r'a7b0fefd84c0948459afaa9a39ceae427c240302';

/// A provider for the access point host IP address of the device.
///
/// Copied from [DeviceIPAddressAP].
@ProviderFor(DeviceIPAddressAP)
final deviceIPAddressAPProvider =
    NotifierProvider<DeviceIPAddressAP, String?>.internal(
  DeviceIPAddressAP.new,
  name: r'deviceIPAddressAPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAddressAPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeviceIPAddressAP = Notifier<String?>;
String _$deviceIPAddressEthernetHash() =>
    r'edb5f85d5d221815af3c846664dde25a951b847f';

/// A provider for the ethernet IP address of the device.
///
/// Copied from [DeviceIPAddressEthernet].
@ProviderFor(DeviceIPAddressEthernet)
final deviceIPAddressEthernetProvider =
    NotifierProvider<DeviceIPAddressEthernet, String?>.internal(
  DeviceIPAddressEthernet.new,
  name: r'deviceIPAddressEthernetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceIPAddressEthernetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeviceIPAddressEthernet = Notifier<String?>;
String _$steeringHardwareAddressHash() =>
    r'3cb2a5f5c518f59c85623b9cc2213e2bdf494396';

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
    r'2c9ca0304c21a280e27dc076ad6eb73e20649aca';

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
    r'6aded543234f469b116cb66e8ce6e8bdfd9c1866';

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
    r'8176c8651e533059f546c303926cd60e661bfc48';

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
String _$tcpServerHash() => r'c4c536ad4a258a302866626ed31dc30177a1eba9';

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
String _$networkAvailableHash() => r'7fd62e678e64d2b631a0d3ac8b55880e25c0687d';

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
/// Copied from [NetworkAvailable].
@ProviderFor(NetworkAvailable)
final networkAvailableProvider =
    NotifierProvider<NetworkAvailable, bool>.internal(
  NetworkAvailable.new,
  name: r'networkAvailableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkAvailableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkAvailable = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
