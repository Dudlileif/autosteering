// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ntripSourcetableHash() => r'0dc8131427a51b7173c46f82b12d19d3d892bd46';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
///
/// Copied from [ntripSourcetable].
@ProviderFor(ntripSourcetable)
const ntripSourcetableProvider = NtripSourcetableFamily();

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
///
/// Copied from [ntripSourcetable].
class NtripSourcetableFamily
    extends Family<AsyncValue<Iterable<gnss.NtripMountPoint>?>> {
  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.
  ///
  /// Copied from [ntripSourcetable].
  const NtripSourcetableFamily();

  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.
  ///
  /// Copied from [ntripSourcetable].
  NtripSourcetableProvider call({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) {
    return NtripSourcetableProvider(
      host: host,
      port: port,
      username: username,
      password: password,
    );
  }

  @override
  NtripSourcetableProvider getProviderOverride(
    covariant NtripSourcetableProvider provider,
  ) {
    return call(
      host: provider.host,
      port: provider.port,
      username: provider.username,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ntripSourcetableProvider';
}

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
///
/// Copied from [ntripSourcetable].
class NtripSourcetableProvider
    extends AutoDisposeFutureProvider<Iterable<gnss.NtripMountPoint>?> {
  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.
  ///
  /// Copied from [ntripSourcetable].
  NtripSourcetableProvider({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) : this._internal(
          (ref) => ntripSourcetable(
            ref as NtripSourcetableRef,
            host: host,
            port: port,
            username: username,
            password: password,
          ),
          from: ntripSourcetableProvider,
          name: r'ntripSourcetableProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ntripSourcetableHash,
          dependencies: NtripSourcetableFamily._dependencies,
          allTransitiveDependencies:
              NtripSourcetableFamily._allTransitiveDependencies,
          host: host,
          port: port,
          username: username,
          password: password,
        );

  NtripSourcetableProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.host,
    required this.port,
    required this.username,
    required this.password,
  }) : super.internal();

  final String host;
  final int port;
  final String? username;
  final String? password;

  @override
  Override overrideWith(
    FutureOr<Iterable<gnss.NtripMountPoint>?> Function(
            NtripSourcetableRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NtripSourcetableProvider._internal(
        (ref) => create(ref as NtripSourcetableRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        host: host,
        port: port,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Iterable<gnss.NtripMountPoint>?>
      createElement() {
    return _NtripSourcetableProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NtripSourcetableProvider &&
        other.host == host &&
        other.port == port &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, host.hashCode);
    hash = _SystemHash.combine(hash, port.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NtripSourcetableRef
    on AutoDisposeFutureProviderRef<Iterable<gnss.NtripMountPoint>?> {
  /// The parameter `host` of this provider.
  String get host;

  /// The parameter `port` of this provider.
  int get port;

  /// The parameter `username` of this provider.
  String? get username;

  /// The parameter `password` of this provider.
  String? get password;
}

class _NtripSourcetableProviderElement
    extends AutoDisposeFutureProviderElement<Iterable<gnss.NtripMountPoint>?>
    with NtripSourcetableRef {
  _NtripSourcetableProviderElement(super.provider);

  @override
  String get host => (origin as NtripSourcetableProvider).host;
  @override
  int get port => (origin as NtripSourcetableProvider).port;
  @override
  String? get username => (origin as NtripSourcetableProvider).username;
  @override
  String? get password => (origin as NtripSourcetableProvider).password;
}

String _$ntripMountPointsSortedHash() =>
    r'12514026e966d7d199baa88f30771de1b279976c';

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
///
/// Copied from [ntripMountPointsSorted].
@ProviderFor(ntripMountPointsSorted)
const ntripMountPointsSortedProvider = NtripMountPointsSortedFamily();

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
///
/// Copied from [ntripMountPointsSorted].
class NtripMountPointsSortedFamily
    extends Family<AsyncValue<Map<gnss.NtripMountPointStream, double?>?>> {
  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].
  ///
  /// Copied from [ntripMountPointsSorted].
  const NtripMountPointsSortedFamily();

  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].
  ///
  /// Copied from [ntripMountPointsSorted].
  NtripMountPointsSortedProvider call({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) {
    return NtripMountPointsSortedProvider(
      host: host,
      port: port,
      username: username,
      password: password,
    );
  }

  @override
  NtripMountPointsSortedProvider getProviderOverride(
    covariant NtripMountPointsSortedProvider provider,
  ) {
    return call(
      host: provider.host,
      port: provider.port,
      username: provider.username,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ntripMountPointsSortedProvider';
}

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
///
/// Copied from [ntripMountPointsSorted].
class NtripMountPointsSortedProvider extends AutoDisposeFutureProvider<
    Map<gnss.NtripMountPointStream, double?>?> {
  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].
  ///
  /// Copied from [ntripMountPointsSorted].
  NtripMountPointsSortedProvider({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) : this._internal(
          (ref) => ntripMountPointsSorted(
            ref as NtripMountPointsSortedRef,
            host: host,
            port: port,
            username: username,
            password: password,
          ),
          from: ntripMountPointsSortedProvider,
          name: r'ntripMountPointsSortedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ntripMountPointsSortedHash,
          dependencies: NtripMountPointsSortedFamily._dependencies,
          allTransitiveDependencies:
              NtripMountPointsSortedFamily._allTransitiveDependencies,
          host: host,
          port: port,
          username: username,
          password: password,
        );

  NtripMountPointsSortedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.host,
    required this.port,
    required this.username,
    required this.password,
  }) : super.internal();

  final String host;
  final int port;
  final String? username;
  final String? password;

  @override
  Override overrideWith(
    FutureOr<Map<gnss.NtripMountPointStream, double?>?> Function(
            NtripMountPointsSortedRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NtripMountPointsSortedProvider._internal(
        (ref) => create(ref as NtripMountPointsSortedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        host: host,
        port: port,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<gnss.NtripMountPointStream, double?>?>
      createElement() {
    return _NtripMountPointsSortedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NtripMountPointsSortedProvider &&
        other.host == host &&
        other.port == port &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, host.hashCode);
    hash = _SystemHash.combine(hash, port.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NtripMountPointsSortedRef
    on AutoDisposeFutureProviderRef<Map<gnss.NtripMountPointStream, double?>?> {
  /// The parameter `host` of this provider.
  String get host;

  /// The parameter `port` of this provider.
  int get port;

  /// The parameter `username` of this provider.
  String? get username;

  /// The parameter `password` of this provider.
  String? get password;
}

class _NtripMountPointsSortedProviderElement
    extends AutoDisposeFutureProviderElement<
        Map<gnss.NtripMountPointStream, double?>?>
    with NtripMountPointsSortedRef {
  _NtripMountPointsSortedProviderElement(super.provider);

  @override
  String get host => (origin as NtripMountPointsSortedProvider).host;
  @override
  int get port => (origin as NtripMountPointsSortedProvider).port;
  @override
  String? get username => (origin as NtripMountPointsSortedProvider).username;
  @override
  String? get password => (origin as NtripMountPointsSortedProvider).password;
}

String _$ntripEnabledHash() => r'206cb85ab493065d30e12b6e52e6f98271870749';

/// A provider for whether the [NtripClient] provider should run.
///
/// Copied from [NtripEnabled].
@ProviderFor(NtripEnabled)
final ntripEnabledProvider = NotifierProvider<NtripEnabled, bool>.internal(
  NtripEnabled.new,
  name: r'ntripEnabledProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripEnabled = Notifier<bool>;
String _$ntripProfilesHash() => r'1bd1d467e9ec0fc4b9065683829301ccd13989df';

/// A provider for the stored [gnss.NtripProfile]s.
///
/// Copied from [NtripProfiles].
@ProviderFor(NtripProfiles)
final ntripProfilesProvider =
    NotifierProvider<NtripProfiles, List<NtripProfile>>.internal(
  NtripProfiles.new,
  name: r'ntripProfilesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripProfilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripProfiles = Notifier<List<NtripProfile>>;
String _$activeNtripProfileHash() =>
    r'e61525ad00b1ad8b510511056cd35c4801dfb75b';

/// A provider for the active [gnss.NtripProfile], if there is one.
///
/// Copied from [ActiveNtripProfile].
@ProviderFor(ActiveNtripProfile)
final activeNtripProfileProvider =
    NotifierProvider<ActiveNtripProfile, NtripProfile?>.internal(
  ActiveNtripProfile.new,
  name: r'activeNtripProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeNtripProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveNtripProfile = Notifier<NtripProfile?>;
String _$ntripDataUsageSessionHash() =>
    r'fa7c2e5b463dff14668b2ba57d943472d7f80767';

/// A provider for the NTRIP data usage in bytes for this session.
///
/// Copied from [NtripDataUsageSession].
@ProviderFor(NtripDataUsageSession)
final ntripDataUsageSessionProvider =
    NotifierProvider<NtripDataUsageSession, int?>.internal(
  NtripDataUsageSession.new,
  name: r'ntripDataUsageSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripDataUsageSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripDataUsageSession = Notifier<int?>;
String _$ntripAliveHash() => r'b9e6ac1073b9f2d29c8bc014e5b038f092bc9d7e';

/// A provider for telling whether the [NtripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [NtripClient].
///
/// Copied from [NtripAlive].
@ProviderFor(NtripAlive)
final ntripAliveProvider = NotifierProvider<NtripAlive, bool>.internal(
  NtripAlive.new,
  name: r'ntripAliveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripAlive = Notifier<bool>;
String _$ntripClientHash() => r'a54f76fcb42d72cc74a9b6b17ef79ea3dcf7b52c';

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].
///
/// Copied from [NtripClient].
@ProviderFor(NtripClient)
final ntripClientProvider =
    AsyncNotifierProvider<NtripClient, gnss.NtripClient?>.internal(
  NtripClient.new,
  name: r'ntripClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripClient = AsyncNotifier<gnss.NtripClient?>;
String _$ntripDataUsageByMonthHash() =>
    r'115cd1c280851c38f5e54a1d0aeadd60f26f5632';

/// A provider for a map of all recorded months with their corresponding
/// data usage.
///
/// Copied from [NtripDataUsageByMonth].
@ProviderFor(NtripDataUsageByMonth)
final ntripDataUsageByMonthProvider =
    NotifierProvider<NtripDataUsageByMonth, Map<String, int>>.internal(
  NtripDataUsageByMonth.new,
  name: r'ntripDataUsageByMonthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripDataUsageByMonthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripDataUsageByMonth = Notifier<Map<String, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
