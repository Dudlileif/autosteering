// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$abTrackingPerpendicularDistanceHash() =>
    r'a51697663b64013ac069b5660ad6af160f4a3160';

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].
///
/// Copied from [abTrackingPerpendicularDistance].
@ProviderFor(abTrackingPerpendicularDistance)
final abTrackingPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  abTrackingPerpendicularDistance,
  name: r'abTrackingPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$abTrackingPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$activeABConfigHash() => r'01913754703105bf7b2eb131e99cbebe0cd06b8d';

/// A provider for the currently active AB configuration.
///
/// Copied from [activeABConfig].
@ProviderFor(activeABConfig)
final activeABConfigProvider = Provider<ABConfig>.internal(
  activeABConfig,
  name: r'activeABConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeABConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveABConfigRef = ProviderRef<ABConfig>;
String _$aBTrackingDebugShowHash() =>
    r'1fcc86d7408faea577768ca750987f0e55862ad0';

/// A provider for whether the AB-tracking debugging features should be shown.
///
/// Copied from [ABTrackingDebugShow].
@ProviderFor(ABTrackingDebugShow)
final aBTrackingDebugShowProvider =
    NotifierProvider<ABTrackingDebugShow, bool>.internal(
  ABTrackingDebugShow.new,
  name: r'aBTrackingDebugShowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTrackingDebugShowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTrackingDebugShow = Notifier<bool>;
String _$aBDebugStepSizeHash() => r'9758a5466afb606e1e296ec4d9f2ee6b298d33fb';

/// A provider for the step size of an AB-line.
///
/// Copied from [ABDebugStepSize].
@ProviderFor(ABDebugStepSize)
final aBDebugStepSizeProvider =
    NotifierProvider<ABDebugStepSize, double>.internal(
  ABDebugStepSize.new,
  name: r'aBDebugStepSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugStepSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugStepSize = Notifier<double>;
String _$aBDebugNumPointsAheadHash() =>
    r'a24e5516cdedc8d4985daaf97909b1d807e202ce';

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
///
/// Copied from [ABDebugNumPointsAhead].
@ProviderFor(ABDebugNumPointsAhead)
final aBDebugNumPointsAheadProvider =
    NotifierProvider<ABDebugNumPointsAhead, int>.internal(
  ABDebugNumPointsAhead.new,
  name: r'aBDebugNumPointsAheadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugNumPointsAheadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugNumPointsAhead = Notifier<int>;
String _$aBDebugNumPointsBehindHash() =>
    r'82eb31cd0a86a56720db3038aa3365c826afb89d';

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
///
/// Copied from [ABDebugNumPointsBehind].
@ProviderFor(ABDebugNumPointsBehind)
final aBDebugNumPointsBehindProvider =
    NotifierProvider<ABDebugNumPointsBehind, int>.internal(
  ABDebugNumPointsBehind.new,
  name: r'aBDebugNumPointsBehindProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugNumPointsBehindHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugNumPointsBehind = Notifier<int>;
String _$aBWidthHash() => r'47769e014f59ddf9602233b103ac75007e502a19';

/// A provider for the width of an AB-line.
///
/// Copied from [ABWidth].
@ProviderFor(ABWidth)
final aBWidthProvider = NotifierProvider<ABWidth, double>.internal(
  ABWidth.new,
  name: r'aBWidthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBWidthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABWidth = Notifier<double>;
String _$aBTurningRadiusHash() => r'615d6433b0ca314298f69339c19208d00ceb5df9';

/// A provider for the turning radius of an AB-line.
///
/// Copied from [ABTurningRadius].
@ProviderFor(ABTurningRadius)
final aBTurningRadiusProvider =
    NotifierProvider<ABTurningRadius, double>.internal(
  ABTurningRadius.new,
  name: r'aBTurningRadiusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTurningRadiusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTurningRadius = Notifier<double>;
String _$aBTurnOffsetMinSkipsHash() =>
    r'6f3450111f49b0865b57f009cd9c8520d7d5612f';

/// A provider for the width of an AB-line.
///
/// Copied from [ABTurnOffsetMinSkips].
@ProviderFor(ABTurnOffsetMinSkips)
final aBTurnOffsetMinSkipsProvider =
    NotifierProvider<ABTurnOffsetMinSkips, int>.internal(
  ABTurnOffsetMinSkips.new,
  name: r'aBTurnOffsetMinSkipsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTurnOffsetMinSkipsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTurnOffsetMinSkips = Notifier<int>;
String _$aBTrackingLimitModeHash() =>
    r'55d1f4397f68b4921c1985c25dcb3b86fdbd704e';

/// A provider for which limit mode the AB tracking should use.
///
/// Copied from [ABTrackingLimitMode].
@ProviderFor(ABTrackingLimitMode)
final aBTrackingLimitModeProvider =
    NotifierProvider<ABTrackingLimitMode, ABLimitMode>.internal(
  ABTrackingLimitMode.new,
  name: r'aBTrackingLimitModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTrackingLimitModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTrackingLimitMode = Notifier<ABLimitMode>;
String _$aBOffsetOppositeTurnHash() =>
    r'6b1d3d2532a51ae4c8c6a20b617d00bdcacba1d7';

/// A provider for which swapping which way the AB-tracking should turn.
///
/// Copied from [ABOffsetOppositeTurn].
@ProviderFor(ABOffsetOppositeTurn)
final aBOffsetOppositeTurnProvider =
    NotifierProvider<ABOffsetOppositeTurn, bool>.internal(
  ABOffsetOppositeTurn.new,
  name: r'aBOffsetOppositeTurnProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBOffsetOppositeTurnHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABOffsetOppositeTurn = Notifier<bool>;
String _$aBSnapToClosestLineHash() =>
    r'ba1b35f9f50fc702ca710d828742ef335261f4c4';

/// A provider for whether the AB-tracking should snap to the closest line.
///
/// Copied from [ABSnapToClosestLine].
@ProviderFor(ABSnapToClosestLine)
final aBSnapToClosestLineProvider =
    NotifierProvider<ABSnapToClosestLine, bool>.internal(
  ABSnapToClosestLine.new,
  name: r'aBSnapToClosestLineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBSnapToClosestLineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABSnapToClosestLine = Notifier<bool>;
String _$displayABTrackingHash() => r'360974096215fab89c89a88002ea487b3721f80d';

/// A provider for which limit mode the AB tracking should use.
///
/// Copied from [DisplayABTracking].
@ProviderFor(DisplayABTracking)
final displayABTrackingProvider =
    NotifierProvider<DisplayABTracking, ABTracking?>.internal(
  DisplayABTracking.new,
  name: r'displayABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayABTracking = Notifier<ABTracking?>;
String _$displayABTrackingLinesHash() =>
    r'84f7128b54aa99eb72494ee13284f6c61288e87c';

/// A provider for the calculated AB lines/curves.
///
/// Copied from [DisplayABTrackingLines].
@ProviderFor(DisplayABTrackingLines)
final displayABTrackingLinesProvider = NotifierProvider<DisplayABTrackingLines,
    Map<int, List<WayPoint>>?>.internal(
  DisplayABTrackingLines.new,
  name: r'displayABTrackingLinesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayABTrackingLinesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayABTrackingLines = Notifier<Map<int, List<WayPoint>>?>;
String _$aBPointAHash() => r'e252191ee1e97e99fda0adb571430f78018385d5';

/// A provider for the starting point A of an AB-line.
///
/// Copied from [ABPointA].
@ProviderFor(ABPointA)
final aBPointAProvider = NotifierProvider<ABPointA, WayPoint?>.internal(
  ABPointA.new,
  name: r'aBPointAProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBPointAHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABPointA = Notifier<WayPoint?>;
String _$aBPointBHash() => r'7d313dff3f305bd28b49fdee7268389566b35b42';

/// A provider for the ending point B of an AB-line.
///
/// Copied from [ABPointB].
@ProviderFor(ABPointB)
final aBPointBProvider = NotifierProvider<ABPointB, WayPoint?>.internal(
  ABPointB.new,
  name: r'aBPointBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBPointBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABPointB = Notifier<WayPoint?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
