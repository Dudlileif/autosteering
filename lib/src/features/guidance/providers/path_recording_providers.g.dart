// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_recording_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$automaticPathRecordingHash() =>
    r'3ef9ec5da00b86b8695da396650741aa19994cc7';

/// A provider for watching to keep the automatic path recording going.
///
/// Copied from [automaticPathRecording].
@ProviderFor(automaticPathRecording)
final automaticPathRecordingProvider = AutoDisposeFutureProvider<void>.internal(
  automaticPathRecording,
  name: r'automaticPathRecordingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$automaticPathRecordingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AutomaticPathRecordingRef = AutoDisposeFutureProviderRef<void>;
String _$showPathRecordingMenuHash() =>
    r'8945b9d595d1413c9decaa11e548adcc0d2acf9f';

/// Whether the path recording menu should be shown.
///
/// Copied from [ShowPathRecordingMenu].
@ProviderFor(ShowPathRecordingMenu)
final showPathRecordingMenuProvider =
    AutoDisposeNotifierProvider<ShowPathRecordingMenu, bool>.internal(
  ShowPathRecordingMenu.new,
  name: r'showPathRecordingMenuProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showPathRecordingMenuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowPathRecordingMenu = AutoDisposeNotifier<bool>;
String _$enablePathRecorderHash() =>
    r'10810689b6ebb98e9a000c21e244d67ed9bbd079';

/// Whether the path recorder is enabled.
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
String _$enableAutomaticPathRecorderHash() =>
    r'33d164d9ff8c908f6884498ecd7200c800e686c8';

/// Whether the automatic path recorder is enabled.
///
/// Copied from [EnableAutomaticPathRecorder].
@ProviderFor(EnableAutomaticPathRecorder)
final enableAutomaticPathRecorderProvider =
    NotifierProvider<EnableAutomaticPathRecorder, bool>.internal(
  EnableAutomaticPathRecorder.new,
  name: r'enableAutomaticPathRecorderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enableAutomaticPathRecorderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnableAutomaticPathRecorder = Notifier<bool>;
String _$activePathRecordingSettingsHash() =>
    r'2695f3505634ee6c903cf851aadd35e978841e2c';

/// A provider for the [PathRecordingSettings] which configures how paths
/// should be recorded.
///
/// Copied from [ActivePathRecordingSettings].
@ProviderFor(ActivePathRecordingSettings)
final activePathRecordingSettingsProvider = NotifierProvider<
    ActivePathRecordingSettings, PathRecordingSettings>.internal(
  ActivePathRecordingSettings.new,
  name: r'activePathRecordingSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePathRecordingSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivePathRecordingSettings = Notifier<PathRecordingSettings>;
String _$activePathRecordingTargetHash() =>
    r'fe77111b8f0263c125936437870e8c0b88266f0e';

/// Whether the path recording menu should be shown.
///
/// Copied from [ActivePathRecordingTarget].
@ProviderFor(ActivePathRecordingTarget)
final activePathRecordingTargetProvider =
    NotifierProvider<ActivePathRecordingTarget, PathRecordingTarget>.internal(
  ActivePathRecordingTarget.new,
  name: r'activePathRecordingTargetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePathRecordingTargetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivePathRecordingTarget = Notifier<PathRecordingTarget>;
String _$pathRecordingListHash() => r'df9f9af6fa8e3a554a985bb5c6eada577019814e';

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
    r'fe9c4252f89dad4acdc8445b9fa58217b43dde89';

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
String _$editFinishedPathHash() => r'3689d55169c82198e9bd0b1768dbb7046e357f3f';

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
String _$pathRecordingMenuUiOffsetHash() =>
    r'1b09707f740e7c957697ffea0bdaf37a129fd9a1';

/// A provider for the UI [Offset] for the path recording configurator.
///
/// Copied from [PathRecordingMenuUiOffset].
@ProviderFor(PathRecordingMenuUiOffset)
final pathRecordingMenuUiOffsetProvider =
    AutoDisposeNotifierProvider<PathRecordingMenuUiOffset, Offset>.internal(
  PathRecordingMenuUiOffset.new,
  name: r'pathRecordingMenuUiOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathRecordingMenuUiOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathRecordingMenuUiOffset = AutoDisposeNotifier<Offset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
