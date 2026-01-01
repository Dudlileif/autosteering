// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_recording_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the path recording menu should be shown.

@ProviderFor(ShowPathRecordingMenu)
final showPathRecordingMenuProvider = ShowPathRecordingMenuProvider._();

/// Whether the path recording menu should be shown.
final class ShowPathRecordingMenuProvider
    extends $NotifierProvider<ShowPathRecordingMenu, bool> {
  /// Whether the path recording menu should be shown.
  ShowPathRecordingMenuProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showPathRecordingMenuProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showPathRecordingMenuHash();

  @$internal
  @override
  ShowPathRecordingMenu create() => ShowPathRecordingMenu();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showPathRecordingMenuHash() =>
    r'8945b9d595d1413c9decaa11e548adcc0d2acf9f';

/// Whether the path recording menu should be shown.

abstract class _$ShowPathRecordingMenu extends $Notifier<bool> {
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

/// Whether the path recorder is enabled.

@ProviderFor(EnablePathRecorder)
final enablePathRecorderProvider = EnablePathRecorderProvider._();

/// Whether the path recorder is enabled.
final class EnablePathRecorderProvider
    extends $NotifierProvider<EnablePathRecorder, bool> {
  /// Whether the path recorder is enabled.
  EnablePathRecorderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enablePathRecorderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enablePathRecorderHash();

  @$internal
  @override
  EnablePathRecorder create() => EnablePathRecorder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enablePathRecorderHash() =>
    r'10810689b6ebb98e9a000c21e244d67ed9bbd079';

/// Whether the path recorder is enabled.

abstract class _$EnablePathRecorder extends $Notifier<bool> {
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

/// Whether the automatic path recorder is enabled.

@ProviderFor(EnableAutomaticPathRecorder)
final enableAutomaticPathRecorderProvider =
    EnableAutomaticPathRecorderProvider._();

/// Whether the automatic path recorder is enabled.
final class EnableAutomaticPathRecorderProvider
    extends $NotifierProvider<EnableAutomaticPathRecorder, bool> {
  /// Whether the automatic path recorder is enabled.
  EnableAutomaticPathRecorderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableAutomaticPathRecorderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableAutomaticPathRecorderHash();

  @$internal
  @override
  EnableAutomaticPathRecorder create() => EnableAutomaticPathRecorder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enableAutomaticPathRecorderHash() =>
    r'32c914ddd6268e9dd88e8d0ed13b5c71cff1ff22';

/// Whether the automatic path recorder is enabled.

abstract class _$EnableAutomaticPathRecorder extends $Notifier<bool> {
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

/// A provider for the [PathRecordingSettings] which configures how paths
/// should be recorded.

@ProviderFor(ActivePathRecordingSettings)
final activePathRecordingSettingsProvider =
    ActivePathRecordingSettingsProvider._();

/// A provider for the [PathRecordingSettings] which configures how paths
/// should be recorded.
final class ActivePathRecordingSettingsProvider
    extends
        $NotifierProvider<ActivePathRecordingSettings, PathRecordingSettings> {
  /// A provider for the [PathRecordingSettings] which configures how paths
  /// should be recorded.
  ActivePathRecordingSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePathRecordingSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePathRecordingSettingsHash();

  @$internal
  @override
  ActivePathRecordingSettings create() => ActivePathRecordingSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PathRecordingSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PathRecordingSettings>(value),
    );
  }
}

String _$activePathRecordingSettingsHash() =>
    r'2695f3505634ee6c903cf851aadd35e978841e2c';

/// A provider for the [PathRecordingSettings] which configures how paths
/// should be recorded.

abstract class _$ActivePathRecordingSettings
    extends $Notifier<PathRecordingSettings> {
  PathRecordingSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PathRecordingSettings, PathRecordingSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PathRecordingSettings, PathRecordingSettings>,
              PathRecordingSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether the path recording menu should be shown.

@ProviderFor(ActivePathRecordingTarget)
final activePathRecordingTargetProvider = ActivePathRecordingTargetProvider._();

/// Whether the path recording menu should be shown.
final class ActivePathRecordingTargetProvider
    extends $NotifierProvider<ActivePathRecordingTarget, PathRecordingTarget> {
  /// Whether the path recording menu should be shown.
  ActivePathRecordingTargetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePathRecordingTargetProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePathRecordingTargetHash();

  @$internal
  @override
  ActivePathRecordingTarget create() => ActivePathRecordingTarget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PathRecordingTarget value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PathRecordingTarget>(value),
    );
  }
}

String _$activePathRecordingTargetHash() =>
    r'fe77111b8f0263c125936437870e8c0b88266f0e';

/// Whether the path recording menu should be shown.

abstract class _$ActivePathRecordingTarget
    extends $Notifier<PathRecordingTarget> {
  PathRecordingTarget build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PathRecordingTarget, PathRecordingTarget>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PathRecordingTarget, PathRecordingTarget>,
              PathRecordingTarget,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for watching to keep the automatic path recording going.

@ProviderFor(automaticPathRecording)
final automaticPathRecordingProvider = AutomaticPathRecordingProvider._();

/// A provider for watching to keep the automatic path recording going.

final class AutomaticPathRecordingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for watching to keep the automatic path recording going.
  AutomaticPathRecordingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'automaticPathRecordingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$automaticPathRecordingHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return automaticPathRecording(ref);
  }
}

String _$automaticPathRecordingHash() =>
    r'3ef9ec5da00b86b8695da396650741aa19994cc7';

/// A list of the currently recording points.

@ProviderFor(PathRecordingList)
final pathRecordingListProvider = PathRecordingListProvider._();

/// A list of the currently recording points.
final class PathRecordingListProvider
    extends $NotifierProvider<PathRecordingList, List<WayPoint>> {
  /// A list of the currently recording points.
  PathRecordingListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathRecordingListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pathRecordingListHash();

  @$internal
  @override
  PathRecordingList create() => PathRecordingList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WayPoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WayPoint>>(value),
    );
  }
}

String _$pathRecordingListHash() => r'df9f9af6fa8e3a554a985bb5c6eada577019814e';

/// A list of the currently recording points.

abstract class _$PathRecordingList extends $Notifier<List<WayPoint>> {
  List<WayPoint> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<WayPoint>, List<WayPoint>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<WayPoint>, List<WayPoint>>,
              List<WayPoint>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A list of path points for the last finished recording.

@ProviderFor(FinishedPathRecordingList)
final finishedPathRecordingListProvider = FinishedPathRecordingListProvider._();

/// A list of path points for the last finished recording.
final class FinishedPathRecordingListProvider
    extends $NotifierProvider<FinishedPathRecordingList, List<WayPoint>?> {
  /// A list of path points for the last finished recording.
  FinishedPathRecordingListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'finishedPathRecordingListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$finishedPathRecordingListHash();

  @$internal
  @override
  FinishedPathRecordingList create() => FinishedPathRecordingList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WayPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WayPoint>?>(value),
    );
  }
}

String _$finishedPathRecordingListHash() =>
    r'fe9c4252f89dad4acdc8445b9fa58217b43dde89';

/// A list of path points for the last finished recording.

abstract class _$FinishedPathRecordingList extends $Notifier<List<WayPoint>?> {
  List<WayPoint>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<WayPoint>?, List<WayPoint>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<WayPoint>?, List<WayPoint>?>,
              List<WayPoint>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether to show the last fininshed path recording.

@ProviderFor(ShowFinishedPath)
final showFinishedPathProvider = ShowFinishedPathProvider._();

/// Whether to show the last fininshed path recording.
final class ShowFinishedPathProvider
    extends $NotifierProvider<ShowFinishedPath, bool> {
  /// Whether to show the last fininshed path recording.
  ShowFinishedPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFinishedPathProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFinishedPathHash();

  @$internal
  @override
  ShowFinishedPath create() => ShowFinishedPath();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFinishedPathHash() => r'7053947b87b868ba73bc65e72d1e9d50f768d58a';

/// Whether to show the last fininshed path recording.

abstract class _$ShowFinishedPath extends $Notifier<bool> {
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

/// Whether to activate editing of the last finished path recording.

@ProviderFor(EditFinishedPath)
final editFinishedPathProvider = EditFinishedPathProvider._();

/// Whether to activate editing of the last finished path recording.
final class EditFinishedPathProvider
    extends $NotifierProvider<EditFinishedPath, bool> {
  /// Whether to activate editing of the last finished path recording.
  EditFinishedPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editFinishedPathProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editFinishedPathHash();

  @$internal
  @override
  EditFinishedPath create() => EditFinishedPath();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$editFinishedPathHash() => r'3689d55169c82198e9bd0b1768dbb7046e357f3f';

/// Whether to activate editing of the last finished path recording.

abstract class _$EditFinishedPath extends $Notifier<bool> {
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

/// A provider for the UI [Offset] for the path recording configurator.

@ProviderFor(PathRecordingMenuUiOffset)
final pathRecordingMenuUiOffsetProvider = PathRecordingMenuUiOffsetProvider._();

/// A provider for the UI [Offset] for the path recording configurator.
final class PathRecordingMenuUiOffsetProvider
    extends $NotifierProvider<PathRecordingMenuUiOffset, Offset> {
  /// A provider for the UI [Offset] for the path recording configurator.
  PathRecordingMenuUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathRecordingMenuUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pathRecordingMenuUiOffsetHash();

  @$internal
  @override
  PathRecordingMenuUiOffset create() => PathRecordingMenuUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$pathRecordingMenuUiOffsetHash() =>
    r'1b09707f740e7c957697ffea0bdaf37a129fd9a1';

/// A provider for the UI [Offset] for the path recording configurator.

abstract class _$PathRecordingMenuUiOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
