// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_recording_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$enablePathRecorderHash() =>
    r'6fedacb5e80d10808ae682a6f69169af3e3e1323';

/// Whether the recorder is enabled.
///
/// Copied from [EnablePathRecorder].
@ProviderFor(EnablePathRecorder)
final enablePathRecorderProvider =
    NotifierProvider<EnablePathRecorder, bool>.internal(
  EnablePathRecorder.new,
  name: r'enablePathRecorderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enablePathRecorderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnablePathRecorder = Notifier<bool>;
String _$pathRecordingTurnMinDistanceHash() =>
    r'2fc96e554d84755bb3ae7b330d45071ed07f132f';

/// A provider for the minimum distance between recorded points, i.e. when
/// to add new points when going turning.
///
/// Copied from [PathRecordingTurnMinDistance].
@ProviderFor(PathRecordingTurnMinDistance)
final pathRecordingTurnMinDistanceProvider =
    NotifierProvider<PathRecordingTurnMinDistance, double>.internal(
  PathRecordingTurnMinDistance.new,
  name: r'pathRecordingTurnMinDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathRecordingTurnMinDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathRecordingTurnMinDistance = Notifier<double>;
String _$pathRecordingMaxDistanceHash() =>
    r'dc29fe85645b38941363eb0a6043fd2d36975194';

/// A provider for the maximum distance between recorded points, i.e. when
/// to add new points when going straight.
///
/// Copied from [PathRecordingMaxDistance].
@ProviderFor(PathRecordingMaxDistance)
final pathRecordingMaxDistanceProvider =
    NotifierProvider<PathRecordingMaxDistance, double>.internal(
  PathRecordingMaxDistance.new,
  name: r'pathRecordingMaxDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathRecordingMaxDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathRecordingMaxDistance = Notifier<double>;
String _$pathRecordingTriggerAngleHash() =>
    r'563ff93aaf6a3bf722e59f59611e0951d2ff3970';

/// A provider for the maximum angle between recorded points, i.e. when to
/// add new points in turns if after [PathRecordingTurnMinDistance] has been
/// passed.
///
/// Copied from [PathRecordingTriggerAngle].
@ProviderFor(PathRecordingTriggerAngle)
final pathRecordingTriggerAngleProvider =
    NotifierProvider<PathRecordingTriggerAngle, double>.internal(
  PathRecordingTriggerAngle.new,
  name: r'pathRecordingTriggerAngleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathRecordingTriggerAngleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathRecordingTriggerAngle = Notifier<double>;
String _$pathRecordingListHash() => r'8b963ec8e144ec262bc9ff7484714a3126db1657';

/// A list of the currently recording points.
///
/// Copied from [PathRecordingList].
@ProviderFor(PathRecordingList)
final pathRecordingListProvider =
    NotifierProvider<PathRecordingList, List<WayPoint>>.internal(
  PathRecordingList.new,
  name: r'pathRecordingListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathRecordingListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathRecordingList = Notifier<List<WayPoint>>;
String _$finishedPathRecordingListHash() =>
    r'84206f6ede8bfa70999c723360dc764a1a30a26f';

/// A list of path points for the last finished recording.
///
/// Copied from [FinishedPathRecordingList].
@ProviderFor(FinishedPathRecordingList)
final finishedPathRecordingListProvider =
    NotifierProvider<FinishedPathRecordingList, List<WayPoint>?>.internal(
  FinishedPathRecordingList.new,
  name: r'finishedPathRecordingListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$finishedPathRecordingListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FinishedPathRecordingList = Notifier<List<WayPoint>?>;
String _$showFinishedPathHash() => r'7053947b87b868ba73bc65e72d1e9d50f768d58a';

/// Whether to show the last fininshed path recording.
///
/// Copied from [ShowFinishedPath].
@ProviderFor(ShowFinishedPath)
final showFinishedPathProvider =
    NotifierProvider<ShowFinishedPath, bool>.internal(
  ShowFinishedPath.new,
  name: r'showFinishedPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showFinishedPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowFinishedPath = Notifier<bool>;
String _$editFinishedPathHash() => r'0ab5beaa8cb235809637c1249ae5ae99ff37832f';

/// Whether to activate editing of the last finished path recording.
///
/// Copied from [EditFinishedPath].
@ProviderFor(EditFinishedPath)
final editFinishedPathProvider =
    NotifierProvider<EditFinishedPath, bool>.internal(
  EditFinishedPath.new,
  name: r'editFinishedPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editFinishedPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditFinishedPath = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
