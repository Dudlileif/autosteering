// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether there is a connection with the steering hardware.

@ProviderFor(SteeringHardwareNetworkAlive)
final steeringHardwareNetworkAliveProvider =
    SteeringHardwareNetworkAliveProvider._();

/// A provider for whether there is a connection with the steering hardware.
final class SteeringHardwareNetworkAliveProvider
    extends $NotifierProvider<SteeringHardwareNetworkAlive, bool> {
  /// A provider for whether there is a connection with the steering hardware.
  SteeringHardwareNetworkAliveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringHardwareNetworkAliveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringHardwareNetworkAliveHash();

  @$internal
  @override
  SteeringHardwareNetworkAlive create() => SteeringHardwareNetworkAlive();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$steeringHardwareNetworkAliveHash() =>
    r'f598a220ea9ad2e2f862c83681c5bb18458696b6';

/// A provider for whether there is a connection with the steering hardware.

abstract class _$SteeringHardwareNetworkAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether there is a connection with the remote control
/// hardware.

@ProviderFor(RemoteControlHardwareNetworkAlive)
final remoteControlHardwareNetworkAliveProvider =
    RemoteControlHardwareNetworkAliveProvider._();

/// A provider for whether there is a connection with the remote control
/// hardware.
final class RemoteControlHardwareNetworkAliveProvider
    extends $NotifierProvider<RemoteControlHardwareNetworkAlive, bool> {
  /// A provider for whether there is a connection with the remote control
  /// hardware.
  RemoteControlHardwareNetworkAliveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteControlHardwareNetworkAliveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$remoteControlHardwareNetworkAliveHash();

  @$internal
  @override
  RemoteControlHardwareNetworkAlive create() =>
      RemoteControlHardwareNetworkAlive();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$remoteControlHardwareNetworkAliveHash() =>
    r'4cf8e9dc200a7247d0be54e399b35fdac3394ad0';

/// A provider for whether there is a connection with the remote control
/// hardware.

abstract class _$RemoteControlHardwareNetworkAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for all the

@ProviderFor(NetworkInterfaces)
final networkInterfacesProvider = NetworkInterfacesProvider._();

/// A provider for all the
final class NetworkInterfacesProvider
    extends $NotifierProvider<NetworkInterfaces, List<NetworkInterface>> {
  /// A provider for all the
  NetworkInterfacesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInterfacesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInterfacesHash();

  @$internal
  @override
  NetworkInterfaces create() => NetworkInterfaces();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NetworkInterface> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NetworkInterface>>(value),
    );
  }
}

String _$networkInterfacesHash() => r'266036be313e3b83042620c5dde1da749893a17a';

/// A provider for all the

abstract class _$NetworkInterfaces extends $Notifier<List<NetworkInterface>> {
  List<NetworkInterface> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<List<NetworkInterface>, List<NetworkInterface>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<NetworkInterface>, List<NetworkInterface>>,
              List<NetworkInterface>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the wireless IP address of the device.

@ProviderFor(DeviceIPAddressWlan)
final deviceIPAddressWlanProvider = DeviceIPAddressWlanProvider._();

/// A provider for the wireless IP address of the device.
final class DeviceIPAddressWlanProvider
    extends $NotifierProvider<DeviceIPAddressWlan, String?> {
  /// A provider for the wireless IP address of the device.
  DeviceIPAddressWlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceIPAddressWlanProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceIPAddressWlanHash();

  @$internal
  @override
  DeviceIPAddressWlan create() => DeviceIPAddressWlan();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$deviceIPAddressWlanHash() =>
    r'df930b8e98301fa76fde6372ed0404c509b65555';

/// A provider for the wireless IP address of the device.

abstract class _$DeviceIPAddressWlan extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the access point host IP address of the device.

@ProviderFor(DeviceIPAddressAP)
final deviceIPAddressAPProvider = DeviceIPAddressAPProvider._();

/// A provider for the access point host IP address of the device.
final class DeviceIPAddressAPProvider
    extends $NotifierProvider<DeviceIPAddressAP, String?> {
  /// A provider for the access point host IP address of the device.
  DeviceIPAddressAPProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceIPAddressAPProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceIPAddressAPHash();

  @$internal
  @override
  DeviceIPAddressAP create() => DeviceIPAddressAP();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$deviceIPAddressAPHash() => r'77b8951576f747b63edeb0099cc165820b346800';

/// A provider for the access point host IP address of the device.

abstract class _$DeviceIPAddressAP extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the ethernet IP address of the device.

@ProviderFor(DeviceIPAddressEthernet)
final deviceIPAddressEthernetProvider = DeviceIPAddressEthernetProvider._();

/// A provider for the ethernet IP address of the device.
final class DeviceIPAddressEthernetProvider
    extends $NotifierProvider<DeviceIPAddressEthernet, String?> {
  /// A provider for the ethernet IP address of the device.
  DeviceIPAddressEthernetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceIPAddressEthernetProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceIPAddressEthernetHash();

  @$internal
  @override
  DeviceIPAddressEthernet create() => DeviceIPAddressEthernet();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$deviceIPAddressEthernetHash() =>
    r'045b02f9231ac91730d4731af24a221b853559b9';

/// A provider for the ethernet IP address of the device.

abstract class _$DeviceIPAddressEthernet extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.

@ProviderFor(SteeringHardwareAddress)
final steeringHardwareAddressProvider = SteeringHardwareAddressProvider._();

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.
final class SteeringHardwareAddressProvider
    extends $NotifierProvider<SteeringHardwareAddress, String?> {
  /// A provider for the IP adress of the steering hardware we want to communicate
  /// with.
  SteeringHardwareAddressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringHardwareAddressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringHardwareAddressHash();

  @$internal
  @override
  SteeringHardwareAddress create() => SteeringHardwareAddress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$steeringHardwareAddressHash() =>
    r'd3b4b8b1f9fa9ebec3440e8b47a3673673cadfee';

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.

abstract class _$SteeringHardwareAddress extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.

@ProviderFor(RemoteControlHardwareAddress)
final remoteControlHardwareAddressProvider =
    RemoteControlHardwareAddressProvider._();

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.
final class RemoteControlHardwareAddressProvider
    extends $NotifierProvider<RemoteControlHardwareAddress, String?> {
  /// A provider for the IP adress of the remote control hardware we want to
  /// communicate with.
  RemoteControlHardwareAddressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteControlHardwareAddressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteControlHardwareAddressHash();

  @$internal
  @override
  RemoteControlHardwareAddress create() => RemoteControlHardwareAddress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$remoteControlHardwareAddressHash() =>
    r'b6ae8ae858b9e08689b4ed86189ec9185fcd9404';

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.

abstract class _$RemoteControlHardwareAddress extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the UDP receive port for the device.

@ProviderFor(HardwareUDPReceivePort)
final hardwareUDPReceivePortProvider = HardwareUDPReceivePortProvider._();

/// A provider for the UDP receive port for the device.
final class HardwareUDPReceivePortProvider
    extends $NotifierProvider<HardwareUDPReceivePort, int> {
  /// A provider for the UDP receive port for the device.
  HardwareUDPReceivePortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareUDPReceivePortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareUDPReceivePortHash();

  @$internal
  @override
  HardwareUDPReceivePort create() => HardwareUDPReceivePort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$hardwareUDPReceivePortHash() =>
    r'6aded543234f469b116cb66e8ce6e8bdfd9c1866';

/// A provider for the UDP receive port for the device.

abstract class _$HardwareUDPReceivePort extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].

@ProviderFor(HardwareUDPSendPort)
final hardwareUDPSendPortProvider = HardwareUDPSendPortProvider._();

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].
final class HardwareUDPSendPortProvider
    extends $NotifierProvider<HardwareUDPSendPort, int> {
  /// A provider for the UDP send port for the device to send messages to
  /// the hardware in [SteeringHardwareAddress].
  HardwareUDPSendPortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareUDPSendPortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareUDPSendPortHash();

  @$internal
  @override
  HardwareUDPSendPort create() => HardwareUDPSendPort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$hardwareUDPSendPortHash() =>
    r'8176c8651e533059f546c303926cd60e661bfc48';

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].

abstract class _$HardwareUDPSendPort extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the

@ProviderFor(hardwareCommunicationConfig)
final hardwareCommunicationConfigProvider =
    HardwareCommunicationConfigProvider._();

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the

final class HardwareCommunicationConfigProvider
    extends
        $FunctionalProvider<
          ({int hardwareUDPReceivePort, int hardwareUDPSendPort}),
          ({int hardwareUDPReceivePort, int hardwareUDPSendPort}),
          ({int hardwareUDPReceivePort, int hardwareUDPSendPort})
        >
    with $Provider<({int hardwareUDPReceivePort, int hardwareUDPSendPort})> {
  /// A provider for the combined state of the [SteeringHardwareAddress],
  /// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
  ///
  /// The updated state is automatically sent to the
  HardwareCommunicationConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareCommunicationConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareCommunicationConfigHash();

  @$internal
  @override
  $ProviderElement<({int hardwareUDPReceivePort, int hardwareUDPSendPort})>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ({int hardwareUDPReceivePort, int hardwareUDPSendPort}) create(Ref ref) {
    return hardwareCommunicationConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({int hardwareUDPReceivePort, int hardwareUDPSendPort}) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({int hardwareUDPReceivePort, int hardwareUDPSendPort})
          >(value),
    );
  }
}

String _$hardwareCommunicationConfigHash() =>
    r'c91fb09a96532f99b670eaf5d07563503d25f5db';

/// A provider for a TCP server for sending/receiving data via TCP.

@ProviderFor(TcpServer)
final tcpServerProvider = TcpServerProvider._();

/// A provider for a TCP server for sending/receiving data via TCP.
final class TcpServerProvider
    extends $AsyncNotifierProvider<TcpServer, Socket?> {
  /// A provider for a TCP server for sending/receiving data via TCP.
  TcpServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tcpServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tcpServerHash();

  @$internal
  @override
  TcpServer create() => TcpServer();
}

String _$tcpServerHash() => r'1464185a533fa81ca7629aebd12bbae12769a800';

/// A provider for a TCP server for sending/receiving data via TCP.

abstract class _$TcpServer extends $AsyncNotifier<Socket?> {
  FutureOr<Socket?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Socket?>, Socket?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Socket?>, Socket?>,
              AsyncValue<Socket?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

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

@ProviderFor(NetworkAvailable)
final networkAvailableProvider = NetworkAvailableProvider._();

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
final class NetworkAvailableProvider
    extends $NotifierProvider<NetworkAvailable, bool> {
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
  NetworkAvailableProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkAvailableProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkAvailableHash();

  @$internal
  @override
  NetworkAvailable create() => NetworkAvailable();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$networkAvailableHash() => r'aa1e0d7e2aa56f8e74688eec390cade50a4d8e85';

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

abstract class _$NetworkAvailable extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
