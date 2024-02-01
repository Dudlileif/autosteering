// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ntripClientHash() => r'fb1f5188c5288059dd54b523634bbae30c41f0c5';

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
String _$ntripSourcetableHash() => r'fa9a00117d9c0f8e8e43667188a328bf24f2d48a';

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
///
/// Copied from [ntripSourcetable].
@ProviderFor(ntripSourcetable)
final ntripSourcetableProvider =
    AutoDisposeFutureProvider<Iterable<NtripMountPoint>?>.internal(
  ntripSourcetable,
  name: r'ntripSourcetableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripSourcetableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NtripSourcetableRef
    = AutoDisposeFutureProviderRef<Iterable<NtripMountPoint>?>;
String _$ntripMountPointsSortedHash() =>
    r'd4e32a9ba2aa3c179491e7eadc439a40e36daeec';

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
///
/// Copied from [ntripMountPointsSorted].
@ProviderFor(ntripMountPointsSorted)
final ntripMountPointsSortedProvider =
    AutoDisposeFutureProvider<Map<NtripMountPointStream, double?>?>.internal(
  ntripMountPointsSorted,
  name: r'ntripMountPointsSortedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripMountPointsSortedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NtripMountPointsSortedRef
    = AutoDisposeFutureProviderRef<Map<NtripMountPointStream, double?>?>;
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
String _$ntripHostHash() => r'ac1883525d3e5d2a90987ce8973b9506cd405128';

/// A provider for the NTRIP caster host address.
///
/// Copied from [NtripHost].
@ProviderFor(NtripHost)
final ntripHostProvider = NotifierProvider<NtripHost, String?>.internal(
  NtripHost.new,
  name: r'ntripHostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripHostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripHost = Notifier<String?>;
String _$ntripPortHash() => r'30b47fcccbf01fd0712054310c24307464e47322';

/// A provider for the NTRIP caster port.
///
/// Copied from [NtripPort].
@ProviderFor(NtripPort)
final ntripPortProvider = NotifierProvider<NtripPort, int>.internal(
  NtripPort.new,
  name: r'ntripPortProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ntripPortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripPort = Notifier<int>;
String _$activeNtripMountPointHash() =>
    r'65bf23c96b44822bf81b72b1fec6098620c9784d';

/// A provider for the NTRIP caster mounting point.
///
/// Copied from [ActiveNtripMountPoint].
@ProviderFor(ActiveNtripMountPoint)
final activeNtripMountPointProvider =
    NotifierProvider<ActiveNtripMountPoint, String?>.internal(
  ActiveNtripMountPoint.new,
  name: r'activeNtripMountPointProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeNtripMountPointHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveNtripMountPoint = Notifier<String?>;
String _$ntripUsernameHash() => r'fe9d2c5ffcd474715779a50328285bb22fd73580';

/// A provider for the NTRIP caster username (email).
///
/// Copied from [NtripUsername].
@ProviderFor(NtripUsername)
final ntripUsernameProvider = NotifierProvider<NtripUsername, String?>.internal(
  NtripUsername.new,
  name: r'ntripUsernameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripUsernameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripUsername = Notifier<String?>;
String _$ntripPasswordHash() => r'bd139633d4980924a7e4065d5f8444ce85a1d1fc';

/// A provider for the NTRIP caster password.
///
/// Copied from [NtripPassword].
@ProviderFor(NtripPassword)
final ntripPasswordProvider = NotifierProvider<NtripPassword, String?>.internal(
  NtripPassword.new,
  name: r'ntripPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripPassword = Notifier<String?>;
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
String _$ntripAliveHash() => r'fad8e69c98d8e69f11e968a167cbb19cee075722';

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
