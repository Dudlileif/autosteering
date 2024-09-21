// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gnssCurrentSentenceHash() =>
    r'b633b27f2ea1845fbf75433c6c19c90be14d92dd';

/// A provider for the quality of last GNSS position update.
///
/// Copied from [GnssCurrentSentence].
@ProviderFor(GnssCurrentSentence)
final gnssCurrentSentenceProvider = AutoDisposeNotifierProvider<
    GnssCurrentSentence, GnssPositionCommonSentence?>.internal(
  GnssCurrentSentence.new,
  name: r'gnssCurrentSentenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssCurrentSentenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssCurrentSentence
    = AutoDisposeNotifier<GnssPositionCommonSentence?>;
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
String _$gnssPrecisionErrorHash() =>
    r'f49ee5613da049a6fe1899938e42f8af8df465dc';

/// A provider for the precision error of the last GNSS update.
///
/// Copied from [GnssPrecisionError].
@ProviderFor(GnssPrecisionError)
final gnssPrecisionErrorProvider = AutoDisposeNotifierProvider<
    GnssPrecisionError,
    ({
      double? latitudeError,
      double? longitudeError,
      double? altitudeError
    })?>.internal(
  GnssPrecisionError.new,
  name: r'gnssPrecisionErrorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssPrecisionErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssPrecisionError = AutoDisposeNotifier<
    ({double? latitudeError, double? longitudeError, double? altitudeError})?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
