// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imuCurrentFrequencyHash() =>
    r'94f8f1cf76c7c72495570b54a23b1e78e15fa18b';

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
String _$imuCurrentReadingHash() => r'e1948ef2417c3db42821de475076825d7b40d762';

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
    r'eb6d1333244a54e66f78c9481d0c91048863e796';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
