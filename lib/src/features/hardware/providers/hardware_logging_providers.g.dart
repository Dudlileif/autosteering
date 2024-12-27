// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hardwareAnyLoggingEnabledHash() =>
    r'f2227e27c297c8ccd3f13f77961cc1be2595df98';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HardwareAnyLoggingEnabledRef = AutoDisposeProviderRef<bool>;
String _$hardwareLogGnssHash() => r'f20b996b10f18fa60de9ebb933c5b4b492283c25';

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
String _$hardwareLogImuHash() => r'411ca0416874c21c280b4773b7b4225c6033384e';

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
String _$hardwareLogWasHash() => r'8b2b48bf43260b23f720214db9c933a381db6d8a';

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
    r'749635bd24d71d663ab90085c0f1c674b376d9ff';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
