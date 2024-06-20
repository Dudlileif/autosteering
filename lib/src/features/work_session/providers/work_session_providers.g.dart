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

String _$saveWorkSessionHash() => r'947bad0366aa976655c9794c66c35133d03d35a8';

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

String _$saveWorkSessionEquipmentLogsHash() =>
    r'caf29764addc500b0719b8bd9a600aea09165b93';

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
class SaveWorkSessionEquipmentLogsFamily extends Family {
  /// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
  /// their respective files.
  ///
  /// Set the [overwrite] parameter to false to preserve already existing files.
  /// [singleUuid] can be used to specify a single equipment's logs that should
  /// be saved.
  ///
  /// Copied from [saveWorkSessionEquipmentLogs].
  const SaveWorkSessionEquipmentLogsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveWorkSessionEquipmentLogsProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(SaveWorkSessionEquipmentLogsRef ref) create) {
    return _$SaveWorkSessionEquipmentLogsFamilyOverride(this, create);
  }
}

class _$SaveWorkSessionEquipmentLogsFamilyOverride implements FamilyOverride {
  _$SaveWorkSessionEquipmentLogsFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveWorkSessionEquipmentLogsRef ref) create;

  @override
  final SaveWorkSessionEquipmentLogsFamily overriddenFamily;

  @override
  SaveWorkSessionEquipmentLogsProvider getProviderOverride(
    covariant SaveWorkSessionEquipmentLogsProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(SaveWorkSessionEquipmentLogsRef ref) create,
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
  (
    WorkSession, {
    bool overwrite,
    String? singleUuid,
  }) get argument {
    return (
      workSession,
      overwrite: overwrite,
      singleUuid: singleUuid,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkSessionEquipmentLogsProviderElement(this);
  }

  SaveWorkSessionEquipmentLogsProvider _copyWith(
    FutureOr<void> Function(SaveWorkSessionEquipmentLogsRef ref) create,
  ) {
    return SaveWorkSessionEquipmentLogsProvider._internal(
      (ref) => create(ref as SaveWorkSessionEquipmentLogsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      workSession: workSession,
      overwrite: overwrite,
      singleUuid: singleUuid,
    );
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

String _$exportWorkSessionHash() => r'fb3ff5314e651b2cc9a65a6c6ec3c4dcb55e246d';

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
    bool withEquipmentLogs = true,
  }) {
    return ExportWorkSessionProvider(
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      withEquipmentLogs: withEquipmentLogs,
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
      withEquipmentLogs: provider.withEquipmentLogs,
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
    super.create, {
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
        withEquipmentLogs: withEquipmentLogs,
      ),
    );
  }

  @override
  (
    WorkSession, {
    String? overrideName,
    bool downloadIfWeb,
    bool withEquipmentLogs,
  }) get argument {
    return (
      workSession,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      withEquipmentLogs: withEquipmentLogs,
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
      withEquipmentLogs: withEquipmentLogs,
    );
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

String _$savedWorkSessionsHash() => r'0a7005b98eef7ecfe11a8031ce10833223609459';

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
String _$deleteWorkSessionHash() => r'65cc4a7123ad600558056f806c8731a44240f0fb';

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
class DeleteWorkSessionFamily extends Family {
  /// A provider for deleting [workSession] from the user file system.
  ///
  /// Override the directory name with [overrideName].
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

String _$importWorkSessionHash() => r'ba6c4595c03b7f18e63873270b7487012bc1469c';

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
String _$exportWorkSessionsHash() =>
    r'53dd47af789709d9c9a52160b8cabb04cbabe472';

/// A provider for exporting all work session files.
///
/// Copied from [exportWorkSessions].
@ProviderFor(exportWorkSessions)
const exportWorkSessionsProvider = ExportWorkSessionsFamily();

/// A provider for exporting all work session files.
///
/// Copied from [exportWorkSessions].
class ExportWorkSessionsFamily extends Family {
  /// A provider for exporting all work session files.
  ///
  /// Copied from [exportWorkSessions].
  const ExportWorkSessionsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportWorkSessionsProvider';

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

  @visibleForOverriding
  @override
  ExportWorkSessionsProvider getProviderOverride(
    covariant ExportWorkSessionsProvider provider,
  ) {
    return call(
      zip: provider.zip,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportWorkSessionsRef ref) create) {
    return _$ExportWorkSessionsFamilyOverride(this, create);
  }
}

class _$ExportWorkSessionsFamilyOverride implements FamilyOverride {
  _$ExportWorkSessionsFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportWorkSessionsRef ref) create;

  @override
  final ExportWorkSessionsFamily overriddenFamily;

  @override
  ExportWorkSessionsProvider getProviderOverride(
    covariant ExportWorkSessionsProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(ExportWorkSessionsRef ref) create,
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
  ({
    bool zip,
  }) get argument {
    return (zip: zip,);
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportWorkSessionsProviderElement(this);
  }

  ExportWorkSessionsProvider _copyWith(
    FutureOr<void> Function(ExportWorkSessionsRef ref) create,
  ) {
    return ExportWorkSessionsProvider._internal(
      (ref) => create(ref as ExportWorkSessionsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      zip: zip,
    );
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

String _$activeWorkSessionHash() => r'f16bb30c8990506861463f165a8b09cad4a8899f';

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
