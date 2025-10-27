// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether there is a connection with the steering hardware.

@ProviderFor(SteeringHardwareNetworkAlive)
const steeringHardwareNetworkAliveProvider =
    SteeringHardwareNetworkAliveProvider._();

/// A provider for whether there is a connection with the steering hardware.
final class SteeringHardwareNetworkAliveProvider
    extends $NotifierProvider<SteeringHardwareNetworkAlive, bool> {
  /// A provider for whether there is a connection with the steering hardware.
  const SteeringHardwareNetworkAliveProvider._()
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
    r'e68b0de191f2f1c5cfdd51810d8f36000619e83f';

/// A provider for whether there is a connection with the steering hardware.

abstract class _$SteeringHardwareNetworkAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for whether there is a connection with the remote control
/// hardware.

@ProviderFor(RemoteControlHardwareNetworkAlive)
const remoteControlHardwareNetworkAliveProvider =
    RemoteControlHardwareNetworkAliveProvider._();

/// A provider for whether there is a connection with the remote control
/// hardware.
final class RemoteControlHardwareNetworkAliveProvider
    extends $NotifierProvider<RemoteControlHardwareNetworkAlive, bool> {
  /// A provider for whether there is a connection with the remote control
  /// hardware.
  const RemoteControlHardwareNetworkAliveProvider._()
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
    r'08ff67c407ee215a57f4d72b6bdaf19d4fb802c6';

/// A provider for whether there is a connection with the remote control
/// hardware.

abstract class _$RemoteControlHardwareNetworkAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for all the

@ProviderFor(NetworkInterfaces)
const networkInterfacesProvider = NetworkInterfacesProvider._();

/// A provider for all the
final class NetworkInterfacesProvider
    extends $NotifierProvider<NetworkInterfaces, List<NetworkInterface>> {
  /// A provider for all the
  const NetworkInterfacesProvider._()
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
  void runBuild() {
    final created = build();
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
    element.handleValue(ref, created);
  }
}

/// A provider for the wireless IP address of the device.

@ProviderFor(DeviceIPAddressWlan)
const deviceIPAddressWlanProvider = DeviceIPAddressWlanProvider._();

/// A provider for the wireless IP address of the device.
final class DeviceIPAddressWlanProvider
    extends $NotifierProvider<DeviceIPAddressWlan, String?> {
  /// A provider for the wireless IP address of the device.
  const DeviceIPAddressWlanProvider._()
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
    r'ce074c458ebbd164aa678c97b8c31ffb02106929';

/// A provider for the wireless IP address of the device.

abstract class _$DeviceIPAddressWlan extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the access point host IP address of the device.

@ProviderFor(DeviceIPAddressAP)
const deviceIPAddressAPProvider = DeviceIPAddressAPProvider._();

/// A provider for the access point host IP address of the device.
final class DeviceIPAddressAPProvider
    extends $NotifierProvider<DeviceIPAddressAP, String?> {
  /// A provider for the access point host IP address of the device.
  const DeviceIPAddressAPProvider._()
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

String _$deviceIPAddressAPHash() => r'ce7a951ff9cdaa646e1f210b77b3ac2eef853f2c';

/// A provider for the access point host IP address of the device.

abstract class _$DeviceIPAddressAP extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the ethernet IP address of the device.

@ProviderFor(DeviceIPAddressEthernet)
const deviceIPAddressEthernetProvider = DeviceIPAddressEthernetProvider._();

/// A provider for the ethernet IP address of the device.
final class DeviceIPAddressEthernetProvider
    extends $NotifierProvider<DeviceIPAddressEthernet, String?> {
  /// A provider for the ethernet IP address of the device.
  const DeviceIPAddressEthernetProvider._()
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
    r'ce57e6b22c403d2f60015e7396b2409d9e5570ee';

/// A provider for the ethernet IP address of the device.

abstract class _$DeviceIPAddressEthernet extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.

@ProviderFor(SteeringHardwareAddress)
const steeringHardwareAddressProvider = SteeringHardwareAddressProvider._();

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.
final class SteeringHardwareAddressProvider
    extends $NotifierProvider<SteeringHardwareAddress, String> {
  /// A provider for the IP adress of the steering hardware we want to communicate
  /// with.
  const SteeringHardwareAddressProvider._()
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
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$steeringHardwareAddressHash() =>
    r'3cb2a5f5c518f59c85623b9cc2213e2bdf494396';

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.

abstract class _$SteeringHardwareAddress extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.

@ProviderFor(RemoteControlHardwareAddress)
const remoteControlHardwareAddressProvider =
    RemoteControlHardwareAddressProvider._();

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.
final class RemoteControlHardwareAddressProvider
    extends $NotifierProvider<RemoteControlHardwareAddress, String> {
  /// A provider for the IP adress of the remote control hardware we want to
  /// communicate with.
  const RemoteControlHardwareAddressProvider._()
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
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$remoteControlHardwareAddressHash() =>
    r'2c9ca0304c21a280e27dc076ad6eb73e20649aca';

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.

abstract class _$RemoteControlHardwareAddress extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the UDP receive port for the device.

@ProviderFor(HardwareUDPReceivePort)
const hardwareUDPReceivePortProvider = HardwareUDPReceivePortProvider._();

/// A provider for the UDP receive port for the device.
final class HardwareUDPReceivePortProvider
    extends $NotifierProvider<HardwareUDPReceivePort, int> {
  /// A provider for the UDP receive port for the device.
  const HardwareUDPReceivePortProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].

@ProviderFor(HardwareUDPSendPort)
const hardwareUDPSendPortProvider = HardwareUDPSendPortProvider._();

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [SteeringHardwareAddress].
final class HardwareUDPSendPortProvider
    extends $NotifierProvider<HardwareUDPSendPort, int> {
  /// A provider for the UDP send port for the device to send messages to
  /// the hardware in [SteeringHardwareAddress].
  const HardwareUDPSendPortProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the

@ProviderFor(hardwareCommunicationConfig)
const hardwareCommunicationConfigProvider =
    HardwareCommunicationConfigProvider._();

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the

final class HardwareCommunicationConfigProvider
    extends
        $FunctionalProvider<
          ({
            int hardwareUDPReceivePort,
            int hardwareUDPSendPort,
            String remoteControlHardwareAddress,
            String steeringHardwareAddress,
          }),
          ({
            int hardwareUDPReceivePort,
            int hardwareUDPSendPort,
            String remoteControlHardwareAddress,
            String steeringHardwareAddress,
          }),
          ({
            int hardwareUDPReceivePort,
            int hardwareUDPSendPort,
            String remoteControlHardwareAddress,
            String steeringHardwareAddress,
          })
        >
    with
        $Provider<
          ({
            int hardwareUDPReceivePort,
            int hardwareUDPSendPort,
            String remoteControlHardwareAddress,
            String steeringHardwareAddress,
          })
        > {
  /// A provider for the combined state of the [SteeringHardwareAddress],
  /// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
  ///
  /// The updated state is automatically sent to the
  const HardwareCommunicationConfigProvider._()
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
  $ProviderElement<
    ({
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort,
      String remoteControlHardwareAddress,
      String steeringHardwareAddress,
    })
  >
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ({
    int hardwareUDPReceivePort,
    int hardwareUDPSendPort,
    String remoteControlHardwareAddress,
    String steeringHardwareAddress,
  })
  create(Ref ref) {
    return hardwareCommunicationConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({
      int hardwareUDPReceivePort,
      int hardwareUDPSendPort,
      String remoteControlHardwareAddress,
      String steeringHardwareAddress,
    })
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({
              int hardwareUDPReceivePort,
              int hardwareUDPSendPort,
              String remoteControlHardwareAddress,
              String steeringHardwareAddress,
            })
          >(value),
    );
  }
}

String _$hardwareCommunicationConfigHash() =>
    r'2b6f034132f0d933e3fc4f5bc0b2a14d33d3e689';

/// A provider for a TCP server for sending/receiving data via TCP.

@ProviderFor(TcpServer)
const tcpServerProvider = TcpServerProvider._();

/// A provider for a TCP server for sending/receiving data via TCP.
final class TcpServerProvider
    extends $AsyncNotifierProvider<TcpServer, Socket?> {
  /// A provider for a TCP server for sending/receiving data via TCP.
  const TcpServerProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Socket?>, Socket?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Socket?>, Socket?>,
              AsyncValue<Socket?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
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
const networkAvailableProvider = NetworkAvailableProvider._();

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
  const NetworkAvailableProvider._()
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
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
