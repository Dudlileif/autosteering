// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the current AB tracking type.

@ProviderFor(CurrentABTrackingType)
final currentABTrackingTypeProvider = CurrentABTrackingTypeProvider._();

/// A provider for the current AB tracking type.
final class CurrentABTrackingTypeProvider
    extends $NotifierProvider<CurrentABTrackingType, ABTrackingType> {
  /// A provider for the current AB tracking type.
  CurrentABTrackingTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentABTrackingTypeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentABTrackingTypeHash();

  @$internal
  @override
  CurrentABTrackingType create() => CurrentABTrackingType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ABTrackingType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ABTrackingType>(value),
    );
  }
}

String _$currentABTrackingTypeHash() =>
    r'6802edd8d8bf0a49686c0f342ef11b30b92d915d';

/// A provider for the current AB tracking type.

abstract class _$CurrentABTrackingType extends $Notifier<ABTrackingType> {
  ABTrackingType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ABTrackingType, ABTrackingType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ABTrackingType, ABTrackingType>,
              ABTrackingType,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the AB-tracking should be shown.

@ProviderFor(ShowABTracking)
final showABTrackingProvider = ShowABTrackingProvider._();

/// A provider for whether the AB-tracking should be shown.
final class ShowABTrackingProvider
    extends $NotifierProvider<ShowABTracking, bool> {
  /// A provider for whether the AB-tracking should be shown.
  ShowABTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showABTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showABTrackingHash();

  @$internal
  @override
  ShowABTracking create() => ShowABTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showABTrackingHash() => r'9025fd2e2aef2696692f439fd53d1b512ae84958';

/// A provider for whether the AB-tracking should be shown.

abstract class _$ShowABTracking extends $Notifier<bool> {
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

/// A provider for whether the AB-tracking debug features should be shown.

@ProviderFor(DebugABTracking)
final debugABTrackingProvider = DebugABTrackingProvider._();

/// A provider for whether the AB-tracking debug features should be shown.
final class DebugABTrackingProvider
    extends $NotifierProvider<DebugABTracking, bool> {
  /// A provider for whether the AB-tracking debug features should be shown.
  DebugABTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugABTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugABTrackingHash();

  @$internal
  @override
  DebugABTracking create() => DebugABTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugABTrackingHash() => r'4b7ddb864844d94c5bc11ff2114f8cdb0bf3e484';

/// A provider for whether the AB-tracking debug features should be shown.

abstract class _$DebugABTracking extends $Notifier<bool> {
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

/// A provider for the step size of an AB-line.

@ProviderFor(ABDebugStepSize)
final aBDebugStepSizeProvider = ABDebugStepSizeProvider._();

/// A provider for the step size of an AB-line.
final class ABDebugStepSizeProvider
    extends $NotifierProvider<ABDebugStepSize, double> {
  /// A provider for the step size of an AB-line.
  ABDebugStepSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBDebugStepSizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBDebugStepSizeHash();

  @$internal
  @override
  ABDebugStepSize create() => ABDebugStepSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$aBDebugStepSizeHash() => r'9758a5466afb606e1e296ec4d9f2ee6b298d33fb';

/// A provider for the step size of an AB-line.

abstract class _$ABDebugStepSize extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.

@ProviderFor(ABDebugNumPointsAhead)
final aBDebugNumPointsAheadProvider = ABDebugNumPointsAheadProvider._();

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
final class ABDebugNumPointsAheadProvider
    extends $NotifierProvider<ABDebugNumPointsAhead, int> {
  /// A provider for the number of points of the closest AB-line to be
  /// generated ahead of the vehicle.
  ABDebugNumPointsAheadProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBDebugNumPointsAheadProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBDebugNumPointsAheadHash();

  @$internal
  @override
  ABDebugNumPointsAhead create() => ABDebugNumPointsAhead();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$aBDebugNumPointsAheadHash() =>
    r'a24e5516cdedc8d4985daaf97909b1d807e202ce';

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.

abstract class _$ABDebugNumPointsAhead extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.

@ProviderFor(ABDebugNumPointsBehind)
final aBDebugNumPointsBehindProvider = ABDebugNumPointsBehindProvider._();

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
final class ABDebugNumPointsBehindProvider
    extends $NotifierProvider<ABDebugNumPointsBehind, int> {
  /// A provider for the number of points of the closest AB-line to be
  /// generated behind of the vehicle.
  ABDebugNumPointsBehindProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBDebugNumPointsBehindProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBDebugNumPointsBehindHash();

  @$internal
  @override
  ABDebugNumPointsBehind create() => ABDebugNumPointsBehind();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$aBDebugNumPointsBehindHash() =>
    r'82eb31cd0a86a56720db3038aa3365c826afb89d';

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.

abstract class _$ABDebugNumPointsBehind extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the width of an AB-line.

@ProviderFor(ABWidth)
final aBWidthProvider = ABWidthProvider._();

/// A provider for the width of an AB-line.
final class ABWidthProvider extends $NotifierProvider<ABWidth, double> {
  /// A provider for the width of an AB-line.
  ABWidthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBWidthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBWidthHash();

  @$internal
  @override
  ABWidth create() => ABWidth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$aBWidthHash() => r'fc2b4b68f975bbd6163b0f9bb1176a198d415f4e';

/// A provider for the width of an AB-line.

abstract class _$ABWidth extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the sideways offset of an AB-line.

@ProviderFor(ABSidewaysOffset)
final aBSidewaysOffsetProvider = ABSidewaysOffsetProvider._();

/// A provider for the sideways offset of an AB-line.
final class ABSidewaysOffsetProvider
    extends $NotifierProvider<ABSidewaysOffset, double> {
  /// A provider for the sideways offset of an AB-line.
  ABSidewaysOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBSidewaysOffsetProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBSidewaysOffsetHash();

  @$internal
  @override
  ABSidewaysOffset create() => ABSidewaysOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$aBSidewaysOffsetHash() => r'b1fd3bf03e7b556ba796993d2946c2dc7f1a9ffb';

/// A provider for the sideways offset of an AB-line.

abstract class _$ABSidewaysOffset extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the turning radius of an AB-line.

@ProviderFor(ABTurningRadius)
final aBTurningRadiusProvider = ABTurningRadiusProvider._();

/// A provider for the turning radius of an AB-line.
final class ABTurningRadiusProvider
    extends $NotifierProvider<ABTurningRadius, double> {
  /// A provider for the turning radius of an AB-line.
  ABTurningRadiusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBTurningRadiusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBTurningRadiusHash();

  @$internal
  @override
  ABTurningRadius create() => ABTurningRadius();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$aBTurningRadiusHash() => r'615d6433b0ca314298f69339c19208d00ceb5df9';

/// A provider for the turning radius of an AB-line.

abstract class _$ABTurningRadius extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the width of an AB-line.

@ProviderFor(ABTurnOffsetMinSkips)
final aBTurnOffsetMinSkipsProvider = ABTurnOffsetMinSkipsProvider._();

/// A provider for the width of an AB-line.
final class ABTurnOffsetMinSkipsProvider
    extends $NotifierProvider<ABTurnOffsetMinSkips, int> {
  /// A provider for the width of an AB-line.
  ABTurnOffsetMinSkipsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBTurnOffsetMinSkipsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBTurnOffsetMinSkipsHash();

  @$internal
  @override
  ABTurnOffsetMinSkips create() => ABTurnOffsetMinSkips();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$aBTurnOffsetMinSkipsHash() =>
    r'6f3450111f49b0865b57f009cd9c8520d7d5612f';

/// A provider for the width of an AB-line.

abstract class _$ABTurnOffsetMinSkips extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which limit mode the AB tracking should use.

@ProviderFor(ABTrackingLimitMode)
final aBTrackingLimitModeProvider = ABTrackingLimitModeProvider._();

/// A provider for which limit mode the AB tracking should use.
final class ABTrackingLimitModeProvider
    extends $NotifierProvider<ABTrackingLimitMode, ABLimitMode> {
  /// A provider for which limit mode the AB tracking should use.
  ABTrackingLimitModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBTrackingLimitModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBTrackingLimitModeHash();

  @$internal
  @override
  ABTrackingLimitMode create() => ABTrackingLimitMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ABLimitMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ABLimitMode>(value),
    );
  }
}

String _$aBTrackingLimitModeHash() =>
    r'4b9a4b894392288254646d6d52104e80a5663da6';

/// A provider for which limit mode the AB tracking should use.

abstract class _$ABTrackingLimitMode extends $Notifier<ABLimitMode> {
  ABLimitMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ABLimitMode, ABLimitMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ABLimitMode, ABLimitMode>,
              ABLimitMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which swapping which way the AB-tracking should turn.

@ProviderFor(ABOffsetOppositeTurn)
final aBOffsetOppositeTurnProvider = ABOffsetOppositeTurnProvider._();

/// A provider for which swapping which way the AB-tracking should turn.
final class ABOffsetOppositeTurnProvider
    extends $NotifierProvider<ABOffsetOppositeTurn, bool> {
  /// A provider for which swapping which way the AB-tracking should turn.
  ABOffsetOppositeTurnProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBOffsetOppositeTurnProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBOffsetOppositeTurnHash();

  @$internal
  @override
  ABOffsetOppositeTurn create() => ABOffsetOppositeTurn();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$aBOffsetOppositeTurnHash() =>
    r'6b1d3d2532a51ae4c8c6a20b617d00bdcacba1d7';

/// A provider for which swapping which way the AB-tracking should turn.

abstract class _$ABOffsetOppositeTurn extends $Notifier<bool> {
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

/// A provider for whether the AB-tracking should snap to the closest line.

@ProviderFor(ABSnapToClosestLine)
final aBSnapToClosestLineProvider = ABSnapToClosestLineProvider._();

/// A provider for whether the AB-tracking should snap to the closest line.
final class ABSnapToClosestLineProvider
    extends $NotifierProvider<ABSnapToClosestLine, bool> {
  /// A provider for whether the AB-tracking should snap to the closest line.
  ABSnapToClosestLineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBSnapToClosestLineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBSnapToClosestLineHash();

  @$internal
  @override
  ABSnapToClosestLine create() => ABSnapToClosestLine();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$aBSnapToClosestLineHash() =>
    r'6f02dc850fb6546352f016266ba7445aef21c9f0';

/// A provider for whether the AB-tracking should snap to the closest line.

abstract class _$ABSnapToClosestLine extends $Notifier<bool> {
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

/// A provider for the currently configured [ABTracking].

@ProviderFor(ConfiguredABTracking)
final configuredABTrackingProvider = ConfiguredABTrackingProvider._();

/// A provider for the currently configured [ABTracking].
final class ConfiguredABTrackingProvider
    extends $NotifierProvider<ConfiguredABTracking, ABTracking?> {
  /// A provider for the currently configured [ABTracking].
  ConfiguredABTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredABTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredABTrackingHash();

  @$internal
  @override
  ConfiguredABTracking create() => ConfiguredABTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ABTracking? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ABTracking?>(value),
    );
  }
}

String _$configuredABTrackingHash() =>
    r'5b086ad383e613ff2964c0e97a92c9282bb892f1';

/// A provider for the currently configured [ABTracking].

abstract class _$ConfiguredABTracking extends $Notifier<ABTracking?> {
  ABTracking? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ABTracking?, ABTracking?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ABTracking?, ABTracking?>,
              ABTracking?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the currently configured [ABTracking].

@ProviderFor(ConfiguredMenuABTracking)
final configuredMenuABTrackingProvider = ConfiguredMenuABTrackingProvider._();

/// A provider for the currently configured [ABTracking].
final class ConfiguredMenuABTrackingProvider
    extends $AsyncNotifierProvider<ConfiguredMenuABTracking, ABTracking?> {
  /// A provider for the currently configured [ABTracking].
  ConfiguredMenuABTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredMenuABTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredMenuABTrackingHash();

  @$internal
  @override
  ConfiguredMenuABTracking create() => ConfiguredMenuABTracking();
}

String _$configuredMenuABTrackingHash() =>
    r'fd8fd83d4987359c06a488675144d5e82c0a95f4';

/// A provider for the currently configured [ABTracking].

abstract class _$ConfiguredMenuABTracking extends $AsyncNotifier<ABTracking?> {
  FutureOr<ABTracking?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ABTracking?>, ABTracking?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ABTracking?>, ABTracking?>,
              AsyncValue<ABTracking?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the [ABTracking] to display.

@ProviderFor(DisplayABTracking)
final displayABTrackingProvider = DisplayABTrackingProvider._();

/// A provider for the [ABTracking] to display.
final class DisplayABTrackingProvider
    extends $NotifierProvider<DisplayABTracking, ABTracking?> {
  /// A provider for the [ABTracking] to display.
  DisplayABTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'displayABTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$displayABTrackingHash();

  @$internal
  @override
  DisplayABTracking create() => DisplayABTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ABTracking? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ABTracking?>(value),
    );
  }
}

String _$displayABTrackingHash() => r'32b5e8257bbed076839d7d1e065d14572b2d4b2f';

/// A provider for the [ABTracking] to display.

abstract class _$DisplayABTracking extends $Notifier<ABTracking?> {
  ABTracking? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ABTracking?, ABTracking?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ABTracking?, ABTracking?>,
              ABTracking?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the starting point A of an AB-line.

@ProviderFor(ABPointA)
final aBPointAProvider = ABPointAProvider._();

/// A provider for the starting point A of an AB-line.
final class ABPointAProvider extends $NotifierProvider<ABPointA, WayPoint?> {
  /// A provider for the starting point A of an AB-line.
  ABPointAProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBPointAProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBPointAHash();

  @$internal
  @override
  ABPointA create() => ABPointA();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WayPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WayPoint?>(value),
    );
  }
}

String _$aBPointAHash() => r'512153928742a2f485f7f112a57cb15f31979475';

/// A provider for the starting point A of an AB-line.

abstract class _$ABPointA extends $Notifier<WayPoint?> {
  WayPoint? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WayPoint?, WayPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WayPoint?, WayPoint?>,
              WayPoint?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the ending point B of an AB-line.

@ProviderFor(ABPointB)
final aBPointBProvider = ABPointBProvider._();

/// A provider for the ending point B of an AB-line.
final class ABPointBProvider extends $NotifierProvider<ABPointB, WayPoint?> {
  /// A provider for the ending point B of an AB-line.
  ABPointBProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBPointBProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBPointBHash();

  @$internal
  @override
  ABPointB create() => ABPointB();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WayPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WayPoint?>(value),
    );
  }
}

String _$aBPointBHash() => r'b215b17212fbadc46b9f9cdeef89b6808953d719';

/// A provider for the ending point B of an AB-line.

abstract class _$ABPointB extends $Notifier<WayPoint?> {
  WayPoint? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WayPoint?, WayPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WayPoint?, WayPoint?>,
              WayPoint?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether to show the starting point A of an AB-line.

@ProviderFor(ShowABPointA)
final showABPointAProvider = ShowABPointAProvider._();

/// A provider for whether to show the starting point A of an AB-line.
final class ShowABPointAProvider extends $NotifierProvider<ShowABPointA, bool> {
  /// A provider for whether to show the starting point A of an AB-line.
  ShowABPointAProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showABPointAProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showABPointAHash();

  @$internal
  @override
  ShowABPointA create() => ShowABPointA();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showABPointAHash() => r'9aeb6c8f9e43081b52c30e1c75cd504de2d0034a';

/// A provider for whether to show the starting point A of an AB-line.

abstract class _$ShowABPointA extends $Notifier<bool> {
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

/// A provider for whether to show the ending point B of an AB-line.

@ProviderFor(ShowABPointB)
final showABPointBProvider = ShowABPointBProvider._();

/// A provider for whether to show the ending point B of an AB-line.
final class ShowABPointBProvider extends $NotifierProvider<ShowABPointB, bool> {
  /// A provider for whether to show the ending point B of an AB-line.
  ShowABPointBProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showABPointBProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showABPointBHash();

  @$internal
  @override
  ShowABPointB create() => ShowABPointB();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showABPointBHash() => r'd957ec5d535e0b6e2f29e00900bcae1a52ac3827';

/// A provider for whether to show the ending point B of an AB-line.

abstract class _$ShowABPointB extends $Notifier<bool> {
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

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].

@ProviderFor(abTrackingPerpendicularDistance)
final abTrackingPerpendicularDistanceProvider =
    AbTrackingPerpendicularDistanceProvider._();

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].

final class AbTrackingPerpendicularDistanceProvider
    extends $FunctionalProvider<double?, double?, double?>
    with $Provider<double?> {
  /// A provider for the perpendicular distance from the AB tracking line
  /// to the [MainVehicle].
  AbTrackingPerpendicularDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'abTrackingPerpendicularDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$abTrackingPerpendicularDistanceHash();

  @$internal
  @override
  $ProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double? create(Ref ref) {
    return abTrackingPerpendicularDistance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$abTrackingPerpendicularDistanceHash() =>
    r'5921e2605443b8d72a236ff8ad777d5749e6f6a8';

/// A provider for the currently active AB configuration.

@ProviderFor(activeABConfig)
final activeABConfigProvider = ActiveABConfigProvider._();

/// A provider for the currently active AB configuration.

final class ActiveABConfigProvider
    extends $FunctionalProvider<ABConfig, ABConfig, ABConfig>
    with $Provider<ABConfig> {
  /// A provider for the currently active AB configuration.
  ActiveABConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeABConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeABConfigHash();

  @$internal
  @override
  $ProviderElement<ABConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ABConfig create(Ref ref) {
    return activeABConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ABConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ABConfig>(value),
    );
  }
}

String _$activeABConfigHash() => r'a04ac3f20818e3dcb0c4797174bada5f38cfa463';

/// A provider for whether all the calculated lines for the AB tracking should
/// be shown.

@ProviderFor(ABTrackingShowAllLines)
final aBTrackingShowAllLinesProvider = ABTrackingShowAllLinesProvider._();

/// A provider for whether all the calculated lines for the AB tracking should
/// be shown.
final class ABTrackingShowAllLinesProvider
    extends $NotifierProvider<ABTrackingShowAllLines, bool> {
  /// A provider for whether all the calculated lines for the AB tracking should
  /// be shown.
  ABTrackingShowAllLinesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBTrackingShowAllLinesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBTrackingShowAllLinesHash();

  @$internal
  @override
  ABTrackingShowAllLines create() => ABTrackingShowAllLines();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$aBTrackingShowAllLinesHash() =>
    r'00e1cfb03e0eb198ed297d2fbcdeaa29876a7561';

/// A provider for whether all the calculated lines for the AB tracking should
/// be shown.

abstract class _$ABTrackingShowAllLines extends $Notifier<bool> {
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

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.

@ProviderFor(loadABTrackingFromFile)
final loadABTrackingFromFileProvider = LoadABTrackingFromFileFamily._();

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.

final class LoadABTrackingFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<ABTracking?>,
          ABTracking?,
          FutureOr<ABTracking?>
        >
    with $FutureModifier<ABTracking?>, $FutureProvider<ABTracking?> {
  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.
  LoadABTrackingFromFileProvider._({
    required LoadABTrackingFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadABTrackingFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadABTrackingFromFileHash();

  @override
  String toString() {
    return r'loadABTrackingFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ABTracking?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ABTracking?> create(Ref ref) {
    final argument = this.argument as String;
    return loadABTrackingFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadABTrackingFromFileProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadABTrackingFromFileHash() =>
    r'9c089210d74c10fa43ce0aea577e4c15834bbbce';

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.

final class LoadABTrackingFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ABTracking?>, String> {
  LoadABTrackingFromFileFamily._()
    : super(
        retry: null,
        name: r'loadABTrackingFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.

  LoadABTrackingFromFileProvider call(String path) =>
      LoadABTrackingFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadABTrackingFromFileProvider';
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveABTracking)
final saveABTrackingProvider = SaveABTrackingFamily._();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveABTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveABTrackingProvider._({
    required SaveABTrackingFamily super.from,
    required (ABTracking, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveABTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveABTrackingHash();

  @override
  String toString() {
    return r'saveABTrackingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as (ABTracking, {String? overrideName, bool downloadIfWeb});
    return saveABTracking(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveABTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveABTrackingHash() => r'0153ed4815d87f1d7d4cb4916655ba519f83be22';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveABTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (ABTracking, {String? overrideName, bool downloadIfWeb})
        > {
  SaveABTrackingFamily._()
    : super(
        retry: null,
        name: r'saveABTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveABTrackingProvider call(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveABTrackingProvider._(
    argument: (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'saveABTrackingProvider';
}

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportABTracking)
final exportABTrackingProvider = ExportABTrackingFamily._();

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].

final class ExportABTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportABTrackingProvider._({
    required ExportABTrackingFamily super.from,
    required (
      ABTracking, {
      String dialogTitle,
      String? overrideName,
      bool downloadIfWeb,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportABTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportABTrackingHash();

  @override
  String toString() {
    return r'exportABTrackingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as (
              ABTracking, {
              String dialogTitle,
              String? overrideName,
              bool downloadIfWeb,
            });
    return exportABTracking(
      ref,
      argument.$1,
      dialogTitle: argument.dialogTitle,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportABTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportABTrackingHash() => r'acaa25b052b9edb44f14254067b7315b7d88dc16';

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].

final class ExportABTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (
            ABTracking, {
            String dialogTitle,
            String? overrideName,
            bool downloadIfWeb,
          })
        > {
  ExportABTrackingFamily._()
    : super(
        retry: null,
        name: r'exportABTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportABTrackingProvider call(
    ABTracking tracking, {
    required String dialogTitle,
    String? overrideName,
    bool downloadIfWeb = true,
  }) => ExportABTrackingProvider._(
    argument: (
      tracking,
      dialogTitle: dialogTitle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportABTrackingProvider';
}

/// A provider for reading and holding all the saved [ABTracking] in the
/// user file directory.

@ProviderFor(savedABTrackings)
final savedABTrackingsProvider = SavedABTrackingsProvider._();

/// A provider for reading and holding all the saved [ABTracking] in the
/// user file directory.

final class SavedABTrackingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ABTracking>>,
          List<ABTracking>,
          FutureOr<List<ABTracking>>
        >
    with $FutureModifier<List<ABTracking>>, $FutureProvider<List<ABTracking>> {
  /// A provider for reading and holding all the saved [ABTracking] in the
  /// user file directory.
  SavedABTrackingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedABTrackingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedABTrackingsHash();

  @$internal
  @override
  $FutureProviderElement<List<ABTracking>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ABTracking>> create(Ref ref) {
    return savedABTrackings(ref);
  }
}

String _$savedABTrackingsHash() => r'1e113dca6f21424d1e0c9c56621eb72de77c6121';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

@ProviderFor(deleteABTracking)
final deleteABTrackingProvider = DeleteABTrackingFamily._();

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

final class DeleteABTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  DeleteABTrackingProvider._({
    required DeleteABTrackingFamily super.from,
    required (ABTracking, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'deleteABTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteABTrackingHash();

  @override
  String toString() {
    return r'deleteABTrackingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as (ABTracking, {String? overrideName, bool downloadIfWeb});
    return deleteABTracking(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteABTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteABTrackingHash() => r'70ee2f763ab0cebbce286752a32fb4b0783d0e89';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

final class DeleteABTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (ABTracking, {String? overrideName, bool downloadIfWeb})
        > {
  DeleteABTrackingFamily._()
    : super(
        retry: null,
        name: r'deleteABTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].

  DeleteABTrackingProvider call(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) => DeleteABTrackingProvider._(
    argument: (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'deleteABTrackingProvider';
}

/// A provider for importing an [ABTracking] from a file and applying it to
/// the [ConfiguredABTracking] provider.

@ProviderFor(importABTracking)
final importABTrackingProvider = ImportABTrackingFamily._();

/// A provider for importing an [ABTracking] from a file and applying it to
/// the [ConfiguredABTracking] provider.

final class ImportABTrackingProvider
    extends
        $FunctionalProvider<
          AsyncValue<ABTracking?>,
          ABTracking?,
          FutureOr<ABTracking?>
        >
    with $FutureModifier<ABTracking?>, $FutureProvider<ABTracking?> {
  /// A provider for importing an [ABTracking] from a file and applying it to
  /// the [ConfiguredABTracking] provider.
  ImportABTrackingProvider._({
    required ImportABTrackingFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importABTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importABTrackingHash();

  @override
  String toString() {
    return r'importABTrackingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ABTracking?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ABTracking?> create(Ref ref) {
    final argument = this.argument as String;
    return importABTracking(ref, dialogTitle: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportABTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importABTrackingHash() => r'c1726b7cb27a961631ff30bacd2b21789358d702';

/// A provider for importing an [ABTracking] from a file and applying it to
/// the [ConfiguredABTracking] provider.

final class ImportABTrackingFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ABTracking?>, String> {
  ImportABTrackingFamily._()
    : super(
        retry: null,
        name: r'importABTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for importing an [ABTracking] from a file and applying it to
  /// the [ConfiguredABTracking] provider.

  ImportABTrackingProvider call({required String dialogTitle}) =>
      ImportABTrackingProvider._(argument: dialogTitle, from: this);

  @override
  String toString() => r'importABTrackingProvider';
}
