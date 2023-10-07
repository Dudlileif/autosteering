// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gnssCurrentFixQualityHash() =>
    r'fd392c786494039b8e98c28688897ff753c7a135';

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
    r'b05fb57c7253ab659d7253e499a3e26efc1b2a28';

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
String _$gnssCurrentHdopHash() => r'422908b71836c9ddd1764fcb47e8a05309f42c32';

/// A provider for the HDOP (horizontal dilution of position) of the GNSS fix.
///
/// Copied from [GnssCurrentHdop].
@ProviderFor(GnssCurrentHdop)
final gnssCurrentHdopProvider =
    AutoDisposeNotifierProvider<GnssCurrentHdop, double?>.internal(
  GnssCurrentHdop.new,
  name: r'gnssCurrentHdopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentHdopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentHdop = AutoDisposeNotifier<double?>;
String _$gnssCurrentAltitudeHash() =>
    r'9c80e97b198302e0822b0735415bfcff6b3bdc44';

/// A provider for the GNSS altifude.
///
/// Copied from [GnssCurrentAltitude].
@ProviderFor(GnssCurrentAltitude)
final gnssCurrentAltitudeProvider =
    AutoDisposeNotifierProvider<GnssCurrentAltitude, double?>.internal(
  GnssCurrentAltitude.new,
  name: r'gnssCurrentAltitudeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentAltitudeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentAltitude = AutoDisposeNotifier<double?>;
String _$gnssCurrentFrequencyHash() =>
    r'a9f9e06836850d0f3029ceaf86e30a0bb6e4dc37';

/// A provider for the frequency of the GNSS updates.
///
/// Copied from [GnssCurrentFrequency].
@ProviderFor(GnssCurrentFrequency)
final gnssCurrentFrequencyProvider =
    AutoDisposeNotifierProvider<GnssCurrentFrequency, double?>.internal(
  GnssCurrentFrequency.new,
  name: r'gnssCurrentFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentFrequency = AutoDisposeNotifier<double?>;
String _$gnssLastUpdateTimeHash() =>
    r'9669eef679461a6c981e15186e481bdde98074a6';

/// A provider for the time of the last GNSS update.
///
/// Copied from [GnssLastUpdateTime].
@ProviderFor(GnssLastUpdateTime)
final gnssLastUpdateTimeProvider = AutoDisposeNotifierProvider<
    GnssLastUpdateTime,
    ({DateTime device, DateTime? receiver, Duration? delay})?>.internal(
  GnssLastUpdateTime.new,
  name: r'gnssLastUpdateTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssLastUpdateTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssLastUpdateTime = AutoDisposeNotifier<
    ({DateTime device, DateTime? receiver, Duration? delay})?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
