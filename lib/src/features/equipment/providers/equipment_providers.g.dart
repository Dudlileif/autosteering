// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadEquipmentFromFileHash() =>
    r'0eca5f4345ab15c23df56b50539c226711f5fab2';

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

/// A provider for loading an [Equipment] from a file at [path], if it's valid.
///
/// Copied from [loadEquipmentFromFile].
@ProviderFor(loadEquipmentFromFile)
const loadEquipmentFromFileProvider = LoadEquipmentFromFileFamily();

/// A provider for loading an [Equipment] from a file at [path], if it's valid.
///
/// Copied from [loadEquipmentFromFile].
class LoadEquipmentFromFileFamily extends Family {
  /// A provider for loading an [Equipment] from a file at [path], if it's valid.
  ///
  /// Copied from [loadEquipmentFromFile].
  const LoadEquipmentFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadEquipmentFromFileProvider';

  /// A provider for loading an [Equipment] from a file at [path], if it's valid.
  ///
  /// Copied from [loadEquipmentFromFile].
  LoadEquipmentFromFileProvider call(
    String path,
  ) {
    return LoadEquipmentFromFileProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  LoadEquipmentFromFileProvider getProviderOverride(
    covariant LoadEquipmentFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Equipment?> Function(LoadEquipmentFromFileRef ref) create) {
    return _$LoadEquipmentFromFileFamilyOverride(this, create);
  }
}

class _$LoadEquipmentFromFileFamilyOverride implements FamilyOverride {
  _$LoadEquipmentFromFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Equipment?> Function(LoadEquipmentFromFileRef ref) create;

  @override
  final LoadEquipmentFromFileFamily overriddenFamily;

  @override
  LoadEquipmentFromFileProvider getProviderOverride(
    covariant LoadEquipmentFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for loading an [Equipment] from a file at [path], if it's valid.
///
/// Copied from [loadEquipmentFromFile].
class LoadEquipmentFromFileProvider
    extends AutoDisposeFutureProvider<Equipment?> {
  /// A provider for loading an [Equipment] from a file at [path], if it's valid.
  ///
  /// Copied from [loadEquipmentFromFile].
  LoadEquipmentFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadEquipmentFromFile(
            ref as LoadEquipmentFromFileRef,
            path,
          ),
          from: loadEquipmentFromFileProvider,
          name: r'loadEquipmentFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadEquipmentFromFileHash,
          dependencies: LoadEquipmentFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadEquipmentFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadEquipmentFromFileProvider._internal(
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
    FutureOr<Equipment?> Function(LoadEquipmentFromFileRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadEquipmentFromFileProvider._internal(
        (ref) => create(ref as LoadEquipmentFromFileRef),
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
  AutoDisposeFutureProviderElement<Equipment?> createElement() {
    return _LoadEquipmentFromFileProviderElement(this);
  }

  LoadEquipmentFromFileProvider _copyWith(
    FutureOr<Equipment?> Function(LoadEquipmentFromFileRef ref) create,
  ) {
    return LoadEquipmentFromFileProvider._internal(
      (ref) => create(ref as LoadEquipmentFromFileRef),
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
    return other is LoadEquipmentFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadEquipmentFromFileRef on AutoDisposeFutureProviderRef<Equipment?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadEquipmentFromFileProviderElement
    extends AutoDisposeFutureProviderElement<Equipment?>
    with LoadEquipmentFromFileRef {
  _LoadEquipmentFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadEquipmentFromFileProvider).path;
}

String _$saveEquipmentHash() => r'40bec08cc39b6d284c749f8de135dbdb159f291c';

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipment].
@ProviderFor(saveEquipment)
const saveEquipmentProvider = SaveEquipmentFamily();

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipment].
class SaveEquipmentFamily extends Family {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipment].
  const SaveEquipmentFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveEquipmentProvider';

  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipment].
  SaveEquipmentProvider call(
    Equipment equipment, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveEquipmentProvider(
      equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveEquipmentProvider getProviderOverride(
    covariant SaveEquipmentProvider provider,
  ) {
    return call(
      provider.equipment,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(SaveEquipmentRef ref) create) {
    return _$SaveEquipmentFamilyOverride(this, create);
  }
}

class _$SaveEquipmentFamilyOverride implements FamilyOverride {
  _$SaveEquipmentFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveEquipmentRef ref) create;

  @override
  final SaveEquipmentFamily overriddenFamily;

  @override
  SaveEquipmentProvider getProviderOverride(
    covariant SaveEquipmentProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipment].
class SaveEquipmentProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipment].
  SaveEquipmentProvider(
    Equipment equipment, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveEquipment(
            ref as SaveEquipmentRef,
            equipment,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveEquipmentProvider,
          name: r'saveEquipmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveEquipmentHash,
          dependencies: SaveEquipmentFamily._dependencies,
          allTransitiveDependencies:
              SaveEquipmentFamily._allTransitiveDependencies,
          equipment: equipment,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveEquipmentProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.equipment,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Equipment equipment;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveEquipmentRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveEquipmentProvider._internal(
        (ref) => create(ref as SaveEquipmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        equipment: equipment,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    Equipment, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveEquipmentProviderElement(this);
  }

  SaveEquipmentProvider _copyWith(
    FutureOr<void> Function(SaveEquipmentRef ref) create,
  ) {
    return SaveEquipmentProvider._internal(
      (ref) => create(ref as SaveEquipmentRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      equipment: equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentProvider &&
        other.equipment == equipment &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, equipment.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveEquipmentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveEquipmentProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveEquipmentRef {
  _SaveEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as SaveEquipmentProvider).equipment;
  @override
  String? get overrideName => (origin as SaveEquipmentProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveEquipmentProvider).downloadIfWeb;
}

String _$exportEquipmentHash() => r'f91267effec957ccf5eeeba9d8a55ccca4a7f4a9';

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipment].
@ProviderFor(exportEquipment)
const exportEquipmentProvider = ExportEquipmentFamily();

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipment].
class ExportEquipmentFamily extends Family {
  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipment].
  const ExportEquipmentFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportEquipmentProvider';

  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipment].
  ExportEquipmentProvider call(
    Equipment equipment, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return ExportEquipmentProvider(
      equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportEquipmentProvider getProviderOverride(
    covariant ExportEquipmentProvider provider,
  ) {
    return call(
      provider.equipment,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportEquipmentRef ref) create) {
    return _$ExportEquipmentFamilyOverride(this, create);
  }
}

class _$ExportEquipmentFamilyOverride implements FamilyOverride {
  _$ExportEquipmentFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportEquipmentRef ref) create;

  @override
  final ExportEquipmentFamily overriddenFamily;

  @override
  ExportEquipmentProvider getProviderOverride(
    covariant ExportEquipmentProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipment].
class ExportEquipmentProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipment].
  ExportEquipmentProvider(
    Equipment equipment, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => exportEquipment(
            ref as ExportEquipmentRef,
            equipment,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportEquipmentProvider,
          name: r'exportEquipmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportEquipmentHash,
          dependencies: ExportEquipmentFamily._dependencies,
          allTransitiveDependencies:
              ExportEquipmentFamily._allTransitiveDependencies,
          equipment: equipment,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportEquipmentProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.equipment,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Equipment equipment;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportEquipmentRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportEquipmentProvider._internal(
        (ref) => create(ref as ExportEquipmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        equipment: equipment,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    Equipment, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportEquipmentProviderElement(this);
  }

  ExportEquipmentProvider _copyWith(
    FutureOr<void> Function(ExportEquipmentRef ref) create,
  ) {
    return ExportEquipmentProvider._internal(
      (ref) => create(ref as ExportEquipmentRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      equipment: equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentProvider &&
        other.equipment == equipment &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, equipment.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportEquipmentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportEquipmentProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportEquipmentRef {
  _ExportEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as ExportEquipmentProvider).equipment;
  @override
  String? get overrideName => (origin as ExportEquipmentProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportEquipmentProvider).downloadIfWeb;
}

String _$savedEquipmentsHash() => r'dede76af366e21da6460816b23f88b3b8c6d31f9';

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.
///
/// Copied from [savedEquipments].
@ProviderFor(savedEquipments)
final savedEquipmentsProvider = FutureProvider<List<Equipment>>.internal(
  savedEquipments,
  name: r'savedEquipmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedEquipmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedEquipmentsRef = FutureProviderRef<List<Equipment>>;
String _$deleteEquipmentHash() => r'340f650d0a0e5f680a1cb62eb3ff94faadd5e20a';

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipment].
@ProviderFor(deleteEquipment)
const deleteEquipmentProvider = DeleteEquipmentFamily();

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipment].
class DeleteEquipmentFamily extends Family {
  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipment].
  const DeleteEquipmentFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteEquipmentProvider';

  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipment].
  DeleteEquipmentProvider call(
    Equipment equipment, {
    String? overrideName,
  }) {
    return DeleteEquipmentProvider(
      equipment,
      overrideName: overrideName,
    );
  }

  @visibleForOverriding
  @override
  DeleteEquipmentProvider getProviderOverride(
    covariant DeleteEquipmentProvider provider,
  ) {
    return call(
      provider.equipment,
      overrideName: provider.overrideName,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteEquipmentRef ref) create) {
    return _$DeleteEquipmentFamilyOverride(this, create);
  }
}

class _$DeleteEquipmentFamilyOverride implements FamilyOverride {
  _$DeleteEquipmentFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteEquipmentRef ref) create;

  @override
  final DeleteEquipmentFamily overriddenFamily;

  @override
  DeleteEquipmentProvider getProviderOverride(
    covariant DeleteEquipmentProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipment].
class DeleteEquipmentProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipment].
  DeleteEquipmentProvider(
    Equipment equipment, {
    String? overrideName,
  }) : this._internal(
          (ref) => deleteEquipment(
            ref as DeleteEquipmentRef,
            equipment,
            overrideName: overrideName,
          ),
          from: deleteEquipmentProvider,
          name: r'deleteEquipmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteEquipmentHash,
          dependencies: DeleteEquipmentFamily._dependencies,
          allTransitiveDependencies:
              DeleteEquipmentFamily._allTransitiveDependencies,
          equipment: equipment,
          overrideName: overrideName,
        );

  DeleteEquipmentProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.equipment,
    required this.overrideName,
  }) : super.internal();

  final Equipment equipment;
  final String? overrideName;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteEquipmentRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteEquipmentProvider._internal(
        (ref) => create(ref as DeleteEquipmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        equipment: equipment,
        overrideName: overrideName,
      ),
    );
  }

  @override
  (
    Equipment, {
    String? overrideName,
  }) get argument {
    return (
      equipment,
      overrideName: overrideName,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteEquipmentProviderElement(this);
  }

  DeleteEquipmentProvider _copyWith(
    FutureOr<void> Function(DeleteEquipmentRef ref) create,
  ) {
    return DeleteEquipmentProvider._internal(
      (ref) => create(ref as DeleteEquipmentRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      equipment: equipment,
      overrideName: overrideName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteEquipmentProvider &&
        other.equipment == equipment &&
        other.overrideName == overrideName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, equipment.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteEquipmentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _DeleteEquipmentProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteEquipmentRef {
  _DeleteEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as DeleteEquipmentProvider).equipment;
  @override
  String? get overrideName => (origin as DeleteEquipmentProvider).overrideName;
}

String _$importEquipmentHash() => r'deae076514248068df58501f42845166ca44f089';

/// A provider for importing a equipment configuration from a file and applying
/// it to the [ConfiguredEquipment] provider.
///
/// Copied from [importEquipment].
@ProviderFor(importEquipment)
final importEquipmentProvider = AutoDisposeFutureProvider<Equipment?>.internal(
  importEquipment,
  name: r'importEquipmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importEquipmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportEquipmentRef = AutoDisposeFutureProviderRef<Equipment?>;
String _$showEquipmentDebugHash() =>
    r'1e3a6744e92da54c0a72fd64c65b5a2e0644052b';

/// Whether or not to show the equipment debugging features.
///
/// Copied from [ShowEquipmentDebug].
@ProviderFor(ShowEquipmentDebug)
final showEquipmentDebugProvider =
    AutoDisposeNotifierProvider<ShowEquipmentDebug, bool>.internal(
  ShowEquipmentDebug.new,
  name: r'showEquipmentDebugProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showEquipmentDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowEquipmentDebug = AutoDisposeNotifier<bool>;
String _$equipmentRecordPositionFractionHash() =>
    r'bb8fda078784d4229bde314e792ba25c0a50d1ed';

/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].
///
/// Copied from [EquipmentRecordPositionFraction].
@ProviderFor(EquipmentRecordPositionFraction)
final equipmentRecordPositionFractionProvider =
    NotifierProvider<EquipmentRecordPositionFraction, double>.internal(
  EquipmentRecordPositionFraction.new,
  name: r'equipmentRecordPositionFractionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentRecordPositionFractionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentRecordPositionFraction = Notifier<double>;
String _$allEquipmentsHash() => r'65b3d956c66655df7ef07a853d60a09c4ab4b6c2';

/// A provider that holds all of the equipments.
///
/// Copied from [AllEquipments].
@ProviderFor(AllEquipments)
final allEquipmentsProvider =
    NotifierProvider<AllEquipments, Map<String, Equipment>>.internal(
  AllEquipments.new,
  name: r'allEquipmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allEquipmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllEquipments = Notifier<Map<String, Equipment>>;
String _$equipmentWorkedAreaHash() =>
    r'6d49c8af50551325dcb921727a00a8d114a1a90e';

/// A provider for keeping the worked area for each equipment.
///
/// Copied from [EquipmentWorkedArea].
@ProviderFor(EquipmentWorkedArea)
final equipmentWorkedAreaProvider =
    NotifierProvider<EquipmentWorkedArea, Map<String, double>>.internal(
  EquipmentWorkedArea.new,
  name: r'equipmentWorkedAreaProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentWorkedAreaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentWorkedArea = Notifier<Map<String, double>>;
String _$equipmentPathsHash() => r'5f24c4f4ff586c00dd721985589fe75d129c91ec';

abstract class _$EquipmentPaths
    extends BuildlessNotifier<List<Map<int, List<SectionEdgePositions>?>>> {
  late final String uuid;

  List<Map<int, List<SectionEdgePositions>?>> build(
    String uuid,
  );
}

/// A provider for tracking the worked paths for the given equipment [uuid].
///
/// Copied from [EquipmentPaths].
@ProviderFor(EquipmentPaths)
const equipmentPathsProvider = EquipmentPathsFamily();

/// A provider for tracking the worked paths for the given equipment [uuid].
///
/// Copied from [EquipmentPaths].
class EquipmentPathsFamily extends Family {
  /// A provider for tracking the worked paths for the given equipment [uuid].
  ///
  /// Copied from [EquipmentPaths].
  const EquipmentPathsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'equipmentPathsProvider';

  /// A provider for tracking the worked paths for the given equipment [uuid].
  ///
  /// Copied from [EquipmentPaths].
  EquipmentPathsProvider call(
    String uuid,
  ) {
    return EquipmentPathsProvider(
      uuid,
    );
  }

  @visibleForOverriding
  @override
  EquipmentPathsProvider getProviderOverride(
    covariant EquipmentPathsProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(EquipmentPaths Function() create) {
    return _$EquipmentPathsFamilyOverride(this, create);
  }
}

class _$EquipmentPathsFamilyOverride implements FamilyOverride {
  _$EquipmentPathsFamilyOverride(this.overriddenFamily, this.create);

  final EquipmentPaths Function() create;

  @override
  final EquipmentPathsFamily overriddenFamily;

  @override
  EquipmentPathsProvider getProviderOverride(
    covariant EquipmentPathsProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for tracking the worked paths for the given equipment [uuid].
///
/// Copied from [EquipmentPaths].
class EquipmentPathsProvider extends NotifierProviderImpl<EquipmentPaths,
    List<Map<int, List<SectionEdgePositions>?>>> {
  /// A provider for tracking the worked paths for the given equipment [uuid].
  ///
  /// Copied from [EquipmentPaths].
  EquipmentPathsProvider(
    String uuid,
  ) : this._internal(
          () => EquipmentPaths()..uuid = uuid,
          from: equipmentPathsProvider,
          name: r'equipmentPathsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$equipmentPathsHash,
          dependencies: EquipmentPathsFamily._dependencies,
          allTransitiveDependencies:
              EquipmentPathsFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  EquipmentPathsProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  List<Map<int, List<SectionEdgePositions>?>> runNotifierBuild(
    covariant EquipmentPaths notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }

  @override
  Override overrideWith(EquipmentPaths Function() create) {
    return ProviderOverride(
      origin: this,
      override: EquipmentPathsProvider._internal(
        () => create()..uuid = uuid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  (String,) get argument {
    return (uuid,);
  }

  @override
  NotifierProviderElement<EquipmentPaths,
      List<Map<int, List<SectionEdgePositions>?>>> createElement() {
    return _EquipmentPathsProviderElement(this);
  }

  EquipmentPathsProvider _copyWith(
    EquipmentPaths Function() create,
  ) {
    return EquipmentPathsProvider._internal(
      () => create()..uuid = uuid,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      uuid: uuid,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EquipmentPathsProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EquipmentPathsRef
    on NotifierProviderRef<List<Map<int, List<SectionEdgePositions>?>>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _EquipmentPathsProviderElement extends NotifierProviderElement<
    EquipmentPaths,
    List<Map<int, List<SectionEdgePositions>?>>> with EquipmentPathsRef {
  _EquipmentPathsProviderElement(super.provider);

  @override
  String get uuid => (origin as EquipmentPathsProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
