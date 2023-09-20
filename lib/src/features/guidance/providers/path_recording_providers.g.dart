// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_recording_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$enablePathRecorderHash() =>
    r'46976f30ef4bb77980c70721adb3f8e56a0bfa8d';

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
String _$pathRecordingListHash() => r'8070e77f69e1450825c97eb05ed7aef49318ccec';

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
    r'a9eb350deb822e89a3b6ce05ab7f1eec9c5105b6';

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
String _$editFinishedPathHash() => r'9343300ae45482c100ab819f01af800f3baae4a3';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
