// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the frequency of the IMU updates.

@ProviderFor(ImuCurrentFrequency)
final imuCurrentFrequencyProvider = ImuCurrentFrequencyProvider._();

/// A provider for the frequency of the IMU updates.
final class ImuCurrentFrequencyProvider
    extends $NotifierProvider<ImuCurrentFrequency, double?> {
  /// A provider for the frequency of the IMU updates.
  ImuCurrentFrequencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imuCurrentFrequencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imuCurrentFrequencyHash();

  @$internal
  @override
  ImuCurrentFrequency create() => ImuCurrentFrequency();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$imuCurrentFrequencyHash() =>
    r'd112870aa7825e526bf952a301069f32cb1d3300';

/// A provider for the frequency of the IMU updates.

abstract class _$ImuCurrentFrequency extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the current raw [ImuReading] from the hardware.

@ProviderFor(ImuCurrentReading)
final imuCurrentReadingProvider = ImuCurrentReadingProvider._();

/// A provider for the current raw [ImuReading] from the hardware.
final class ImuCurrentReadingProvider
    extends $NotifierProvider<ImuCurrentReading, ImuReading?> {
  /// A provider for the current raw [ImuReading] from the hardware.
  ImuCurrentReadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imuCurrentReadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imuCurrentReadingHash();

  @$internal
  @override
  ImuCurrentReading create() => ImuCurrentReading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImuReading? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImuReading?>(value),
    );
  }
}

String _$imuCurrentReadingHash() => r'070a568db893b517e501acd6245fd20555b388fe';

/// A provider for the current raw [ImuReading] from the hardware.

abstract class _$ImuCurrentReading extends $Notifier<ImuReading?> {
  ImuReading? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ImuReading?, ImuReading?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ImuReading?, ImuReading?>,
              ImuReading?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether to show the IMU configurator.

@ProviderFor(ShowIMUConfig)
final showIMUConfigProvider = ShowIMUConfigProvider._();

/// Whether to show the IMU configurator.
final class ShowIMUConfigProvider
    extends $NotifierProvider<ShowIMUConfig, bool> {
  /// Whether to show the IMU configurator.
  ShowIMUConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showIMUConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showIMUConfigHash();

  @$internal
  @override
  ShowIMUConfig create() => ShowIMUConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showIMUConfigHash() => r'8ed9c315e024cd86397dfe71703d6d3a7685ddba';

/// Whether to show the IMU configurator.

abstract class _$ShowIMUConfig extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the UI [Offset] for the IMU configurator.

@ProviderFor(ImuConfiguratorUiOffset)
final imuConfiguratorUiOffsetProvider = ImuConfiguratorUiOffsetProvider._();

/// A provider for the UI [Offset] for the IMU configurator.
final class ImuConfiguratorUiOffsetProvider
    extends $NotifierProvider<ImuConfiguratorUiOffset, Offset> {
  /// A provider for the UI [Offset] for the IMU configurator.
  ImuConfiguratorUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imuConfiguratorUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imuConfiguratorUiOffsetHash();

  @$internal
  @override
  ImuConfiguratorUiOffset create() => ImuConfiguratorUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$imuConfiguratorUiOffsetHash() =>
    r'eb6d1333244a54e66f78c9481d0c91048863e796';

/// A provider for the UI [Offset] for the IMU configurator.

abstract class _$ImuConfiguratorUiOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
