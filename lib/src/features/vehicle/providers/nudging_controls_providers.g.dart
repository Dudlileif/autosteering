// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nudging_controls_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showNudgingControlsHash() =>
    r'0dad3b04b0d13a6eeb7866ec732c8320f20ca689';

/// A provider for whether to show the vehicle nudging controls.
///
/// Copied from [ShowNudgingControls].
@ProviderFor(ShowNudgingControls)
final showNudgingControlsProvider =
    AutoDisposeNotifierProvider<ShowNudgingControls, bool>.internal(
  ShowNudgingControls.new,
  name: r'showNudgingControlsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showNudgingControlsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowNudgingControls = AutoDisposeNotifier<bool>;
String _$nudgeStepSizeHash() => r'06bea33605b68c695136fa207893bf5d12e29463';

/// A provider for the step size of a nudge.
///
/// Copied from [NudgeStepSize].
@ProviderFor(NudgeStepSize)
final nudgeStepSizeProvider = NotifierProvider<NudgeStepSize, double>.internal(
  NudgeStepSize.new,
  name: r'nudgeStepSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nudgeStepSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NudgeStepSize = Notifier<double>;
String _$nudgingControlsUiOffsetHash() =>
    r'e6b94da9051609b2c71dae0d2d2121c0a1367215';

/// A provider for the UI [Offset] for the nudging controls.
///
/// Copied from [NudgingControlsUiOffset].
@ProviderFor(NudgingControlsUiOffset)
final nudgingControlsUiOffsetProvider =
    AutoDisposeNotifierProvider<NudgingControlsUiOffset, Offset>.internal(
  NudgingControlsUiOffset.new,
  name: r'nudgingControlsUiOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nudgingControlsUiOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NudgingControlsUiOffset = AutoDisposeNotifier<Offset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
