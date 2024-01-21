// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadWorkSessionFromFileHash() =>
    r'4ca9e5c31cb9721efaef0bc1439b38bdeb7ca7aa';

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

String _$saveWorkSessionHash() => r'e6470ceec5e11dd136ef4eebff08ffe89bd2e785';

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
      AsyncValue<void> Function(SaveWorkSessionRef ref) create) {
    return _$SaveWorkSessionFamilyOverride(this, create);
  }
}

class _$SaveWorkSessionFamilyOverride implements FamilyOverride {
  _$SaveWorkSessionFamilyOverride(this.overriddenFamily, this.create);

  final AsyncValue<void> Function(SaveWorkSessionRef ref) create;

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
class SaveWorkSessionProvider extends AutoDisposeProvider<AsyncValue<void>> {
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
    AsyncValue<void> Function(SaveWorkSessionRef ref) create,
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
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveWorkSessionProviderElement(this);
  }

  SaveWorkSessionProvider _copyWith(
    AsyncValue<void> Function(SaveWorkSessionRef ref) create,
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

mixin SaveWorkSessionRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `workSession` of this provider.
  WorkSession get workSession;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveWorkSessionProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>>
    with SaveWorkSessionRef {
  _SaveWorkSessionProviderElement(super.provider);

  @override
  WorkSession get workSession =>
      (origin as SaveWorkSessionProvider).workSession;
  @override
  String? get overrideName => (origin as SaveWorkSessionProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveWorkSessionProvider).downloadIfWeb;
}

String _$savedWorkSessionsHash() => r'a9e5618f15053022734353dc757a685ccf718c82';

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.
///
/// Copied from [savedWorkSessions].
@ProviderFor(savedWorkSessions)
final savedWorkSessionsProvider =
    Provider<AsyncValue<List<WorkSession>>>.internal(
  savedWorkSessions,
  name: r'savedWorkSessionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedWorkSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedWorkSessionsRef = ProviderRef<AsyncValue<List<WorkSession>>>;
String _$activeWorkSessionHash() => r'86029e0a8803b9456114e7a8c66c1c5b9fbfce98';

/// A provider for holding the active [WorkSession].
///
/// Copied from [ActiveWorkSession].
@ProviderFor(ActiveWorkSession)
final activeWorkSessionProvider =
    AutoDisposeNotifierProvider<ActiveWorkSession, WorkSession?>.internal(
  ActiveWorkSession.new,
  name: r'activeWorkSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeWorkSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveWorkSession = AutoDisposeNotifier<WorkSession?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
