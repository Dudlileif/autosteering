// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dubins_path_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debugDubinsPathHash() => r'9f1b306f563439ac3b9c4e393cd529f5b6edc6ee';

/// The current [DubinsPath] object that we can debug.
///
/// Copied from [debugDubinsPath].
@ProviderFor(debugDubinsPath)
final debugDubinsPathProvider = AutoDisposeProvider<DubinsPath?>.internal(
  debugDubinsPath,
  name: r'debugDubinsPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugDubinsPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DebugDubinsPathRef = AutoDisposeProviderRef<DubinsPath?>;
String _$enableDubinsPathDebugHash() =>
    r'5bc798c25e032544f6aba25dc9bc2da90f22ec44';

/// Whether the Dubins path feature should be debugged.
///
/// Copied from [EnableDubinsPathDebug].
@ProviderFor(EnableDubinsPathDebug)
final enableDubinsPathDebugProvider =
    NotifierProvider<EnableDubinsPathDebug, bool>.internal(
  EnableDubinsPathDebug.new,
  name: r'enableDubinsPathDebugProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enableDubinsPathDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnableDubinsPathDebug = Notifier<bool>;
String _$showDubinsPathDebugCirclesHash() =>
    r'5891960f3c944dd42c4a29e4db13361c8c6ff8eb';

/// Whether to show the turning circles for the Dubins path.
///
/// Copied from [ShowDubinsPathDebugCircles].
@ProviderFor(ShowDubinsPathDebugCircles)
final showDubinsPathDebugCirclesProvider =
    NotifierProvider<ShowDubinsPathDebugCircles, bool>.internal(
  ShowDubinsPathDebugCircles.new,
  name: r'showDubinsPathDebugCirclesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showDubinsPathDebugCirclesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowDubinsPathDebugCircles = Notifier<bool>;
String _$dubinsPathDebugStartPointHash() =>
    r'34396034575b2993bec1dee396873357438c20e4';

/// The starting point for the Dubins path.
///
/// Copied from [DubinsPathDebugStartPoint].
@ProviderFor(DubinsPathDebugStartPoint)
final dubinsPathDebugStartPointProvider =
    NotifierProvider<DubinsPathDebugStartPoint, WayPoint?>.internal(
  DubinsPathDebugStartPoint.new,
  name: r'dubinsPathDebugStartPointProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dubinsPathDebugStartPointHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DubinsPathDebugStartPoint = Notifier<WayPoint?>;
String _$dubinsPathDebugEndPointHash() =>
    r'5bec54f99573dc734b5b531dde2edeb623f9a2b8';

/// The ending point for the Dubins path.
///
/// Copied from [DubinsPathDebugEndPoint].
@ProviderFor(DubinsPathDebugEndPoint)
final dubinsPathDebugEndPointProvider =
    NotifierProvider<DubinsPathDebugEndPoint, WayPoint?>.internal(
  DubinsPathDebugEndPoint.new,
  name: r'dubinsPathDebugEndPointProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dubinsPathDebugEndPointHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DubinsPathDebugEndPoint = Notifier<WayPoint?>;
String _$dubinsPathDebugPathTypeHash() =>
    r'db8f582506c21d252bfd7b448432d055327147f8';

/// Which type of Dubins path to debug/draw.
///
/// Copied from [DubinsPathDebugPathType].
@ProviderFor(DubinsPathDebugPathType)
final dubinsPathDebugPathTypeProvider = AutoDisposeNotifierProvider<
    DubinsPathDebugPathType, DubinsPathType?>.internal(
  DubinsPathDebugPathType.new,
  name: r'dubinsPathDebugPathTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dubinsPathDebugPathTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DubinsPathDebugPathType = AutoDisposeNotifier<DubinsPathType?>;
String _$dubinsPathDebugStepSizeHash() =>
    r'9452d5770fd368ba784818c8866414e8e8dd3155';

/// Which type of Dubins path to debug/draw.
///
/// Copied from [DubinsPathDebugStepSize].
@ProviderFor(DubinsPathDebugStepSize)
final dubinsPathDebugStepSizeProvider =
    NotifierProvider<DubinsPathDebugStepSize, double>.internal(
  DubinsPathDebugStepSize.new,
  name: r'dubinsPathDebugStepSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dubinsPathDebugStepSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DubinsPathDebugStepSize = Notifier<double>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
