// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether received NMEA messages should be logged.

@ProviderFor(HardwareLogGnss)
final hardwareLogGnssProvider = HardwareLogGnssProvider._();

/// A provider for whether received NMEA messages should be logged.
final class HardwareLogGnssProvider
    extends $NotifierProvider<HardwareLogGnss, bool> {
  /// A provider for whether received NMEA messages should be logged.
  HardwareLogGnssProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareLogGnssProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareLogGnssHash();

  @$internal
  @override
  HardwareLogGnss create() => HardwareLogGnss();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareLogGnssHash() => r'f20b996b10f18fa60de9ebb933c5b4b492283c25';

/// A provider for whether received NMEA messages should be logged.

abstract class _$HardwareLogGnss extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether received IMU messages should be logged.

@ProviderFor(HardwareLogImu)
final hardwareLogImuProvider = HardwareLogImuProvider._();

/// A provider for whether received IMU messages should be logged.
final class HardwareLogImuProvider
    extends $NotifierProvider<HardwareLogImu, bool> {
  /// A provider for whether received IMU messages should be logged.
  HardwareLogImuProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareLogImuProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareLogImuHash();

  @$internal
  @override
  HardwareLogImu create() => HardwareLogImu();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareLogImuHash() => r'411ca0416874c21c280b4773b7b4225c6033384e';

/// A provider for whether received IMU messages should be logged.

abstract class _$HardwareLogImu extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether received WAS messages should be logged.

@ProviderFor(HardwareLogWas)
final hardwareLogWasProvider = HardwareLogWasProvider._();

/// A provider for whether received WAS messages should be logged.
final class HardwareLogWasProvider
    extends $NotifierProvider<HardwareLogWas, bool> {
  /// A provider for whether received WAS messages should be logged.
  HardwareLogWasProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareLogWasProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareLogWasHash();

  @$internal
  @override
  HardwareLogWas create() => HardwareLogWas();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareLogWasHash() => r'8b2b48bf43260b23f720214db9c933a381db6d8a';

/// A provider for whether received WAS messages should be logged.

abstract class _$HardwareLogWas extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether received NMEA, IMU and WAS messages should be logged
/// in a single file.

@ProviderFor(HardwareLogCombined)
final hardwareLogCombinedProvider = HardwareLogCombinedProvider._();

/// A provider for whether received NMEA, IMU and WAS messages should be logged
/// in a single file.
final class HardwareLogCombinedProvider
    extends $NotifierProvider<HardwareLogCombined, bool> {
  /// A provider for whether received NMEA, IMU and WAS messages should be logged
  /// in a single file.
  HardwareLogCombinedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareLogCombinedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareLogCombinedHash();

  @$internal
  @override
  HardwareLogCombined create() => HardwareLogCombined();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareLogCombinedHash() =>
    r'749635bd24d71d663ab90085c0f1c674b376d9ff';

/// A provider for whether received NMEA, IMU and WAS messages should be logged
/// in a single file.

abstract class _$HardwareLogCombined extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether any hardware logging is taking place.

@ProviderFor(hardwareAnyLoggingEnabled)
final hardwareAnyLoggingEnabledProvider = HardwareAnyLoggingEnabledProvider._();

/// A provider for whether any hardware logging is taking place.

final class HardwareAnyLoggingEnabledProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// A provider for whether any hardware logging is taking place.
  HardwareAnyLoggingEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareAnyLoggingEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareAnyLoggingEnabledHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hardwareAnyLoggingEnabled(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareAnyLoggingEnabledHash() =>
    r'f2227e27c297c8ccd3f13f77961cc1be2595df98';
