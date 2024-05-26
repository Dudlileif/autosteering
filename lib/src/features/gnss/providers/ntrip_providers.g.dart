// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ntripClientHash() => r'd41e6143bcc741c26dd8f8d67e7cb0faad83e671';

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].
///
/// Copied from [ntripClient].
@ProviderFor(ntripClient)
final ntripClientProvider = FutureProvider<NtripClient?>.internal(
  ntripClient,
  name: r'ntripClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NtripClientRef = FutureProviderRef<NtripClient?>;
String _$ntripSourcetableHash() => r'4fc1db0b1322f82b1b176094ad7baf9386fedc33';

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
class NtripSourcetableFamily extends Family {
  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.
  ///
  /// Copied from [ntripSourcetable].
  const NtripSourcetableFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ntripSourcetableProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Iterable<NtripMountPoint>?> Function(NtripSourcetableRef ref)
          create) {
    return _$NtripSourcetableFamilyOverride(this, create);
  }
}

class _$NtripSourcetableFamilyOverride implements FamilyOverride {
  _$NtripSourcetableFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Iterable<NtripMountPoint>?> Function(NtripSourcetableRef ref)
      create;

  @override
  final NtripSourcetableFamily overriddenFamily;

  @override
  NtripSourcetableProvider getProviderOverride(
    covariant NtripSourcetableProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
///
/// Copied from [ntripSourcetable].
class NtripSourcetableProvider
    extends AutoDisposeFutureProvider<Iterable<NtripMountPoint>?> {
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
    super.create, {
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
    FutureOr<Iterable<NtripMountPoint>?> Function(NtripSourcetableRef ref)
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
  ({
    String host,
    int port,
    String? username,
    String? password,
  }) get argument {
    return (
      host: host,
      port: port,
      username: username,
      password: password,
    );
  }

  @override
  AutoDisposeFutureProviderElement<Iterable<NtripMountPoint>?> createElement() {
    return _NtripSourcetableProviderElement(this);
  }

  NtripSourcetableProvider _copyWith(
    FutureOr<Iterable<NtripMountPoint>?> Function(NtripSourcetableRef ref)
        create,
  ) {
    return NtripSourcetableProvider._internal(
      (ref) => create(ref as NtripSourcetableRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      host: host,
      port: port,
      username: username,
      password: password,
    );
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

mixin NtripSourcetableRef
    on AutoDisposeFutureProviderRef<Iterable<NtripMountPoint>?> {
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
    extends AutoDisposeFutureProviderElement<Iterable<NtripMountPoint>?>
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
    r'1d11d8cd14a89069242e34c4a5ad3d3b89c4735c';

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
class NtripMountPointsSortedFamily extends Family {
  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].
  ///
  /// Copied from [ntripMountPointsSorted].
  const NtripMountPointsSortedFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ntripMountPointsSortedProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Map<NtripMountPointStream, double?>?> Function(
              NtripMountPointsSortedRef ref)
          create) {
    return _$NtripMountPointsSortedFamilyOverride(this, create);
  }
}

class _$NtripMountPointsSortedFamilyOverride implements FamilyOverride {
  _$NtripMountPointsSortedFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Map<NtripMountPointStream, double?>?> Function(
      NtripMountPointsSortedRef ref) create;

  @override
  final NtripMountPointsSortedFamily overriddenFamily;

  @override
  NtripMountPointsSortedProvider getProviderOverride(
    covariant NtripMountPointsSortedProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
///
/// Copied from [ntripMountPointsSorted].
class NtripMountPointsSortedProvider
    extends AutoDisposeFutureProvider<Map<NtripMountPointStream, double?>?> {
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
    super.create, {
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
    FutureOr<Map<NtripMountPointStream, double?>?> Function(
            NtripMountPointsSortedRef ref)
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
  ({
    String host,
    int port,
    String? username,
    String? password,
  }) get argument {
    return (
      host: host,
      port: port,
      username: username,
      password: password,
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<NtripMountPointStream, double?>?>
      createElement() {
    return _NtripMountPointsSortedProviderElement(this);
  }

  NtripMountPointsSortedProvider _copyWith(
    FutureOr<Map<NtripMountPointStream, double?>?> Function(
            NtripMountPointsSortedRef ref)
        create,
  ) {
    return NtripMountPointsSortedProvider._internal(
      (ref) => create(ref as NtripMountPointsSortedRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      host: host,
      port: port,
      username: username,
      password: password,
    );
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

mixin NtripMountPointsSortedRef
    on AutoDisposeFutureProviderRef<Map<NtripMountPointStream, double?>?> {
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
        Map<NtripMountPointStream, double?>?> with NtripMountPointsSortedRef {
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

String _$ntripEnabledHash() => r'b4af9922a2c6f028ece8fd3808d7457b513ab338';

/// A provider for whether the [ntripClient] provider should run.
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
String _$ntripProfilesHash() => r'b03548c94d5628aa11766bd3b363c581a318dc99';

/// A provider for the stored [NtripProfile]s.
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
    r'339bb950ce22c402fc1ed3e1979892a98bb0ac28';

/// A provider for the active [NtripProfile], if there is one.
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
String _$ntripAliveHash() => r'a073b2419fdf2a96027eeee50c84ad2610a3fe4b';

/// A provider for telling whether the [ntripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [ntripClient].
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
String _$ntripDataUsageByMonthHash() =>
    r'df57fee66524b28d3148555e618e28e8f7214068';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
