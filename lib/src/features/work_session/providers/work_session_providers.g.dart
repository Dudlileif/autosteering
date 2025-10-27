// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for holding the active [WorkSession].

@ProviderFor(ActiveWorkSession)
const activeWorkSessionProvider = ActiveWorkSessionProvider._();

/// A provider for holding the active [WorkSession].
final class ActiveWorkSessionProvider
    extends $NotifierProvider<ActiveWorkSession, WorkSession?> {
  /// A provider for holding the active [WorkSession].
  const ActiveWorkSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeWorkSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeWorkSessionHash();

  @$internal
  @override
  ActiveWorkSession create() => ActiveWorkSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkSession?>(value),
    );
  }
}

String _$activeWorkSessionHash() => r'f43b32f1f70d118a9f596d7164262e51a52fa38a';

/// A provider for holding the active [WorkSession].

abstract class _$ActiveWorkSession extends $Notifier<WorkSession?> {
  WorkSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WorkSession?, WorkSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WorkSession?, WorkSession?>,
              WorkSession?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.

@ProviderFor(loadWorkSessionFromFile)
const loadWorkSessionFromFileProvider = LoadWorkSessionFromFileFamily._();

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.

final class LoadWorkSessionFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkSession?>,
          WorkSession?,
          FutureOr<WorkSession?>
        >
    with $FutureModifier<WorkSession?>, $FutureProvider<WorkSession?> {
  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.
  const LoadWorkSessionFromFileProvider._({
    required LoadWorkSessionFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadWorkSessionFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadWorkSessionFromFileHash();

  @override
  String toString() {
    return r'loadWorkSessionFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WorkSession?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WorkSession?> create(Ref ref) {
    final argument = this.argument as String;
    return loadWorkSessionFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadWorkSessionFromFileProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadWorkSessionFromFileHash() =>
    r'f2ed6f4ca655100cc14420f15649553c795e7356';

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.

final class LoadWorkSessionFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WorkSession?>, String> {
  const LoadWorkSessionFromFileFamily._()
    : super(
        retry: null,
        name: r'loadWorkSessionFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.

  LoadWorkSessionFromFileProvider call(String path) =>
      LoadWorkSessionFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadWorkSessionFromFileProvider';
}

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveWorkSession)
const saveWorkSessionProvider = SaveWorkSessionFamily._();

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  const SaveWorkSessionProvider._({
    required SaveWorkSessionFamily super.from,
    required (WorkSession, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveWorkSessionProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveWorkSessionHash();

  @override
  String toString() {
    return r'saveWorkSessionProvider'
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
            as (WorkSession, {String? overrideName, bool downloadIfWeb});
    return saveWorkSession(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveWorkSessionHash() => r'5b466db5026ecaee42032fba30dec6f3477aa65f';

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveWorkSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (WorkSession, {String? overrideName, bool downloadIfWeb})
        > {
  const SaveWorkSessionFamily._()
    : super(
        retry: null,
        name: r'saveWorkSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveWorkSessionProvider._(
    argument: (
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'saveWorkSessionProvider';
}

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.

@ProviderFor(saveWorkSessionEquipmentLogs)
const saveWorkSessionEquipmentLogsProvider =
    SaveWorkSessionEquipmentLogsFamily._();

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.

final class SaveWorkSessionEquipmentLogsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.
  const SaveWorkSessionEquipmentLogsProvider._({
    required SaveWorkSessionEquipmentLogsFamily super.from,
    required (WorkSession, {bool overwrite, String? singleUuid}) super.argument,
  }) : super(
         retry: null,
         name: r'saveWorkSessionEquipmentLogsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveWorkSessionEquipmentLogsHash();

  @override
  String toString() {
    return r'saveWorkSessionEquipmentLogsProvider'
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
        this.argument as (WorkSession, {bool overwrite, String? singleUuid});
    return saveWorkSessionEquipmentLogs(
      ref,
      argument.$1,
      overwrite: argument.overwrite,
      singleUuid: argument.singleUuid,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkSessionEquipmentLogsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveWorkSessionEquipmentLogsHash() =>
    r'79f0cc298fb6f43c3a3ded1d99639ee88fb78f6f';

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.

final class SaveWorkSessionEquipmentLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (WorkSession, {bool overwrite, String? singleUuid})
        > {
  const SaveWorkSessionEquipmentLogsFamily._()
    : super(
        retry: null,
        name: r'saveWorkSessionEquipmentLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.

  SaveWorkSessionEquipmentLogsProvider call(
    WorkSession workSession, {
    bool overwrite = true,
    String? singleUuid,
  }) => SaveWorkSessionEquipmentLogsProvider._(
    argument: (workSession, overwrite: overwrite, singleUuid: singleUuid),
    from: this,
  );

  @override
  String toString() => r'saveWorkSessionEquipmentLogsProvider';
}

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportWorkSession)
const exportWorkSessionProvider = ExportWorkSessionFamily._();

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

final class ExportWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  const ExportWorkSessionProvider._({
    required ExportWorkSessionFamily super.from,
    required (
      WorkSession, {
      String? overrideName,
      bool downloadIfWeb,
      bool withEquipmentLogs,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportWorkSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportWorkSessionHash();

  @override
  String toString() {
    return r'exportWorkSessionProvider'
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
              WorkSession, {
              String? overrideName,
              bool downloadIfWeb,
              bool withEquipmentLogs,
            });
    return exportWorkSession(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
      withEquipmentLogs: argument.withEquipmentLogs,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportWorkSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportWorkSessionHash() => r'53118d9022733abb20b4a3efaaaeae147232aed4';

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

final class ExportWorkSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (
            WorkSession, {
            String? overrideName,
            bool downloadIfWeb,
            bool withEquipmentLogs,
          })
        > {
  const ExportWorkSessionFamily._()
    : super(
        retry: null,
        name: r'exportWorkSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
    bool withEquipmentLogs = true,
  }) => ExportWorkSessionProvider._(
    argument: (
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      withEquipmentLogs: withEquipmentLogs,
    ),
    from: this,
  );

  @override
  String toString() => r'exportWorkSessionProvider';
}

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.

@ProviderFor(savedWorkSessions)
const savedWorkSessionsProvider = SavedWorkSessionsProvider._();

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.

final class SavedWorkSessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WorkSession>>,
          List<WorkSession>,
          FutureOr<List<WorkSession>>
        >
    with
        $FutureModifier<List<WorkSession>>,
        $FutureProvider<List<WorkSession>> {
  /// A provider for reading and holding all the saved [WorkSession]s in the
  /// user file directory.
  const SavedWorkSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedWorkSessionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedWorkSessionsHash();

  @$internal
  @override
  $FutureProviderElement<List<WorkSession>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WorkSession>> create(Ref ref) {
    return savedWorkSessions(ref);
  }
}

String _$savedWorkSessionsHash() => r'd7d697d33348282646e7be9a6fdc9a52079b4384';

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].

@ProviderFor(deleteWorkSession)
const deleteWorkSessionProvider = DeleteWorkSessionFamily._();

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].

final class DeleteWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
  const DeleteWorkSessionProvider._({
    required DeleteWorkSessionFamily super.from,
    required (WorkSession, {String? overrideName}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteWorkSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteWorkSessionHash();

  @override
  String toString() {
    return r'deleteWorkSessionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (WorkSession, {String? overrideName});
    return deleteWorkSession(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteWorkSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteWorkSessionHash() => r'0d994726090883228987d0bb6997d2ff376cc418';

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].

final class DeleteWorkSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (WorkSession, {String? overrideName})
        > {
  const DeleteWorkSessionFamily._()
    : super(
        retry: null,
        name: r'deleteWorkSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].

  DeleteWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
  }) => DeleteWorkSessionProvider._(
    argument: (workSession, overrideName: overrideName),
    from: this,
  );

  @override
  String toString() => r'deleteWorkSessionProvider';
}

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.

@ProviderFor(importWorkSession)
const importWorkSessionProvider = ImportWorkSessionProvider._();

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.

final class ImportWorkSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkSession?>,
          WorkSession?,
          FutureOr<WorkSession?>
        >
    with $FutureModifier<WorkSession?>, $FutureProvider<WorkSession?> {
  /// A provider for importing a work session from a file and applying it
  /// to the [ActiveWorkSession] provider.
  const ImportWorkSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importWorkSessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importWorkSessionHash();

  @$internal
  @override
  $FutureProviderElement<WorkSession?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WorkSession?> create(Ref ref) {
    return importWorkSession(ref);
  }
}

String _$importWorkSessionHash() => r'e5dbb7652642dd8cbcb98e6a03dae4bf1eefcee5';

/// A provider for exporting all work session files.

@ProviderFor(exportWorkSessions)
const exportWorkSessionsProvider = ExportWorkSessionsFamily._();

/// A provider for exporting all work session files.

final class ExportWorkSessionsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all work session files.
  const ExportWorkSessionsProvider._({
    required ExportWorkSessionsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'exportWorkSessionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportWorkSessionsHash();

  @override
  String toString() {
    return r'exportWorkSessionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as bool;
    return exportWorkSessions(ref, zip: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportWorkSessionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportWorkSessionsHash() =>
    r'3a8b1b5b889e9f9d2e502fdae910660eb67fe7f9';

/// A provider for exporting all work session files.

final class ExportWorkSessionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, bool> {
  const ExportWorkSessionsFamily._()
    : super(
        retry: null,
        name: r'exportWorkSessionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all work session files.

  ExportWorkSessionsProvider call({bool zip = true}) =>
      ExportWorkSessionsProvider._(argument: zip, from: this);

  @override
  String toString() => r'exportWorkSessionsProvider';
}
