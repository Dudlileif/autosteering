// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nudging_controls_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether to show the vehicle nudging controls.

@ProviderFor(ShowNudgingControls)
final showNudgingControlsProvider = ShowNudgingControlsProvider._();

/// A provider for whether to show the vehicle nudging controls.
final class ShowNudgingControlsProvider
    extends $NotifierProvider<ShowNudgingControls, bool> {
  /// A provider for whether to show the vehicle nudging controls.
  ShowNudgingControlsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showNudgingControlsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showNudgingControlsHash();

  @$internal
  @override
  ShowNudgingControls create() => ShowNudgingControls();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showNudgingControlsHash() =>
    r'0dad3b04b0d13a6eeb7866ec732c8320f20ca689';

/// A provider for whether to show the vehicle nudging controls.

abstract class _$ShowNudgingControls extends $Notifier<bool> {
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

/// A provider for the step size of a nudge.

@ProviderFor(NudgeStepSize)
final nudgeStepSizeProvider = NudgeStepSizeProvider._();

/// A provider for the step size of a nudge.
final class NudgeStepSizeProvider
    extends $NotifierProvider<NudgeStepSize, double> {
  /// A provider for the step size of a nudge.
  NudgeStepSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nudgeStepSizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nudgeStepSizeHash();

  @$internal
  @override
  NudgeStepSize create() => NudgeStepSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$nudgeStepSizeHash() => r'06bea33605b68c695136fa207893bf5d12e29463';

/// A provider for the step size of a nudge.

abstract class _$NudgeStepSize extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the UI [Offset] for the nudging controls.

@ProviderFor(NudgingControlsUiOffset)
final nudgingControlsUiOffsetProvider = NudgingControlsUiOffsetProvider._();

/// A provider for the UI [Offset] for the nudging controls.
final class NudgingControlsUiOffsetProvider
    extends $NotifierProvider<NudgingControlsUiOffset, Offset> {
  /// A provider for the UI [Offset] for the nudging controls.
  NudgingControlsUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nudgingControlsUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nudgingControlsUiOffsetHash();

  @$internal
  @override
  NudgingControlsUiOffset create() => NudgingControlsUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$nudgingControlsUiOffsetHash() =>
    r'e6b94da9051609b2c71dae0d2d2121c0a1367215';

/// A provider for the UI [Offset] for the nudging controls.

abstract class _$NudgingControlsUiOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
