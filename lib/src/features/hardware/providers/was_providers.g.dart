// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the frequency of the WAS updates.

@ProviderFor(WasCurrentFrequency)
final wasCurrentFrequencyProvider = WasCurrentFrequencyProvider._();

/// A provider for the frequency of the WAS updates.
final class WasCurrentFrequencyProvider
    extends $NotifierProvider<WasCurrentFrequency, double?> {
  /// A provider for the frequency of the WAS updates.
  WasCurrentFrequencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wasCurrentFrequencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wasCurrentFrequencyHash();

  @$internal
  @override
  WasCurrentFrequency create() => WasCurrentFrequency();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$wasCurrentFrequencyHash() =>
    r'f6b74cd2a414e6274cc3690c8115b96e5ab69e1f';

/// A provider for the frequency of the WAS updates.

abstract class _$WasCurrentFrequency extends $Notifier<double?> {
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

/// A provider for the current raw [WasReading] from the hardware.

@ProviderFor(WasCurrentReading)
final wasCurrentReadingProvider = WasCurrentReadingProvider._();

/// A provider for the current raw [WasReading] from the hardware.
final class WasCurrentReadingProvider
    extends $NotifierProvider<WasCurrentReading, WasReading?> {
  /// A provider for the current raw [WasReading] from the hardware.
  WasCurrentReadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wasCurrentReadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wasCurrentReadingHash();

  @$internal
  @override
  WasCurrentReading create() => WasCurrentReading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WasReading? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WasReading?>(value),
    );
  }
}

String _$wasCurrentReadingHash() => r'657c28334eb4a6873b3e07cd3ec3c803fd581a4f';

/// A provider for the current raw [WasReading] from the hardware.

abstract class _$WasCurrentReading extends $Notifier<WasReading?> {
  WasReading? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WasReading?, WasReading?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WasReading?, WasReading?>,
              WasReading?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether to show the steering hardware configurator.

@ProviderFor(ShowSteeringHardwareConfig)
final showSteeringHardwareConfigProvider =
    ShowSteeringHardwareConfigProvider._();

/// Whether to show the steering hardware configurator.
final class ShowSteeringHardwareConfigProvider
    extends $NotifierProvider<ShowSteeringHardwareConfig, bool> {
  /// Whether to show the steering hardware configurator.
  ShowSteeringHardwareConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showSteeringHardwareConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showSteeringHardwareConfigHash();

  @$internal
  @override
  ShowSteeringHardwareConfig create() => ShowSteeringHardwareConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showSteeringHardwareConfigHash() =>
    r'2a29f37ebfee0127c28ef3e6b31fd478891ed0bc';

/// Whether to show the steering hardware configurator.

abstract class _$ShowSteeringHardwareConfig extends $Notifier<bool> {
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
