// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debugEquipmentTurningHash() =>
    r'505d86aca95ee1ecf4d7722b1b8ec4732cafc2de';

/// Whether to show equipment turning debug features.
///
/// Copied from [DebugEquipmentTurning].
@ProviderFor(DebugEquipmentTurning)
final debugEquipmentTurningProvider =
    AutoDisposeNotifierProvider<DebugEquipmentTurning, bool>.internal(
  DebugEquipmentTurning.new,
  name: r'debugEquipmentTurningProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTurningHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTurning = AutoDisposeNotifier<bool>;
String _$debugEquipmentTrajectoryHash() =>
    r'e8913cdf95316803986dc56586b6c051229b1645';

/// Whether to show equipment trajectory debug features.
///
/// Copied from [DebugEquipmentTrajectory].
@ProviderFor(DebugEquipmentTrajectory)
final debugEquipmentTrajectoryProvider =
    AutoDisposeNotifierProvider<DebugEquipmentTrajectory, bool>.internal(
  DebugEquipmentTrajectory.new,
  name: r'debugEquipmentTrajectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTrajectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTrajectory = AutoDisposeNotifier<bool>;
String _$debugEquipmentTravelledPathHash() =>
    r'd00ac2fee4f69e5e50b2aee0f051801ef1446459';

/// Whether to show equipment travelled path debug.
///
/// Copied from [DebugEquipmentTravelledPath].
@ProviderFor(DebugEquipmentTravelledPath)
final debugEquipmentTravelledPathProvider =
    AutoDisposeNotifierProvider<DebugEquipmentTravelledPath, bool>.internal(
  DebugEquipmentTravelledPath.new,
  name: r'debugEquipmentTravelledPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTravelledPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTravelledPath = AutoDisposeNotifier<bool>;
String _$debugEquipmentTravelledPathSizeHash() =>
    r'd835c19880e4ca9e3fcde0bea5887c8ca233abfc';

/// The amount of points [DebugEquipmentTravelledPathList] should hold.
///
/// Copied from [DebugEquipmentTravelledPathSize].
@ProviderFor(DebugEquipmentTravelledPathSize)
final debugEquipmentTravelledPathSizeProvider =
    NotifierProvider<DebugEquipmentTravelledPathSize, int>.internal(
  DebugEquipmentTravelledPathSize.new,
  name: r'debugEquipmentTravelledPathSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTravelledPathSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTravelledPathSize = Notifier<int>;
String _$debugEquipmentTravelledPathListHash() =>
    r'd0f6d8966fcfd69b2de45bf32a3c4a03518e47de';

/// A list of the last [DebugEquipmentTravelledPathSize] position points for the
/// equipments.
///
/// Copied from [DebugEquipmentTravelledPathList].
@ProviderFor(DebugEquipmentTravelledPathList)
final debugEquipmentTravelledPathListProvider = AutoDisposeNotifierProvider<
    DebugEquipmentTravelledPathList, Map<String, List<LatLng>>>.internal(
  DebugEquipmentTravelledPathList.new,
  name: r'debugEquipmentTravelledPathListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTravelledPathListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTravelledPathList
    = AutoDisposeNotifier<Map<String, List<LatLng>>>;
String _$debugEquipmentHitchesHash() =>
    r'c5cd8ff4bacc9eaae3279a59e8aabdc0788a0900';

/// Whether to show equipment hitches debug.
///
/// Copied from [DebugEquipmentHitches].
@ProviderFor(DebugEquipmentHitches)
final debugEquipmentHitchesProvider =
    AutoDisposeNotifierProvider<DebugEquipmentHitches, bool>.internal(
  DebugEquipmentHitches.new,
  name: r'debugEquipmentHitchesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentHitchesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentHitches = AutoDisposeNotifier<bool>;
String _$debugEquipmentSectionsHash() =>
    r'9aaece3c4a3bc86a84fa4f2c9ccca871209fc4b7';

/// Whether to show equipment section debug features.
///
/// Copied from [DebugEquipmentSections].
@ProviderFor(DebugEquipmentSections)
final debugEquipmentSectionsProvider =
    AutoDisposeNotifierProvider<DebugEquipmentSections, bool>.internal(
  DebugEquipmentSections.new,
  name: r'debugEquipmentSectionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentSectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentSections = AutoDisposeNotifier<bool>;
String _$debugEquipmentTrajectorySecondsHash() =>
    r'0672ab28735f211fb81549a366345a7a95ec204f';

/// The amount of seconds equipment trajectories should predict.
///
/// Copied from [DebugEquipmentTrajectorySeconds].
@ProviderFor(DebugEquipmentTrajectorySeconds)
final debugEquipmentTrajectorySecondsProvider =
    NotifierProvider<DebugEquipmentTrajectorySeconds, double>.internal(
  DebugEquipmentTrajectorySeconds.new,
  name: r'debugEquipmentTrajectorySecondsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTrajectorySecondsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTrajectorySeconds = Notifier<double>;
String _$debugEquipmentTrajectoryMinLengthHash() =>
    r'c76331b37ae0a325b201b8b8bc0408a28be66f06';

/// The minimum length equipment trajectories should predict.
///
/// Copied from [DebugEquipmentTrajectoryMinLength].
@ProviderFor(DebugEquipmentTrajectoryMinLength)
final debugEquipmentTrajectoryMinLengthProvider =
    NotifierProvider<DebugEquipmentTrajectoryMinLength, double>.internal(
  DebugEquipmentTrajectoryMinLength.new,
  name: r'debugEquipmentTrajectoryMinLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugEquipmentTrajectoryMinLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugEquipmentTrajectoryMinLength = Notifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
