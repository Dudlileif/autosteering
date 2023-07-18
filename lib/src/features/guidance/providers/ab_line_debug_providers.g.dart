// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_line_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBLineDebugEnabledHash() =>
    r'f6d0e62489f1a026440b33b3c03472e63ab65917';

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
String _$aBLinePointAHash() => r'1fe9fc8a963e254cd6b31c309c498616746b655f';

/// A provider for the starting point A of an AB-line.
///
/// Copied from [ABLinePointA].
@ProviderFor(ABLinePointA)
final aBLinePointAProvider = NotifierProvider<ABLinePointA, LatLng?>.internal(
  ABLinePointA.new,
  name: r'aBLinePointAProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLinePointAHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLinePointA = Notifier<LatLng?>;
String _$aBLinePointBHash() => r'2a79112cc9dcb21b980a73d7974f6feab13387d6';

/// A provider for the ending point B of an AB-line.
///
/// Copied from [ABLinePointB].
@ProviderFor(ABLinePointB)
final aBLinePointBProvider = NotifierProvider<ABLinePointB, LatLng?>.internal(
  ABLinePointB.new,
  name: r'aBLinePointBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLinePointBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABLinePointB = Notifier<LatLng?>;
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
String _$aBLineDebugHash() => r'70958303f7ce97e4f51456ed6d385ab02369f634';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
