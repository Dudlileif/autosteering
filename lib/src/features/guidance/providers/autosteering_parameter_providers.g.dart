// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autosteering_parameter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether to show the autosteering parameter configurator.

@ProviderFor(ShowAutosteeringParameterConfig)
const showAutosteeringParameterConfigProvider =
    ShowAutosteeringParameterConfigProvider._();

/// Whether to show the autosteering parameter configurator.
final class ShowAutosteeringParameterConfigProvider
    extends $NotifierProvider<ShowAutosteeringParameterConfig, bool> {
  /// Whether to show the autosteering parameter configurator.
  const ShowAutosteeringParameterConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showAutosteeringParameterConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showAutosteeringParameterConfigHash();

  @$internal
  @override
  ShowAutosteeringParameterConfig create() => ShowAutosteeringParameterConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showAutosteeringParameterConfigHash() =>
    r'f503390f0e87a0c472c95a8edc065997b8b272c3';

/// Whether to show the autosteering parameter configurator.

abstract class _$ShowAutosteeringParameterConfig extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the UI [Offset] for the autosteering configurator.

@ProviderFor(AutosteeringConfiguratorUiOffset)
const autosteeringConfiguratorUiOffsetProvider =
    AutosteeringConfiguratorUiOffsetProvider._();

/// A provider for the UI [Offset] for the autosteering configurator.
final class AutosteeringConfiguratorUiOffsetProvider
    extends $NotifierProvider<AutosteeringConfiguratorUiOffset, Offset> {
  /// A provider for the UI [Offset] for the autosteering configurator.
  const AutosteeringConfiguratorUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autosteeringConfiguratorUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autosteeringConfiguratorUiOffsetHash();

  @$internal
  @override
  AutosteeringConfiguratorUiOffset create() =>
      AutosteeringConfiguratorUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$autosteeringConfiguratorUiOffsetHash() =>
    r'4fe5b223e7d5f4fd3b54e48836bc0bf7bab6e4df';

/// A provider for the UI [Offset] for the autosteering configurator.

abstract class _$AutosteeringConfiguratorUiOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
