// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the [NtripClient] provider should run.

@ProviderFor(NtripEnabled)
final ntripEnabledProvider = NtripEnabledProvider._();

/// A provider for whether the [NtripClient] provider should run.
final class NtripEnabledProvider extends $NotifierProvider<NtripEnabled, bool> {
  /// A provider for whether the [NtripClient] provider should run.
  NtripEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripEnabledProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripEnabledHash();

  @$internal
  @override
  NtripEnabled create() => NtripEnabled();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$ntripEnabledHash() => r'206cb85ab493065d30e12b6e52e6f98271870749';

/// A provider for whether the [NtripClient] provider should run.

abstract class _$NtripEnabled extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the stored [gnss.NtripProfile]s.

@ProviderFor(NtripProfiles)
final ntripProfilesProvider = NtripProfilesProvider._();

/// A provider for the stored [gnss.NtripProfile]s.
final class NtripProfilesProvider
    extends $NotifierProvider<NtripProfiles, List<gnss.NtripProfile>> {
  /// A provider for the stored [gnss.NtripProfile]s.
  NtripProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripProfilesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripProfilesHash();

  @$internal
  @override
  NtripProfiles create() => NtripProfiles();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<gnss.NtripProfile> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<gnss.NtripProfile>>(value),
    );
  }
}

String _$ntripProfilesHash() => r'1bd1d467e9ec0fc4b9065683829301ccd13989df';

/// A provider for the stored [gnss.NtripProfile]s.

abstract class _$NtripProfiles extends $Notifier<List<gnss.NtripProfile>> {
  List<gnss.NtripProfile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<gnss.NtripProfile>, List<gnss.NtripProfile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<gnss.NtripProfile>, List<gnss.NtripProfile>>,
              List<gnss.NtripProfile>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the active [gnss.NtripProfile], if there is one.

@ProviderFor(ActiveNtripProfile)
final activeNtripProfileProvider = ActiveNtripProfileProvider._();

/// A provider for the active [gnss.NtripProfile], if there is one.
final class ActiveNtripProfileProvider
    extends $NotifierProvider<ActiveNtripProfile, gnss.NtripProfile?> {
  /// A provider for the active [gnss.NtripProfile], if there is one.
  ActiveNtripProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeNtripProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeNtripProfileHash();

  @$internal
  @override
  ActiveNtripProfile create() => ActiveNtripProfile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(gnss.NtripProfile? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<gnss.NtripProfile?>(value),
    );
  }
}

String _$activeNtripProfileHash() =>
    r'e61525ad00b1ad8b510511056cd35c4801dfb75b';

/// A provider for the active [gnss.NtripProfile], if there is one.

abstract class _$ActiveNtripProfile extends $Notifier<gnss.NtripProfile?> {
  gnss.NtripProfile? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<gnss.NtripProfile?, gnss.NtripProfile?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<gnss.NtripProfile?, gnss.NtripProfile?>,
              gnss.NtripProfile?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the NTRIP data usage in bytes for this session.

@ProviderFor(NtripDataUsageSession)
final ntripDataUsageSessionProvider = NtripDataUsageSessionProvider._();

/// A provider for the NTRIP data usage in bytes for this session.
final class NtripDataUsageSessionProvider
    extends $NotifierProvider<NtripDataUsageSession, int?> {
  /// A provider for the NTRIP data usage in bytes for this session.
  NtripDataUsageSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripDataUsageSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripDataUsageSessionHash();

  @$internal
  @override
  NtripDataUsageSession create() => NtripDataUsageSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$ntripDataUsageSessionHash() =>
    r'fa7c2e5b463dff14668b2ba57d943472d7f80767';

/// A provider for the NTRIP data usage in bytes for this session.

abstract class _$NtripDataUsageSession extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for telling whether the [NtripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [NtripClient].

@ProviderFor(NtripAlive)
final ntripAliveProvider = NtripAliveProvider._();

/// A provider for telling whether the [NtripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [NtripClient].
final class NtripAliveProvider extends $NotifierProvider<NtripAlive, bool> {
  /// A provider for telling whether the [NtripClient] is receiving data.
  ///
  /// If not set to true in the last 5 seconds, it will invalidate itself and the
  /// [NtripClient].
  NtripAliveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripAliveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripAliveHash();

  @$internal
  @override
  NtripAlive create() => NtripAlive();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$ntripAliveHash() => r'd36a87c43c9d5472c0f4416974c447e6e25c173a';

/// A provider for telling whether the [NtripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [NtripClient].

abstract class _$NtripAlive extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].

@ProviderFor(NtripClient)
final ntripClientProvider = NtripClientProvider._();

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].
final class NtripClientProvider
    extends $AsyncNotifierProvider<NtripClient, gnss.NtripClient?> {
  /// A provider for creating and listening to an [NtripClient].
  ///
  /// The received NTRIP messages will be split into parts and sent to the
  /// connected [HardwareSerial] if connected or the [TcpServer].
  NtripClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripClientHash();

  @$internal
  @override
  NtripClient create() => NtripClient();
}

String _$ntripClientHash() => r'7c3ae992cbb1b8fd70973ac7ce23e1b24dd48196';

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].

abstract class _$NtripClient extends $AsyncNotifier<gnss.NtripClient?> {
  FutureOr<gnss.NtripClient?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<gnss.NtripClient?>, gnss.NtripClient?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<gnss.NtripClient?>, gnss.NtripClient?>,
              AsyncValue<gnss.NtripClient?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.

@ProviderFor(ntripSourcetable)
final ntripSourcetableProvider = NtripSourcetableFamily._();

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.

final class NtripSourcetableProvider
    extends
        $FunctionalProvider<
          AsyncValue<Iterable<gnss.NtripMountPoint>?>,
          Iterable<gnss.NtripMountPoint>?,
          FutureOr<Iterable<gnss.NtripMountPoint>?>
        >
    with
        $FutureModifier<Iterable<gnss.NtripMountPoint>?>,
        $FutureProvider<Iterable<gnss.NtripMountPoint>?> {
  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.
  NtripSourcetableProvider._({
    required NtripSourcetableFamily super.from,
    required ({String host, int port, String? username, String? password})
    super.argument,
  }) : super(
         retry: null,
         name: r'ntripSourcetableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ntripSourcetableHash();

  @override
  String toString() {
    return r'ntripSourcetableProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Iterable<gnss.NtripMountPoint>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Iterable<gnss.NtripMountPoint>?> create(Ref ref) {
    final argument =
        this.argument
            as ({String host, int port, String? username, String? password});
    return ntripSourcetable(
      ref,
      host: argument.host,
      port: argument.port,
      username: argument.username,
      password: argument.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NtripSourcetableProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ntripSourcetableHash() => r'0dc8131427a51b7173c46f82b12d19d3d892bd46';

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.

final class NtripSourcetableFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Iterable<gnss.NtripMountPoint>?>,
          ({String host, int port, String? username, String? password})
        > {
  NtripSourcetableFamily._()
    : super(
        retry: null,
        name: r'ntripSourcetableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for the NTRIP caster sourcetable for the currently selected
  /// NTRIP caster server.

  NtripSourcetableProvider call({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) => NtripSourcetableProvider._(
    argument: (host: host, port: port, username: username, password: password),
    from: this,
  );

  @override
  String toString() => r'ntripSourcetableProvider';
}

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].

@ProviderFor(ntripMountPointsSorted)
final ntripMountPointsSortedProvider = NtripMountPointsSortedFamily._();

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].

final class NtripMountPointsSortedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<gnss.NtripMountPointStream, double?>?>,
          Map<gnss.NtripMountPointStream, double?>?,
          FutureOr<Map<gnss.NtripMountPointStream, double?>?>
        >
    with
        $FutureModifier<Map<gnss.NtripMountPointStream, double?>?>,
        $FutureProvider<Map<gnss.NtripMountPointStream, double?>?> {
  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].
  NtripMountPointsSortedProvider._({
    required NtripMountPointsSortedFamily super.from,
    required ({String host, int port, String? username, String? password})
    super.argument,
  }) : super(
         retry: null,
         name: r'ntripMountPointsSortedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ntripMountPointsSortedHash();

  @override
  String toString() {
    return r'ntripMountPointsSortedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Map<gnss.NtripMountPointStream, double?>?>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<gnss.NtripMountPointStream, double?>?> create(Ref ref) {
    final argument =
        this.argument
            as ({String host, int port, String? username, String? password});
    return ntripMountPointsSorted(
      ref,
      host: argument.host,
      port: argument.port,
      username: argument.username,
      password: argument.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NtripMountPointsSortedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ntripMountPointsSortedHash() =>
    r'12514026e966d7d199baa88f30771de1b279976c';

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].

final class NtripMountPointsSortedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<gnss.NtripMountPointStream, double?>?>,
          ({String host, int port, String? username, String? password})
        > {
  NtripMountPointsSortedFamily._()
    : super(
        retry: null,
        name: r'ntripMountPointsSortedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for sorting the [ntripSourcetable] by their distance to
  /// [MainVehicle].

  NtripMountPointsSortedProvider call({
    required String host,
    int port = 2101,
    String? username,
    String? password,
  }) => NtripMountPointsSortedProvider._(
    argument: (host: host, port: port, username: username, password: password),
    from: this,
  );

  @override
  String toString() => r'ntripMountPointsSortedProvider';
}

/// A provider for a map of all recorded months with their corresponding
/// data usage.

@ProviderFor(NtripDataUsageByMonth)
final ntripDataUsageByMonthProvider = NtripDataUsageByMonthProvider._();

/// A provider for a map of all recorded months with their corresponding
/// data usage.
final class NtripDataUsageByMonthProvider
    extends $NotifierProvider<NtripDataUsageByMonth, Map<String, int>> {
  /// A provider for a map of all recorded months with their corresponding
  /// data usage.
  NtripDataUsageByMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ntripDataUsageByMonthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ntripDataUsageByMonthHash();

  @$internal
  @override
  NtripDataUsageByMonth create() => NtripDataUsageByMonth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, int>>(value),
    );
  }
}

String _$ntripDataUsageByMonthHash() =>
    r'2d1d74999707682b2ae95d2b4a2977b834e4add8';

/// A provider for a map of all recorded months with their corresponding
/// data usage.

abstract class _$NtripDataUsageByMonth extends $Notifier<Map<String, int>> {
  Map<String, int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, int>, Map<String, int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, int>, Map<String, int>>,
              Map<String, int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
