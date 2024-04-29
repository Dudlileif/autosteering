// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceIPAdressWlanHash() =>
    r'5de5e289b585ba5b746f1962a8a77f024a9627ca';

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
String _$deviceIPAdressAPHash() => r'e61c5924afabc3bfc9f0ff93a3c01996e8beed55';

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
    r'd50284aa3ec6f28ccf0854397fac4b87a8cd1ff9';

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
String _$currentConnectionHash() => r'1b84c22e8dbac870f08d39874ff7c59d437f6e3b';

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
String _$networkAvailableHash() => r'b4a4e0fbd04dc84266ecad3af680debe4959ec1f';

/// A provider for whether a network connection can be made.
///
/// If using VPN while being an access point, communication with hardware
/// is not possible.
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
String _$steeringHardwareAddressHash() =>
    r'4508da53c714f433e85ea2d8b7672aca61824b32';

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
    r'22e54b981c0170742b9370f31b6bc07b4f7452b0';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
