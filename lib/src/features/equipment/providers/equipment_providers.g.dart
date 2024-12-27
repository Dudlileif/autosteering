// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadEquipmentFromFileHash() =>
    r'422adf1b1af74bab6f42d15b35e1f2f3b629ae24';

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
class LoadEquipmentFromFileFamily extends Family<AsyncValue<Equipment?>> {
  /// A provider for loading an [Equipment] from a file at [path], if it's valid.
  ///
  /// Copied from [loadEquipmentFromFile].
  const LoadEquipmentFromFileFamily();

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

  @override
  LoadEquipmentFromFileProvider getProviderOverride(
    covariant LoadEquipmentFromFileProvider provider,
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
  String? get name => r'loadEquipmentFromFileProvider';
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
    FutureOr<Equipment?> Function(LoadEquipmentFromFileRef provider) create,
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
  AutoDisposeFutureProviderElement<Equipment?> createElement() {
    return _LoadEquipmentFromFileProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$saveEquipmentHash() => r'd9224364098dbad4ab20bc9a5b3696e3a070c848';

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
class SaveEquipmentFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipment].
  const SaveEquipmentFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveEquipmentProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(SaveEquipmentRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveEquipmentProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$exportEquipmentHash() => r'339c3a416629bd47b089892f76adf8c4fe1e4a3e';

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
class ExportEquipmentFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipment].
  const ExportEquipmentFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportEquipmentProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(ExportEquipmentRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportEquipmentProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$savedEquipmentsHash() => r'039b1985239b14fc15ba46f72abf90002a8f5d2b';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedEquipmentsRef = FutureProviderRef<List<Equipment>>;
String _$deleteEquipmentHash() => r'cf2a25bbb6711e813fa5420a1b77140771dc9489';

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
class DeleteEquipmentFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipment].
  const DeleteEquipmentFamily();

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

  @override
  DeleteEquipmentProvider getProviderOverride(
    covariant DeleteEquipmentProvider provider,
  ) {
    return call(
      provider.equipment,
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
  String? get name => r'deleteEquipmentProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(DeleteEquipmentRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteEquipmentProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$importEquipmentHash() => r'23788a72e175496df6e300087a244ad146ac2e28';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportEquipmentRef = AutoDisposeFutureProviderRef<Equipment?>;
String _$exportEquipmentsHash() => r'b901191f3ac54bfe593d9dadec5e5c17d4c37977';

/// A provider for exporting all equipment files.
///
/// Copied from [exportEquipments].
@ProviderFor(exportEquipments)
const exportEquipmentsProvider = ExportEquipmentsFamily();

/// A provider for exporting all equipment files.
///
/// Copied from [exportEquipments].
class ExportEquipmentsFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all equipment files.
  ///
  /// Copied from [exportEquipments].
  const ExportEquipmentsFamily();

  /// A provider for exporting all equipment files.
  ///
  /// Copied from [exportEquipments].
  ExportEquipmentsProvider call({
    bool zip = true,
  }) {
    return ExportEquipmentsProvider(
      zip: zip,
    );
  }

  @override
  ExportEquipmentsProvider getProviderOverride(
    covariant ExportEquipmentsProvider provider,
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
  String? get name => r'exportEquipmentsProvider';
}

/// A provider for exporting all equipment files.
///
/// Copied from [exportEquipments].
class ExportEquipmentsProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all equipment files.
  ///
  /// Copied from [exportEquipments].
  ExportEquipmentsProvider({
    bool zip = true,
  }) : this._internal(
          (ref) => exportEquipments(
            ref as ExportEquipmentsRef,
            zip: zip,
          ),
          from: exportEquipmentsProvider,
          name: r'exportEquipmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportEquipmentsHash,
          dependencies: ExportEquipmentsFamily._dependencies,
          allTransitiveDependencies:
              ExportEquipmentsFamily._allTransitiveDependencies,
          zip: zip,
        );

  ExportEquipmentsProvider._internal(
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
    FutureOr<void> Function(ExportEquipmentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportEquipmentsProvider._internal(
        (ref) => create(ref as ExportEquipmentsRef),
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
    return _ExportEquipmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentsProvider && other.zip == zip;
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
mixin ExportEquipmentsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportEquipmentsProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportEquipmentsRef {
  _ExportEquipmentsProviderElement(super.provider);

  @override
  bool get zip => (origin as ExportEquipmentsProvider).zip;
}

String _$equipmentRecordPositionFractionHash() =>
    r'2ab56c11b65629fd5821b943bd890e8027858706';

/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].
///
/// Copied from [EquipmentRecordPositionFraction].
@ProviderFor(EquipmentRecordPositionFraction)
final equipmentRecordPositionFractionProvider =
    NotifierProvider<EquipmentRecordPositionFraction, double?>.internal(
  EquipmentRecordPositionFraction.new,
  name: r'equipmentRecordPositionFractionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentRecordPositionFractionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentRecordPositionFraction = Notifier<double?>;
String _$loadedEquipmentHash() => r'ab5df27cb509589b4b9c2a0836d6b50a8cde3c6f';

/// A provider for the currently loaded equipment.
///
/// Copied from [LoadedEquipment].
@ProviderFor(LoadedEquipment)
final loadedEquipmentProvider =
    NotifierProvider<LoadedEquipment, Equipment?>.internal(
  LoadedEquipment.new,
  name: r'loadedEquipmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadedEquipmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadedEquipment = Notifier<Equipment?>;
String _$allEquipmentsHash() => r'ed6e2354d60f1b17f19d0cea1df6909f78cbcecc';

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
    r'64fa5bf5976884164bb0c37ed91afc0be24c9ebe';

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
String _$equipmentPathsHash() => r'a0a66e98347524538968c1ec072e24afd168bec3';

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
class EquipmentPathsFamily
    extends Family<List<Map<int, List<SectionEdgePositions>?>>> {
  /// A provider for tracking the worked paths for the given equipment [uuid].
  ///
  /// Copied from [EquipmentPaths].
  const EquipmentPathsFamily();

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

  @override
  EquipmentPathsProvider getProviderOverride(
    covariant EquipmentPathsProvider provider,
  ) {
    return call(
      provider.uuid,
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
  String? get name => r'equipmentPathsProvider';
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
    super._createNotifier, {
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
  NotifierProviderElement<EquipmentPaths,
      List<Map<int, List<SectionEdgePositions>?>>> createElement() {
    return _EquipmentPathsProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$equipmentLogRecordsHash() =>
    r'954a54514a9d2823524998e293fcdcd2d8b91ac6';

abstract class _$EquipmentLogRecords
    extends BuildlessNotifier<List<EquipmentLogRecord>?> {
  late final String uuid;

  List<EquipmentLogRecord>? build(
    String uuid,
  );
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.
///
/// Copied from [EquipmentLogRecords].
@ProviderFor(EquipmentLogRecords)
const equipmentLogRecordsProvider = EquipmentLogRecordsFamily();

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.
///
/// Copied from [EquipmentLogRecords].
class EquipmentLogRecordsFamily extends Family<List<EquipmentLogRecord>?> {
  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given UUID.
  ///
  /// Copied from [EquipmentLogRecords].
  const EquipmentLogRecordsFamily();

  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given UUID.
  ///
  /// Copied from [EquipmentLogRecords].
  EquipmentLogRecordsProvider call(
    String uuid,
  ) {
    return EquipmentLogRecordsProvider(
      uuid,
    );
  }

  @override
  EquipmentLogRecordsProvider getProviderOverride(
    covariant EquipmentLogRecordsProvider provider,
  ) {
    return call(
      provider.uuid,
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
  String? get name => r'equipmentLogRecordsProvider';
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.
///
/// Copied from [EquipmentLogRecords].
class EquipmentLogRecordsProvider extends NotifierProviderImpl<
    EquipmentLogRecords, List<EquipmentLogRecord>?> {
  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given UUID.
  ///
  /// Copied from [EquipmentLogRecords].
  EquipmentLogRecordsProvider(
    String uuid,
  ) : this._internal(
          () => EquipmentLogRecords()..uuid = uuid,
          from: equipmentLogRecordsProvider,
          name: r'equipmentLogRecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$equipmentLogRecordsHash,
          dependencies: EquipmentLogRecordsFamily._dependencies,
          allTransitiveDependencies:
              EquipmentLogRecordsFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  EquipmentLogRecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  List<EquipmentLogRecord>? runNotifierBuild(
    covariant EquipmentLogRecords notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }

  @override
  Override overrideWith(EquipmentLogRecords Function() create) {
    return ProviderOverride(
      origin: this,
      override: EquipmentLogRecordsProvider._internal(
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
  NotifierProviderElement<EquipmentLogRecords, List<EquipmentLogRecord>?>
      createElement() {
    return _EquipmentLogRecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EquipmentLogRecordsProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EquipmentLogRecordsRef on NotifierProviderRef<List<EquipmentLogRecord>?> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _EquipmentLogRecordsProviderElement extends NotifierProviderElement<
    EquipmentLogRecords,
    List<EquipmentLogRecord>?> with EquipmentLogRecordsRef {
  _EquipmentLogRecordsProviderElement(super.provider);

  @override
  String get uuid => (origin as EquipmentLogRecordsProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
