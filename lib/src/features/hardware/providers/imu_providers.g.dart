// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imuCurrentFrequencyHash() =>
    r'37d83d64c27e1793cca6b546e9777fa0157c86bc';

/// A provider for the frequency of the IMU updates.
///
/// Copied from [ImuCurrentFrequency].
@ProviderFor(ImuCurrentFrequency)
final imuCurrentFrequencyProvider =
    AutoDisposeNotifierProvider<ImuCurrentFrequency, double?>.internal(
  ImuCurrentFrequency.new,
  name: r'imuCurrentFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imuCurrentFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImuCurrentFrequency = AutoDisposeNotifier<double?>;
String _$imuCurrentReadingHash() => r'52018dd12927d1890edb4af3670eee380615e279';

/// A provider for the current raw [ImuReading] from the hardware.
///
/// Copied from [ImuCurrentReading].
@ProviderFor(ImuCurrentReading)
final imuCurrentReadingProvider =
    AutoDisposeNotifierProvider<ImuCurrentReading, ImuReading?>.internal(
  ImuCurrentReading.new,
  name: r'imuCurrentReadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imuCurrentReadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImuCurrentReading = AutoDisposeNotifier<ImuReading?>;
String _$showIMUConfigHash() => r'8ed9c315e024cd86397dfe71703d6d3a7685ddba';

/// Whether to show the IMU configurator.
///
/// Copied from [ShowIMUConfig].
@ProviderFor(ShowIMUConfig)
final showIMUConfigProvider =
    AutoDisposeNotifierProvider<ShowIMUConfig, bool>.internal(
  ShowIMUConfig.new,
  name: r'showIMUConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showIMUConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowIMUConfig = AutoDisposeNotifier<bool>;
String _$imuConfiguratorUiOffsetHash() =>
    r'f8d8aabf14a028fb7d2ec3bda828d6d7df4bc116';

/// A provider for the UI [Offset] for the IMU configurator.
///
/// Copied from [ImuConfiguratorUiOffset].
@ProviderFor(ImuConfiguratorUiOffset)
final imuConfiguratorUiOffsetProvider =
    AutoDisposeNotifierProvider<ImuConfiguratorUiOffset, Offset>.internal(
  ImuConfiguratorUiOffset.new,
  name: r'imuConfiguratorUiOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imuConfiguratorUiOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImuConfiguratorUiOffset = AutoDisposeNotifier<Offset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
