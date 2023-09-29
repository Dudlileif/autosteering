// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ntripClientHash() => r'6215b81b3a98b2db6be8ad78457aa90f3e7db526';

/// A provider for creating and listening to an [NtripClient].
///
/// The receives NTRIP messages will be sent to the simulation core
/// to be sent to the hardware.
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
String _$ntripHostHash() => r'fcd36a33b8ab6214d5de1ede4d8e4ce6a34829c1';

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
String _$ntripMountPointHash() => r'21afca97ff1c7b6246967d5be1b782e611257df1';

/// A provider for the NTRIP caster mounting point.
///
/// Copied from [NtripMountPoint].
@ProviderFor(NtripMountPoint)
final ntripMountPointProvider =
    NotifierProvider<NtripMountPoint, String?>.internal(
  NtripMountPoint.new,
  name: r'ntripMountPointProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ntripMountPointHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NtripMountPoint = Notifier<String?>;
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
String _$ntripAliveHash() => r'23beb40747c96933bad2dbd8d61153e381c15f5f';

/// A provider for telling whether the [ntripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and
/// restart as false.
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
String _$gnssCurrentFixQualityHash() =>
    r'1fd6f4d7d0d331b145cb501bd0570554a8116e3f';

/// A provider for the quality of last GNSS position update.
///
/// Copied from [GnssCurrentFixQuality].
@ProviderFor(GnssCurrentFixQuality)
final gnssCurrentFixQualityProvider =
    AutoDisposeNotifierProvider<GnssCurrentFixQuality, GnssFixQuality>.internal(
  GnssCurrentFixQuality.new,
  name: r'gnssCurrentFixQualityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentFixQualityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentFixQuality = AutoDisposeNotifier<GnssFixQuality>;
String _$gnssCurrentNumSatellitesHash() =>
    r'df8161205b086b7e55479130e707be87a9b31563';

/// A provider for the quality of last GNSS position update.
///
/// Copied from [GnssCurrentNumSatellites].
@ProviderFor(GnssCurrentNumSatellites)
final gnssCurrentNumSatellitesProvider =
    AutoDisposeNotifierProvider<GnssCurrentNumSatellites, int?>.internal(
  GnssCurrentNumSatellites.new,
  name: r'gnssCurrentNumSatellitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentNumSatellitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentNumSatellites = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member