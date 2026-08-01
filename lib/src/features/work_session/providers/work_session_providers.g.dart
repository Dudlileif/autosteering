// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for holding the active [WorkSession].

@ProviderFor(ActiveWorkSession)
final activeWorkSessionProvider = ActiveWorkSessionProvider._();

/// A provider for holding the active [WorkSession].
final class ActiveWorkSessionProvider
    extends $NotifierProvider<ActiveWorkSession, WorkSession?> {
  /// A provider for holding the active [WorkSession].
  ActiveWorkSessionProvider._()
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

String _$activeWorkSessionHash() => r'4d8129747227aeef33376dd0e1fa70d85a91ec99';

/// A provider for holding the active [WorkSession].

abstract class _$ActiveWorkSession extends $Notifier<WorkSession?> {
  WorkSession? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<WorkSession?, WorkSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WorkSession?, WorkSession?>,
              WorkSession?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.

@ProviderFor(loadWorkSessionFromFile)
final loadWorkSessionFromFileProvider = LoadWorkSessionFromFileFamily._();

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
  LoadWorkSessionFromFileProvider._({
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
  LoadWorkSessionFromFileFamily._()
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
final saveWorkSessionProvider = SaveWorkSessionFamily._();

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveWorkSessionProvider._({
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

String _$saveWorkSessionHash() => r'0dfbd1126b05379fe274748d558c8d2ae4ac26bc';

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveWorkSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (WorkSession, {String? overrideName, bool downloadIfWeb})
        > {
  SaveWorkSessionFamily._()
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
/// [singleId] can be used to specify a single equipment's logs that should
/// be saved.

@ProviderFor(saveWorkSessionEquipmentLogs)
final saveWorkSessionEquipmentLogsProvider =
    SaveWorkSessionEquipmentLogsFamily._();

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleId] can be used to specify a single equipment's logs that should
/// be saved.

final class SaveWorkSessionEquipmentLogsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleId] can be used to specify a single equipment's logs that should
  /// be saved.
  SaveWorkSessionEquipmentLogsProvider._({
    required SaveWorkSessionEquipmentLogsFamily super.from,
    required (WorkSession, {bool overwrite, int? singleId}) super.argument,
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
        this.argument as (WorkSession, {bool overwrite, int? singleId});
    return saveWorkSessionEquipmentLogs(
      ref,
      argument.$1,
      overwrite: argument.overwrite,
      singleId: argument.singleId,
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
    r'9f271c88537c182e3e35edd34c16589cbf8f56b1';

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleId] can be used to specify a single equipment's logs that should
/// be saved.

final class SaveWorkSessionEquipmentLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (WorkSession, {bool overwrite, int? singleId})
        > {
  SaveWorkSessionEquipmentLogsFamily._()
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
  /// [singleId] can be used to specify a single equipment's logs that should
  /// be saved.

  SaveWorkSessionEquipmentLogsProvider call(
    WorkSession workSession, {
    bool overwrite = true,
    int? singleId,
  }) => SaveWorkSessionEquipmentLogsProvider._(
    argument: (workSession, overwrite: overwrite, singleId: singleId),
    from: this,
  );

  @override
  String toString() => r'saveWorkSessionEquipmentLogsProvider';
}

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportWorkSession)
final exportWorkSessionProvider = ExportWorkSessionFamily._();

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

final class ExportWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportWorkSessionProvider._({
    required ExportWorkSessionFamily super.from,
    required (
      WorkSession, {
      String dialogTitle,
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
              String dialogTitle,
              String? overrideName,
              bool downloadIfWeb,
              bool withEquipmentLogs,
            });
    return exportWorkSession(
      ref,
      argument.$1,
      dialogTitle: argument.dialogTitle,
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

String _$exportWorkSessionHash() => r'9a27e105a7bd6638286e2964ffcaa32f23659c76';

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].

final class ExportWorkSessionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (
            WorkSession, {
            String dialogTitle,
            String? overrideName,
            bool downloadIfWeb,
            bool withEquipmentLogs,
          })
        > {
  ExportWorkSessionFamily._()
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
    required String dialogTitle,
    String? overrideName,
    bool downloadIfWeb = false,
    bool withEquipmentLogs = true,
  }) => ExportWorkSessionProvider._(
    argument: (
      workSession,
      dialogTitle: dialogTitle,
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
final savedWorkSessionsProvider = SavedWorkSessionsProvider._();

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
  SavedWorkSessionsProvider._()
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

String _$savedWorkSessionsHash() => r'3a8cfafbe6ba1725f6c84fe9f46b8492c0839134';

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].

@ProviderFor(deleteWorkSession)
final deleteWorkSessionProvider = DeleteWorkSessionFamily._();

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].

final class DeleteWorkSessionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
  DeleteWorkSessionProvider._({
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
  DeleteWorkSessionFamily._()
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
final importWorkSessionProvider = ImportWorkSessionFamily._();

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
  ImportWorkSessionProvider._({
    required ImportWorkSessionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importWorkSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importWorkSessionHash();

  @override
  String toString() {
    return r'importWorkSessionProvider'
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
    return importWorkSession(ref, dialogTitle: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportWorkSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importWorkSessionHash() => r'8b8b97fe627889e7925c241fcab09b0d7886ebe5';

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.

final class ImportWorkSessionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WorkSession?>, String> {
  ImportWorkSessionFamily._()
    : super(
        retry: null,
        name: r'importWorkSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for importing a work session from a file and applying it
  /// to the [ActiveWorkSession] provider.

  ImportWorkSessionProvider call({required String dialogTitle}) =>
      ImportWorkSessionProvider._(argument: dialogTitle, from: this);

  @override
  String toString() => r'importWorkSessionProvider';
}

/// A provider for exporting all work session files.

@ProviderFor(exportWorkSessions)
final exportWorkSessionsProvider = ExportWorkSessionsFamily._();

/// A provider for exporting all work session files.

final class ExportWorkSessionsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all work session files.
  ExportWorkSessionsProvider._({
    required ExportWorkSessionsFamily super.from,
    required ({String dialogTitle, bool zip}) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String dialogTitle, bool zip});
    return exportWorkSessions(
      ref,
      dialogTitle: argument.dialogTitle,
      zip: argument.zip,
    );
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
    r'dd2147204f622808bab0568d1768e964c3bc9c20';

/// A provider for exporting all work session files.

final class ExportWorkSessionsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String dialogTitle, bool zip})
        > {
  ExportWorkSessionsFamily._()
    : super(
        retry: null,
        name: r'exportWorkSessionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all work session files.

  ExportWorkSessionsProvider call({
    required String dialogTitle,
    bool zip = true,
  }) => ExportWorkSessionsProvider._(
    argument: (dialogTitle: dialogTitle, zip: zip),
    from: this,
  );

  @override
  String toString() => r'exportWorkSessionsProvider';
}
