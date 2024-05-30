// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadWorkSessionFromFileHash() =>
    r'661396b82d26e208b5a2c91f1d6bc9a89c4e34a0';

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
class LoadWorkSessionFromFileFamily extends Family {
  /// A provider for loading a [WorkSession] from a file at [path], if it's valid.
  ///
  /// Copied from [loadWorkSessionFromFile].
  const LoadWorkSessionFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadWorkSessionFromFileProvider';

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

  @visibleForOverriding
  @override
  LoadWorkSessionFromFileProvider getProviderOverride(
    covariant LoadWorkSessionFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<WorkSession?> Function(LoadWorkSessionFromFileRef ref) create) {
    return _$LoadWorkSessionFromFileFamilyOverride(this, create);
  }
}

class _$LoadWorkSessionFromFileFamilyOverride implements FamilyOverride {
  _$LoadWorkSessionFromFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<WorkSession?> Function(LoadWorkSessionFromFileRef ref) create;

  @override
  final LoadWorkSessionFromFileFamily overriddenFamily;

  @override
  LoadWorkSessionFromFileProvider getProviderOverride(
    covariant LoadWorkSessionFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<WorkSession?> Function(LoadWorkSessionFromFileRef ref) create,
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
  (String,) get argument {
    return (path,);
  }

  @override
  AutoDisposeFutureProviderElement<WorkSession?> createElement() {
    return _LoadWorkSessionFromFileProviderElement(this);
  }

  LoadWorkSessionFromFileProvider _copyWith(
    FutureOr<WorkSession?> Function(LoadWorkSessionFromFileRef ref) create,
  ) {
    return LoadWorkSessionFromFileProvider._internal(
      (ref) => create(ref as LoadWorkSessionFromFileRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      path: path,
    );
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

String _$saveWorkSessionHash() => r'82178e6440b264bc6fe4d110847a5ecef0baecf0';

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
class SaveWorkSessionFamily extends Family {
  /// A provider for saving [workSession] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveWorkSession].
  const SaveWorkSessionFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveWorkSessionProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(SaveWorkSessionRef ref) create) {
    return _$SaveWorkSessionFamilyOverride(this, create);
  }
}

class _$SaveWorkSessionFamilyOverride implements FamilyOverride {
  _$SaveWorkSessionFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveWorkSessionRef ref) create;

  @override
  final SaveWorkSessionFamily overriddenFamily;

  @override
  SaveWorkSessionProvider getProviderOverride(
    covariant SaveWorkSessionProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(SaveWorkSessionRef ref) create,
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
  (
    WorkSession, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkSessionProviderElement(this);
  }

  SaveWorkSessionProvider _copyWith(
    FutureOr<void> Function(SaveWorkSessionRef ref) create,
  ) {
    return SaveWorkSessionProvider._internal(
      (ref) => create(ref as SaveWorkSessionRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      workSession: workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
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

String _$exportWorkSessionHash() => r'0c2beb6a966f97b31c71a3d6acf411d084106e74';

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
class ExportWorkSessionFamily extends Family {
  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportWorkSession].
  const ExportWorkSessionFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportWorkSessionProvider';

  /// A provider for exporting [workSession] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportWorkSession].
  ExportWorkSessionProvider call(
    WorkSession workSession, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return ExportWorkSessionProvider(
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportWorkSessionProvider getProviderOverride(
    covariant ExportWorkSessionProvider provider,
  ) {
    return call(
      provider.workSession,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportWorkSessionRef ref) create) {
    return _$ExportWorkSessionFamilyOverride(this, create);
  }
}

class _$ExportWorkSessionFamilyOverride implements FamilyOverride {
  _$ExportWorkSessionFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportWorkSessionRef ref) create;

  @override
  final ExportWorkSessionFamily overriddenFamily;

  @override
  ExportWorkSessionProvider getProviderOverride(
    covariant ExportWorkSessionProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
  }) : this._internal(
          (ref) => exportWorkSession(
            ref as ExportWorkSessionRef,
            workSession,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
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
        );

  ExportWorkSessionProvider._internal(
    super.create, {
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
    FutureOr<void> Function(ExportWorkSessionRef ref) create,
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
      ),
    );
  }

  @override
  (
    WorkSession, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportWorkSessionProviderElement(this);
  }

  ExportWorkSessionProvider _copyWith(
    FutureOr<void> Function(ExportWorkSessionRef ref) create,
  ) {
    return ExportWorkSessionProvider._internal(
      (ref) => create(ref as ExportWorkSessionRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      workSession: workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportWorkSessionProvider &&
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

mixin ExportWorkSessionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
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
}

String _$savedWorkSessionsHash() => r'd2ab4bc851392f153d3a832b6c44059198f41e4e';

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

typedef SavedWorkSessionsRef = FutureProviderRef<List<WorkSession>>;
String _$deleteWorkSessionHash() => r'6a484bceb01997d0795100cf22353a6e11b657f2';

/// A provider for deleting [workSession] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteWorkSession].
@ProviderFor(deleteWorkSession)
const deleteWorkSessionProvider = DeleteWorkSessionFamily();

/// A provider for deleting [workSession] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteWorkSession].
class DeleteWorkSessionFamily extends Family {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteWorkSession].
  const DeleteWorkSessionFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteWorkSessionProvider';

  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the file name with [overrideName].
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

  @visibleForOverriding
  @override
  DeleteWorkSessionProvider getProviderOverride(
    covariant DeleteWorkSessionProvider provider,
  ) {
    return call(
      provider.workSession,
      overrideName: provider.overrideName,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteWorkSessionRef ref) create) {
    return _$DeleteWorkSessionFamilyOverride(this, create);
  }
}

class _$DeleteWorkSessionFamilyOverride implements FamilyOverride {
  _$DeleteWorkSessionFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteWorkSessionRef ref) create;

  @override
  final DeleteWorkSessionFamily overriddenFamily;

  @override
  DeleteWorkSessionProvider getProviderOverride(
    covariant DeleteWorkSessionProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [workSession] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteWorkSession].
class DeleteWorkSessionProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the file name with [overrideName].
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
    super.create, {
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
    FutureOr<void> Function(DeleteWorkSessionRef ref) create,
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
  (
    WorkSession, {
    String? overrideName,
  }) get argument {
    return (
      workSession,
      overrideName: overrideName,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteWorkSessionProviderElement(this);
  }

  DeleteWorkSessionProvider _copyWith(
    FutureOr<void> Function(DeleteWorkSessionRef ref) create,
  ) {
    return DeleteWorkSessionProvider._internal(
      (ref) => create(ref as DeleteWorkSessionRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      workSession: workSession,
      overrideName: overrideName,
    );
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

String _$importWorkSessionHash() => r'0ed6ba27fe2538180d74960e61d7b88d643a3b92';

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

typedef ImportWorkSessionRef = AutoDisposeFutureProviderRef<WorkSession?>;
String _$activeWorkSessionHash() => r'96a702a8b386aa5dd813e30959b6681373746630';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
