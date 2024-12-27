// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wasCurrentFrequencyHash() =>
    r'f6b74cd2a414e6274cc3690c8115b96e5ab69e1f';

/// A provider for the frequency of the WAS updates.
///
/// Copied from [WasCurrentFrequency].
@ProviderFor(WasCurrentFrequency)
final wasCurrentFrequencyProvider =
    AutoDisposeNotifierProvider<WasCurrentFrequency, double?>.internal(
  WasCurrentFrequency.new,
  name: r'wasCurrentFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wasCurrentFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WasCurrentFrequency = AutoDisposeNotifier<double?>;
String _$wasCurrentReadingHash() => r'657c28334eb4a6873b3e07cd3ec3c803fd581a4f';

/// A provider for the current raw [WasReading] from the hardware.
///
/// Copied from [WasCurrentReading].
@ProviderFor(WasCurrentReading)
final wasCurrentReadingProvider =
    AutoDisposeNotifierProvider<WasCurrentReading, WasReading?>.internal(
  WasCurrentReading.new,
  name: r'wasCurrentReadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wasCurrentReadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WasCurrentReading = AutoDisposeNotifier<WasReading?>;
String _$showSteeringHardwareConfigHash() =>
    r'2a29f37ebfee0127c28ef3e6b31fd478891ed0bc';

/// Whether to show the steering hardware configurator.
///
/// Copied from [ShowSteeringHardwareConfig].
@ProviderFor(ShowSteeringHardwareConfig)
final showSteeringHardwareConfigProvider =
    AutoDisposeNotifierProvider<ShowSteeringHardwareConfig, bool>.internal(
  ShowSteeringHardwareConfig.new,
  name: r'showSteeringHardwareConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showSteeringHardwareConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowSteeringHardwareConfig = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
