// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_line_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$abLinePerpendicularDistanceHash() =>
    r'9ef46fcde66597293521e4bafae8f416cdafcaff';

/// A provider for the perpendicular distance from the [ABLineDebug] line
/// to the [MainVehicle].
///
/// Copied from [abLinePerpendicularDistance].
@ProviderFor(abLinePerpendicularDistance)
final abLinePerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  abLinePerpendicularDistance,
  name: r'abLinePerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$abLinePerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbLinePerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$aBLineDebugEnabledHash() =>
    r'1a0f361292dfa40a2f6ab508e92edc8c150044fe';

/// A provider for whether the [aBLineDebugProvider]'s state should be
/// used for autosteering.
///
/// Copied from [ABLineDebugEnabled].
@ProviderFor(ABLineDebugEnabled)
final aBLineDebugEnabledProvider =
    NotifierProvider<ABLineDebugEnabled, bool>.internal(
  ABLineDebugEnabled.new,
  name: r'aBLineDebugEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineDebugEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebugEnabled = Notifier<bool>;
String _$aBLineDebugShowHash() => r'9783d67729b322fdb34993e776005b632875abf7';

/// A provider for whether the AB-line debugging features should be shown.
///
/// Copied from [ABLineDebugShow].
@ProviderFor(ABLineDebugShow)
final aBLineDebugShowProvider =
    NotifierProvider<ABLineDebugShow, bool>.internal(
  ABLineDebugShow.new,
  name: r'aBLineDebugShowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineDebugShowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebugShow = Notifier<bool>;
String _$aBLineDebugStepSizeHash() =>
    r'101e542ce12e7f6f64b8b3db637edea151337359';

/// A provider for the step size of an AB-line.
///
/// Copied from [ABLineDebugStepSize].
@ProviderFor(ABLineDebugStepSize)
final aBLineDebugStepSizeProvider =
    NotifierProvider<ABLineDebugStepSize, double>.internal(
  ABLineDebugStepSize.new,
  name: r'aBLineDebugStepSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineDebugStepSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebugStepSize = Notifier<double>;
String _$aBLineDebugNumPointsAheadHash() =>
    r'7d4e11ea8f9fa87cde418caca25d679fe9c47f3d';

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
///
/// Copied from [ABLineDebugNumPointsAhead].
@ProviderFor(ABLineDebugNumPointsAhead)
final aBLineDebugNumPointsAheadProvider =
    NotifierProvider<ABLineDebugNumPointsAhead, int>.internal(
  ABLineDebugNumPointsAhead.new,
  name: r'aBLineDebugNumPointsAheadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineDebugNumPointsAheadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebugNumPointsAhead = Notifier<int>;
String _$aBLineDebugNumPointsBehindHash() =>
    r'295f57f90f9517758832e39409900cfb92a9c107';

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
///
/// Copied from [ABLineDebugNumPointsBehind].
@ProviderFor(ABLineDebugNumPointsBehind)
final aBLineDebugNumPointsBehindProvider =
    NotifierProvider<ABLineDebugNumPointsBehind, int>.internal(
  ABLineDebugNumPointsBehind.new,
  name: r'aBLineDebugNumPointsBehindProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineDebugNumPointsBehindHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebugNumPointsBehind = Notifier<int>;
String _$aBLinePointAHash() => r'0834bf3f4b30eca21228d66cc4f243fe6e18e11f';

/// A provider for the starting point A of an AB-line.
///
/// Copied from [ABLinePointA].
@ProviderFor(ABLinePointA)
final aBLinePointAProvider =
    NotifierProvider<ABLinePointA, Geographic?>.internal(
  ABLinePointA.new,
  name: r'aBLinePointAProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLinePointAHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLinePointA = Notifier<Geographic?>;
String _$aBLinePointBHash() => r'df5f21b8c4350459ef0a9f0604ecacfeefa2f6c6';

/// A provider for the ending point B of an AB-line.
///
/// Copied from [ABLinePointB].
@ProviderFor(ABLinePointB)
final aBLinePointBProvider =
    NotifierProvider<ABLinePointB, Geographic?>.internal(
  ABLinePointB.new,
  name: r'aBLinePointBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLinePointBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLinePointB = Notifier<Geographic?>;
String _$aBLineWidthHash() => r'74aba65b5ee22cdf4b79affd4e582a2ce11368ff';

/// A provider for the width of an AB-line.
///
/// Copied from [ABLineWidth].
@ProviderFor(ABLineWidth)
final aBLineWidthProvider = NotifierProvider<ABLineWidth, double>.internal(
  ABLineWidth.new,
  name: r'aBLineWidthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLineWidthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineWidth = Notifier<double>;
String _$aBLineTurningRadiusHash() =>
    r'3e468042f514c5e18763e85418fc374f304f48ac';

/// A provider for the turning radius of an AB-line.
///
/// Copied from [ABLineTurningRadius].
@ProviderFor(ABLineTurningRadius)
final aBLineTurningRadiusProvider =
    NotifierProvider<ABLineTurningRadius, double>.internal(
  ABLineTurningRadius.new,
  name: r'aBLineTurningRadiusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineTurningRadiusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineTurningRadius = Notifier<double>;
String _$aBLineTurnOffsetIncreaseHash() =>
    r'd37b062f3b3666b843f77cc4314f7f51bb2df98f';

/// A provider for the width of an AB-line.
///
/// Copied from [ABLineTurnOffsetIncrease].
@ProviderFor(ABLineTurnOffsetIncrease)
final aBLineTurnOffsetIncreaseProvider =
    NotifierProvider<ABLineTurnOffsetIncrease, int>.internal(
  ABLineTurnOffsetIncrease.new,
  name: r'aBLineTurnOffsetIncreaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineTurnOffsetIncreaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineTurnOffsetIncrease = Notifier<int>;
String _$aBLineLimitModeHash() => r'a6a108849a81c9b37204079512516ff170c049e4';

/// A provider for the width of an AB-line.
///
/// Copied from [ABLineLimitMode].
@ProviderFor(ABLineLimitMode)
final aBLineLimitModeProvider =
    NotifierProvider<ABLineLimitMode, ABLimitMode>.internal(
  ABLineLimitMode.new,
  name: r'aBLineLimitModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBLineLimitModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineLimitMode = Notifier<ABLimitMode>;
String _$aBLineDebugHash() => r'40051f22be154963bb8ce82e72a80390660ee91c';

/// A provider for the AB-line object to debug.
///
/// Copied from [ABLineDebug].
@ProviderFor(ABLineDebug)
final aBLineDebugProvider = NotifierProvider<ABLineDebug, ABLine?>.internal(
  ABLineDebug.new,
  name: r'aBLineDebugProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLineDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLineDebug = Notifier<ABLine?>;
String _$displayABLineHash() => r'a08c7aa1d2e3c7db37907cbe51b8de3e151c4758';

/// A provider for the activated [ABLineDebug] model, typically updated and
/// recieved from the simulator.
///
/// Copied from [DisplayABLine].
@ProviderFor(DisplayABLine)
final displayABLineProvider =
    AutoDisposeNotifierProvider<DisplayABLine, ABLine?>.internal(
  DisplayABLine.new,
  name: r'displayABLineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayABLineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayABLine = AutoDisposeNotifier<ABLine?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
