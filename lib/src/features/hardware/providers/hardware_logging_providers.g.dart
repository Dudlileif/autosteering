// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hardwareAnyLoggingEnabledHash() =>
    r'beaaa81e27aac3c9beeefdb66435243fdc38c396';

/// A provider for whether any hardware logging is taking place.
///
/// Copied from [hardwareAnyLoggingEnabled].
@ProviderFor(hardwareAnyLoggingEnabled)
final hardwareAnyLoggingEnabledProvider = AutoDisposeProvider<bool>.internal(
  hardwareAnyLoggingEnabled,
  name: r'hardwareAnyLoggingEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareAnyLoggingEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareAnyLoggingEnabledRef = AutoDisposeProviderRef<bool>;
String _$hardwareLogGnssHash() => r'608f130f5218ad63263ad7df2db59bdadc9b138e';

/// A provider for whether received NMEA messages should be logged.
///
/// Copied from [HardwareLogGnss].
@ProviderFor(HardwareLogGnss)
final hardwareLogGnssProvider =
    NotifierProvider<HardwareLogGnss, bool>.internal(
  HardwareLogGnss.new,
  name: r'hardwareLogGnssProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareLogGnssHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareLogGnss = Notifier<bool>;
String _$hardwareLogImuHash() => r'9b7232a547328b9ec19fc5904e0c35f558c704c4';

/// A provider for whether received IMU messages should be logged.
///
/// Copied from [HardwareLogImu].
@ProviderFor(HardwareLogImu)
final hardwareLogImuProvider = NotifierProvider<HardwareLogImu, bool>.internal(
  HardwareLogImu.new,
  name: r'hardwareLogImuProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareLogImuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareLogImu = Notifier<bool>;
String _$hardwareLogWasHash() => r'3e4ffa066fe9ab10cae29d92bec7a08a7b2b24a5';

/// A provider for whether received WAS messages should be logged.
///
/// Copied from [HardwareLogWas].
@ProviderFor(HardwareLogWas)
final hardwareLogWasProvider = NotifierProvider<HardwareLogWas, bool>.internal(
  HardwareLogWas.new,
  name: r'hardwareLogWasProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareLogWasHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareLogWas = Notifier<bool>;
String _$hardwareLogCombinedHash() =>
    r'da33dc4e518ef212634abd8af037473426ae4bb5';

/// A provider for whether received NMEA, IMU and WAS messages should be logged
/// in a single file.
///
/// Copied from [HardwareLogCombined].
@ProviderFor(HardwareLogCombined)
final hardwareLogCombinedProvider =
    NotifierProvider<HardwareLogCombined, bool>.internal(
  HardwareLogCombined.new,
  name: r'hardwareLogCombinedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareLogCombinedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareLogCombined = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
