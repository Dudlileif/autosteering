// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadWorkSessionFromFileHash() =>
    r'f2ed6f4ca655100cc14420f15649553c795e7356';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
///
/// Copied from [loadWorkSessionFromFile].
@ProviderFor(loadWorkSessionFromFile)
const loadWorkSessionFromFileProvider = LoadWorkSessionFromFileFamily();

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
///
/// Copied from [loadWorkSessionFromFile].
class LoadWorkSessionFromFileFamily extends Family<AsyncValue<WorkSession?>> {
  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.
  ///
  /// Copied from [loadWorkSessionFromFile].
  const LoadWorkSessionFromFileFamily();

  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.
  ///
  /// Copied from [loadWorkSessionFromFile].
  LoadWorkSessionFromFileProvider call(
    String path,
  ) {
    return LoadWorkSessionFromFileProvider(
      path,
    );
  }

  @override
  LoadWorkSessionFromFileProvider getProviderOverride(
    covariant LoadWorkSessionFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadWorkSessionFromFileProvider';
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
///
/// Copied from [loadWorkSessionFromFile].
class LoadWorkSessionFromFileProvider
    extends AutoDisposeFutureProvider<WorkSession?> {
  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.
  ///
  /// Copied from [loadWorkSessionFromFile].
  LoadWorkSessionFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadWorkSessionFromFile(
            ref as LoadWorkSessionFromFileRef,
            path,
          ),
          from: loadWorkSessionFromFileProvider,
          name: r'loadWorkSessionFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadWorkSessionFromFileHash,
          dependencies: LoadWorkSessionFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadWorkSessionFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadWorkSessionFromFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<WorkSession?> Function(LoadWorkSessionFromFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadWorkSessionFromFileProvider._internal(
        (ref) => create(ref as LoadWorkSessionFromFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WorkSession?> createElement() {
    return _LoadWorkSessionFromFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadWorkSessionFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadWorkSessionFromFileRef on AutoDisposeFutureProviderRef<WorkSession?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadWorkSessionFromFileProviderElement
    extends AutoDisposeFutureProviderElement<WorkSession?>
    with LoadWorkSessionFromFileRef {
  _LoadWorkSessionFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadWorkSessionFromFileProvider).path;
}

String _$saveWorkSessionHash() => r'6cdc8d5d6c13a9783b9c331b9972920f30c6a2e0';

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveWorkSession].
@ProviderFor(saveWorkSession)
const saveWorkSessionProvider = SaveWorkSessionFamily();

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveWorkSession].
class SaveWorkSessionFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveWorkSession].
  const SaveWorkSessionFamily();

  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveWorkSession].
  SaveWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveWorkSessionProvider(
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  SaveWorkSessionProvider getProviderOverride(
    covariant SaveWorkSessionProvider provider,
  ) {
    return call(
      provider.workSession,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveWorkSessionProvider';
}

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveWorkSession].
class SaveWorkSessionProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveWorkSession].
  SaveWorkSessionProvider(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveWorkSession(
            ref as SaveWorkSessionRef,
            workSession,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveWorkSessionProvider,
          name: r'saveWorkSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveWorkSessionHash,
          dependencies: SaveWorkSessionFamily._dependencies,
          allTransitiveDependencies:
              SaveWorkSessionFamily._allTransitiveDependencies,
          workSession: workSession,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveWorkSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workSession,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final WorkSession workSession;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveWorkSessionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveWorkSessionProvider._internal(
        (ref) => create(ref as SaveWorkSessionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workSession: workSession,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkSessionProvider &&
        other.workSession == workSession &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workSession.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveWorkSessionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveWorkSessionProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveWorkSessionRef {
  _SaveWorkSessionProviderElement(super.provider);

  @override
  WorkSession get workSession =>
      (origin as SaveWorkSessionProvider).workSession;
  @override
  String? get overrideName => (origin as SaveWorkSessionProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveWorkSessionProvider).downloadIfWeb;
}

String _$saveWorkSessionEquipmentLogsHash() =>
    r'31fc3f81175a127dc06927f536dffd2d7004baa4';

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.
///
/// Copied from [saveWorkSessionEquipmentLogs].
@ProviderFor(saveWorkSessionEquipmentLogs)
const saveWorkSessionEquipmentLogsProvider =
    SaveWorkSessionEquipmentLogsFamily();

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.
///
/// Copied from [saveWorkSessionEquipmentLogs].
class SaveWorkSessionEquipmentLogsFamily extends Family<AsyncValue<void>> {
  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.
  ///
  /// Copied from [saveWorkSessionEquipmentLogs].
  const SaveWorkSessionEquipmentLogsFamily();

  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.
  ///
  /// Copied from [saveWorkSessionEquipmentLogs].
  SaveWorkSessionEquipmentLogsProvider call(
    WorkSession workSession, {
    bool overwrite = true,
    String? singleUuid,
  }) {
    return SaveWorkSessionEquipmentLogsProvider(
      workSession,
      overwrite: overwrite,
      singleUuid: singleUuid,
    );
  }

  @override
  SaveWorkSessionEquipmentLogsProvider getProviderOverride(
    covariant SaveWorkSessionEquipmentLogsProvider provider,
  ) {
    return call(
      provider.workSession,
      overwrite: provider.overwrite,
      singleUuid: provider.singleUuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveWorkSessionEquipmentLogsProvider';
}

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.
///
/// Copied from [saveWorkSessionEquipmentLogs].
class SaveWorkSessionEquipmentLogsProvider
    extends AutoDisposeFutureProvider<void> {
  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.
  ///
  /// Copied from [saveWorkSessionEquipmentLogs].
  SaveWorkSessionEquipmentLogsProvider(
    WorkSession workSession, {
    bool overwrite = true,
    String? singleUuid,
  }) : this._internal(
          (ref) => saveWorkSessionEquipmentLogs(
            ref as SaveWorkSessionEquipmentLogsRef,
            workSession,
            overwrite: overwrite,
            singleUuid: singleUuid,
          ),
          from: saveWorkSessionEquipmentLogsProvider,
          name: r'saveWorkSessionEquipmentLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveWorkSessionEquipmentLogsHash,
          dependencies: SaveWorkSessionEquipmentLogsFamily._dependencies,
          allTransitiveDependencies:
              SaveWorkSessionEquipmentLogsFamily._allTransitiveDependencies,
          workSession: workSession,
          overwrite: overwrite,
          singleUuid: singleUuid,
        );

  SaveWorkSessionEquipmentLogsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workSession,
    required this.overwrite,
    required this.singleUuid,
  }) : super.internal();

  final WorkSession workSession;
  final bool overwrite;
  final String? singleUuid;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveWorkSessionEquipmentLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveWorkSessionEquipmentLogsProvider._internal(
        (ref) => create(ref as SaveWorkSessionEquipmentLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workSession: workSession,
        overwrite: overwrite,
        singleUuid: singleUuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkSessionEquipmentLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkSessionEquipmentLogsProvider &&
        other.workSession == workSession &&
        other.overwrite == overwrite &&
        other.singleUuid == singleUuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workSession.hashCode);
    hash = _SystemHash.combine(hash, overwrite.hashCode);
    hash = _SystemHash.combine(hash, singleUuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveWorkSessionEquipmentLogsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overwrite` of this provider.
  bool get overwrite;

  /// The parameter `singleUuid` of this provider.
  String? get singleUuid;
}

class _SaveWorkSessionEquipmentLogsProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SaveWorkSessionEquipmentLogsRef {
  _SaveWorkSessionEquipmentLogsProviderElement(super.provider);

  @override
  WorkSession get workSession =>
      (origin as SaveWorkSessionEquipmentLogsProvider).workSession;
  @override
  bool get overwrite =>
      (origin as SaveWorkSessionEquipmentLogsProvider).overwrite;
  @override
  String? get singleUuid =>
      (origin as SaveWorkSessionEquipmentLogsProvider).singleUuid;
}

String _$exportWorkSessionHash() => r'53118d9022733abb20b4a3efaaaeae147232aed4';

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportWorkSession].
@ProviderFor(exportWorkSession)
const exportWorkSessionProvider = ExportWorkSessionFamily();

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportWorkSession].
class ExportWorkSessionFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportWorkSession].
  const ExportWorkSessionFamily();

  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportWorkSession].
  ExportWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
    bool withEquipmentLogs = true,
  }) {
    return ExportWorkSessionProvider(
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      withEquipmentLogs: withEquipmentLogs,
    );
  }

  @override
  ExportWorkSessionProvider getProviderOverride(
    covariant ExportWorkSessionProvider provider,
  ) {
    return call(
      provider.workSession,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
      withEquipmentLogs: provider.withEquipmentLogs,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportWorkSessionProvider';
}

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportWorkSession].
class ExportWorkSessionProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportWorkSession].
  ExportWorkSessionProvider(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
    bool withEquipmentLogs = true,
  }) : this._internal(
          (ref) => exportWorkSession(
            ref as ExportWorkSessionRef,
            workSession,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
            withEquipmentLogs: withEquipmentLogs,
          ),
          from: exportWorkSessionProvider,
          name: r'exportWorkSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportWorkSessionHash,
          dependencies: ExportWorkSessionFamily._dependencies,
          allTransitiveDependencies:
              ExportWorkSessionFamily._allTransitiveDependencies,
          workSession: workSession,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
          withEquipmentLogs: withEquipmentLogs,
        );

  ExportWorkSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workSession,
    required this.overrideName,
    required this.downloadIfWeb,
    required this.withEquipmentLogs,
  }) : super.internal();

  final WorkSession workSession;
  final String? overrideName;
  final bool downloadIfWeb;
  final bool withEquipmentLogs;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportWorkSessionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportWorkSessionProvider._internal(
        (ref) => create(ref as ExportWorkSessionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workSession: workSession,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
        withEquipmentLogs: withEquipmentLogs,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportWorkSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportWorkSessionProvider &&
        other.workSession == workSession &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb &&
        other.withEquipmentLogs == withEquipmentLogs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workSession.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);
    hash = _SystemHash.combine(hash, withEquipmentLogs.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportWorkSessionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;

  /// The parameter `withEquipmentLogs` of this provider.
  bool get withEquipmentLogs;
}

class _ExportWorkSessionProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportWorkSessionRef {
  _ExportWorkSessionProviderElement(super.provider);

  @override
  WorkSession get workSession =>
      (origin as ExportWorkSessionProvider).workSession;
  @override
  String? get overrideName =>
      (origin as ExportWorkSessionProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportWorkSessionProvider).downloadIfWeb;
  @override
  bool get withEquipmentLogs =>
      (origin as ExportWorkSessionProvider).withEquipmentLogs;
}

String _$savedWorkSessionsHash() => r'd7d697d33348282646e7be9a6fdc9a52079b4384';

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.
///
/// Copied from [savedWorkSessions].
@ProviderFor(savedWorkSessions)
final savedWorkSessionsProvider = FutureProvider<List<WorkSession>>.internal(
  savedWorkSessions,
  name: r'savedWorkSessionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedWorkSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedWorkSessionsRef = FutureProviderRef<List<WorkSession>>;
String _$deleteWorkSessionHash() => r'0d994726090883228987d0bb6997d2ff376cc418';

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].
///
/// Copied from [deleteWorkSession].
@ProviderFor(deleteWorkSession)
const deleteWorkSessionProvider = DeleteWorkSessionFamily();

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].
///
/// Copied from [deleteWorkSession].
class DeleteWorkSessionFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
  ///
  /// Copied from [deleteWorkSession].
  const DeleteWorkSessionFamily();

  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
  ///
  /// Copied from [deleteWorkSession].
  DeleteWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
  }) {
    return DeleteWorkSessionProvider(
      workSession,
      overrideName: overrideName,
    );
  }

  @override
  DeleteWorkSessionProvider getProviderOverride(
    covariant DeleteWorkSessionProvider provider,
  ) {
    return call(
      provider.workSession,
      overrideName: provider.overrideName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteWorkSessionProvider';
}

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].
///
/// Copied from [deleteWorkSession].
class DeleteWorkSessionProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
  ///
  /// Copied from [deleteWorkSession].
  DeleteWorkSessionProvider(
    WorkSession workSession, {
    String? overrideName,
  }) : this._internal(
          (ref) => deleteWorkSession(
            ref as DeleteWorkSessionRef,
            workSession,
            overrideName: overrideName,
          ),
          from: deleteWorkSessionProvider,
          name: r'deleteWorkSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteWorkSessionHash,
          dependencies: DeleteWorkSessionFamily._dependencies,
          allTransitiveDependencies:
              DeleteWorkSessionFamily._allTransitiveDependencies,
          workSession: workSession,
          overrideName: overrideName,
        );

  DeleteWorkSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workSession,
    required this.overrideName,
  }) : super.internal();

  final WorkSession workSession;
  final String? overrideName;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteWorkSessionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteWorkSessionProvider._internal(
        (ref) => create(ref as DeleteWorkSessionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workSession: workSession,
        overrideName: overrideName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteWorkSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteWorkSessionProvider &&
        other.workSession == workSession &&
        other.overrideName == overrideName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workSession.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteWorkSessionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _DeleteWorkSessionProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteWorkSessionRef {
  _DeleteWorkSessionProviderElement(super.provider);

  @override
  WorkSession get workSession =>
      (origin as DeleteWorkSessionProvider).workSession;
  @override
  String? get overrideName =>
      (origin as DeleteWorkSessionProvider).overrideName;
}

String _$importWorkSessionHash() => r'e5dbb7652642dd8cbcb98e6a03dae4bf1eefcee5';

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.
///
/// Copied from [importWorkSession].
@ProviderFor(importWorkSession)
final importWorkSessionProvider =
    AutoDisposeFutureProvider<WorkSession?>.internal(
  importWorkSession,
  name: r'importWorkSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importWorkSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportWorkSessionRef = AutoDisposeFutureProviderRef<WorkSession?>;
String _$exportWorkSessionsHash() =>
    r'3a8b1b5b889e9f9d2e502fdae910660eb67fe7f9';

/// A provider for exporting all work session files.
///
/// Copied from [exportWorkSessions].
@ProviderFor(exportWorkSessions)
const exportWorkSessionsProvider = ExportWorkSessionsFamily();

/// A provider for exporting all work session files.
///
/// Copied from [exportWorkSessions].
class ExportWorkSessionsFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all work session files.
  ///
  /// Copied from [exportWorkSessions].
  const ExportWorkSessionsFamily();

  /// A provider for exporting all work session files.
  ///
  /// Copied from [exportWorkSessions].
  ExportWorkSessionsProvider call({
    bool zip = true,
  }) {
    return ExportWorkSessionsProvider(
      zip: zip,
    );
  }

  @override
  ExportWorkSessionsProvider getProviderOverride(
    covariant ExportWorkSessionsProvider provider,
  ) {
    return call(
      zip: provider.zip,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportWorkSessionsProvider';
}

/// A provider for exporting all work session files.
///
/// Copied from [exportWorkSessions].
class ExportWorkSessionsProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all work session files.
  ///
  /// Copied from [exportWorkSessions].
  ExportWorkSessionsProvider({
    bool zip = true,
  }) : this._internal(
          (ref) => exportWorkSessions(
            ref as ExportWorkSessionsRef,
            zip: zip,
          ),
          from: exportWorkSessionsProvider,
          name: r'exportWorkSessionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportWorkSessionsHash,
          dependencies: ExportWorkSessionsFamily._dependencies,
          allTransitiveDependencies:
              ExportWorkSessionsFamily._allTransitiveDependencies,
          zip: zip,
        );

  ExportWorkSessionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zip,
  }) : super.internal();

  final bool zip;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportWorkSessionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportWorkSessionsProvider._internal(
        (ref) => create(ref as ExportWorkSessionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zip: zip,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportWorkSessionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportWorkSessionsProvider && other.zip == zip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zip.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportWorkSessionsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportWorkSessionsProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportWorkSessionsRef {
  _ExportWorkSessionsProviderElement(super.provider);

  @override
  bool get zip => (origin as ExportWorkSessionsProvider).zip;
}

String _$activeWorkSessionHash() => r'a5e99f946bd356990b9246d165eb7604dccecf0d';

/// A provider for holding the active [WorkSession].
///
/// Copied from [ActiveWorkSession].
@ProviderFor(ActiveWorkSession)
final activeWorkSessionProvider =
    NotifierProvider<ActiveWorkSession, WorkSession?>.internal(
  ActiveWorkSession.new,
  name: r'activeWorkSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeWorkSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveWorkSession = Notifier<WorkSession?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
