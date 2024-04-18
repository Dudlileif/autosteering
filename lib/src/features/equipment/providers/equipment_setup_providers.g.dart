// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_setup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveEquipmentSetupHash() =>
    r'eeb18d15598e5ae048c7f6c027a337be61a338ba';

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

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
@ProviderFor(saveEquipmentSetup)
const saveEquipmentSetupProvider = SaveEquipmentSetupFamily();

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
class SaveEquipmentSetupFamily extends Family {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  const SaveEquipmentSetupFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveEquipmentSetupProvider';

  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  SaveEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveEquipmentSetupProvider(
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveEquipmentSetupProvider getProviderOverride(
    covariant SaveEquipmentSetupProvider provider,
  ) {
    return call(
      provider.setup,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(SaveEquipmentSetupRef ref) create) {
    return _$SaveEquipmentSetupFamilyOverride(this, create);
  }
}

class _$SaveEquipmentSetupFamilyOverride implements FamilyOverride {
  _$SaveEquipmentSetupFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveEquipmentSetupRef ref) create;

  @override
  final SaveEquipmentSetupFamily overriddenFamily;

  @override
  SaveEquipmentSetupProvider getProviderOverride(
    covariant SaveEquipmentSetupProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
class SaveEquipmentSetupProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  SaveEquipmentSetupProvider(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveEquipmentSetup(
            ref as SaveEquipmentSetupRef,
            setup,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveEquipmentSetupProvider,
          name: r'saveEquipmentSetupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveEquipmentSetupHash,
          dependencies: SaveEquipmentSetupFamily._dependencies,
          allTransitiveDependencies:
              SaveEquipmentSetupFamily._allTransitiveDependencies,
          setup: setup,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveEquipmentSetupProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setup,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final EquipmentSetup setup;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveEquipmentSetupRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveEquipmentSetupProvider._internal(
        (ref) => create(ref as SaveEquipmentSetupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setup: setup,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    EquipmentSetup, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveEquipmentSetupProviderElement(this);
  }

  SaveEquipmentSetupProvider _copyWith(
    FutureOr<void> Function(SaveEquipmentSetupRef ref) create,
  ) {
    return SaveEquipmentSetupProvider._internal(
      (ref) => create(ref as SaveEquipmentSetupRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      setup: setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentSetupProvider &&
        other.setup == setup &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setup.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveEquipmentSetupRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `setup` of this provider.
  EquipmentSetup get setup;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveEquipmentSetupProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveEquipmentSetupRef {
  _SaveEquipmentSetupProviderElement(super.provider);

  @override
  EquipmentSetup get setup => (origin as SaveEquipmentSetupProvider).setup;
  @override
  String? get overrideName =>
      (origin as SaveEquipmentSetupProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as SaveEquipmentSetupProvider).downloadIfWeb;
}

String _$exportEquipmentSetupHash() =>
    r'8b63aa8b1a112ef1a580db187bebc1e3e78f0113';

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipmentSetup].
@ProviderFor(exportEquipmentSetup)
const exportEquipmentSetupProvider = ExportEquipmentSetupFamily();

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipmentSetup].
class ExportEquipmentSetupFamily extends Family {
  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipmentSetup].
  const ExportEquipmentSetupFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportEquipmentSetupProvider';

  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipmentSetup].
  ExportEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return ExportEquipmentSetupProvider(
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportEquipmentSetupProvider getProviderOverride(
    covariant ExportEquipmentSetupProvider provider,
  ) {
    return call(
      provider.setup,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportEquipmentSetupRef ref) create) {
    return _$ExportEquipmentSetupFamilyOverride(this, create);
  }
}

class _$ExportEquipmentSetupFamilyOverride implements FamilyOverride {
  _$ExportEquipmentSetupFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportEquipmentSetupRef ref) create;

  @override
  final ExportEquipmentSetupFamily overriddenFamily;

  @override
  ExportEquipmentSetupProvider getProviderOverride(
    covariant ExportEquipmentSetupProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportEquipmentSetup].
class ExportEquipmentSetupProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipmentSetup].
  ExportEquipmentSetupProvider(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => exportEquipmentSetup(
            ref as ExportEquipmentSetupRef,
            setup,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportEquipmentSetupProvider,
          name: r'exportEquipmentSetupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportEquipmentSetupHash,
          dependencies: ExportEquipmentSetupFamily._dependencies,
          allTransitiveDependencies:
              ExportEquipmentSetupFamily._allTransitiveDependencies,
          setup: setup,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportEquipmentSetupProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setup,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final EquipmentSetup setup;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportEquipmentSetupRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportEquipmentSetupProvider._internal(
        (ref) => create(ref as ExportEquipmentSetupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setup: setup,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    EquipmentSetup, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportEquipmentSetupProviderElement(this);
  }

  ExportEquipmentSetupProvider _copyWith(
    FutureOr<void> Function(ExportEquipmentSetupRef ref) create,
  ) {
    return ExportEquipmentSetupProvider._internal(
      (ref) => create(ref as ExportEquipmentSetupRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      setup: setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentSetupProvider &&
        other.setup == setup &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setup.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportEquipmentSetupRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `setup` of this provider.
  EquipmentSetup get setup;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportEquipmentSetupProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ExportEquipmentSetupRef {
  _ExportEquipmentSetupProviderElement(super.provider);

  @override
  EquipmentSetup get setup => (origin as ExportEquipmentSetupProvider).setup;
  @override
  String? get overrideName =>
      (origin as ExportEquipmentSetupProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as ExportEquipmentSetupProvider).downloadIfWeb;
}

String _$savedEquipmentSetupsHash() =>
    r'4f67f5c8f44f66b8311f1316b2d26498dcc991d0';

/// A provider for reading and holding all the saved [EquipmentSetup]s in the
/// user file directory.
///
/// Copied from [savedEquipmentSetups].
@ProviderFor(savedEquipmentSetups)
final savedEquipmentSetupsProvider =
    FutureProvider<List<EquipmentSetup>>.internal(
  savedEquipmentSetups,
  name: r'savedEquipmentSetupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedEquipmentSetupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedEquipmentSetupsRef = FutureProviderRef<List<EquipmentSetup>>;
String _$deleteEquipmentSetupHash() =>
    r'606fc12bca98c2e8c9b7563205e0a79dbdc6e114';

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipmentSetup].
@ProviderFor(deleteEquipmentSetup)
const deleteEquipmentSetupProvider = DeleteEquipmentSetupFamily();

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipmentSetup].
class DeleteEquipmentSetupFamily extends Family {
  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipmentSetup].
  const DeleteEquipmentSetupFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteEquipmentSetupProvider';

  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipmentSetup].
  DeleteEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return DeleteEquipmentSetupProvider(
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  DeleteEquipmentSetupProvider getProviderOverride(
    covariant DeleteEquipmentSetupProvider provider,
  ) {
    return call(
      provider.setup,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteEquipmentSetupRef ref) create) {
    return _$DeleteEquipmentSetupFamilyOverride(this, create);
  }
}

class _$DeleteEquipmentSetupFamilyOverride implements FamilyOverride {
  _$DeleteEquipmentSetupFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteEquipmentSetupRef ref) create;

  @override
  final DeleteEquipmentSetupFamily overriddenFamily;

  @override
  DeleteEquipmentSetupProvider getProviderOverride(
    covariant DeleteEquipmentSetupProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteEquipmentSetup].
class DeleteEquipmentSetupProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipmentSetup].
  DeleteEquipmentSetupProvider(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => deleteEquipmentSetup(
            ref as DeleteEquipmentSetupRef,
            setup,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: deleteEquipmentSetupProvider,
          name: r'deleteEquipmentSetupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteEquipmentSetupHash,
          dependencies: DeleteEquipmentSetupFamily._dependencies,
          allTransitiveDependencies:
              DeleteEquipmentSetupFamily._allTransitiveDependencies,
          setup: setup,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  DeleteEquipmentSetupProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setup,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final EquipmentSetup setup;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteEquipmentSetupRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteEquipmentSetupProvider._internal(
        (ref) => create(ref as DeleteEquipmentSetupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setup: setup,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    EquipmentSetup, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteEquipmentSetupProviderElement(this);
  }

  DeleteEquipmentSetupProvider _copyWith(
    FutureOr<void> Function(DeleteEquipmentSetupRef ref) create,
  ) {
    return DeleteEquipmentSetupProvider._internal(
      (ref) => create(ref as DeleteEquipmentSetupRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      setup: setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteEquipmentSetupProvider &&
        other.setup == setup &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setup.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteEquipmentSetupRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `setup` of this provider.
  EquipmentSetup get setup;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _DeleteEquipmentSetupProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteEquipmentSetupRef {
  _DeleteEquipmentSetupProviderElement(super.provider);

  @override
  EquipmentSetup get setup => (origin as DeleteEquipmentSetupProvider).setup;
  @override
  String? get overrideName =>
      (origin as DeleteEquipmentSetupProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as DeleteEquipmentSetupProvider).downloadIfWeb;
}

String _$loadEquipmentSetupFromFileHash() =>
    r'd95a6c80af96e1fb13e7513d5edcee46eb72d303';

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.
///
/// Copied from [loadEquipmentSetupFromFile].
@ProviderFor(loadEquipmentSetupFromFile)
const loadEquipmentSetupFromFileProvider = LoadEquipmentSetupFromFileFamily();

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.
///
/// Copied from [loadEquipmentSetupFromFile].
class LoadEquipmentSetupFromFileFamily extends Family {
  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadEquipmentSetupFromFile].
  const LoadEquipmentSetupFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadEquipmentSetupFromFileProvider';

  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadEquipmentSetupFromFile].
  LoadEquipmentSetupFromFileProvider call(
    String path,
  ) {
    return LoadEquipmentSetupFromFileProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  LoadEquipmentSetupFromFileProvider getProviderOverride(
    covariant LoadEquipmentSetupFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<EquipmentSetup?> Function(LoadEquipmentSetupFromFileRef ref)
          create) {
    return _$LoadEquipmentSetupFromFileFamilyOverride(this, create);
  }
}

class _$LoadEquipmentSetupFromFileFamilyOverride implements FamilyOverride {
  _$LoadEquipmentSetupFromFileFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<EquipmentSetup?> Function(LoadEquipmentSetupFromFileRef ref)
      create;

  @override
  final LoadEquipmentSetupFromFileFamily overriddenFamily;

  @override
  LoadEquipmentSetupFromFileProvider getProviderOverride(
    covariant LoadEquipmentSetupFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.
///
/// Copied from [loadEquipmentSetupFromFile].
class LoadEquipmentSetupFromFileProvider
    extends AutoDisposeFutureProvider<EquipmentSetup?> {
  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadEquipmentSetupFromFile].
  LoadEquipmentSetupFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadEquipmentSetupFromFile(
            ref as LoadEquipmentSetupFromFileRef,
            path,
          ),
          from: loadEquipmentSetupFromFileProvider,
          name: r'loadEquipmentSetupFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadEquipmentSetupFromFileHash,
          dependencies: LoadEquipmentSetupFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadEquipmentSetupFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadEquipmentSetupFromFileProvider._internal(
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
    FutureOr<EquipmentSetup?> Function(LoadEquipmentSetupFromFileRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadEquipmentSetupFromFileProvider._internal(
        (ref) => create(ref as LoadEquipmentSetupFromFileRef),
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
  AutoDisposeFutureProviderElement<EquipmentSetup?> createElement() {
    return _LoadEquipmentSetupFromFileProviderElement(this);
  }

  LoadEquipmentSetupFromFileProvider _copyWith(
    FutureOr<EquipmentSetup?> Function(LoadEquipmentSetupFromFileRef ref)
        create,
  ) {
    return LoadEquipmentSetupFromFileProvider._internal(
      (ref) => create(ref as LoadEquipmentSetupFromFileRef),
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
    return other is LoadEquipmentSetupFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadEquipmentSetupFromFileRef
    on AutoDisposeFutureProviderRef<EquipmentSetup?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadEquipmentSetupFromFileProviderElement
    extends AutoDisposeFutureProviderElement<EquipmentSetup?>
    with LoadEquipmentSetupFromFileRef {
  _LoadEquipmentSetupFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadEquipmentSetupFromFileProvider).path;
}

String _$importEquipmentSetupHash() =>
    r'a46b4773d058fdc9e18e31eb1cad907da7c8f8c7';

/// A provider for importing a equipment setup configuration from the user file
/// directory and applying it to the [ConfiguredEquipmentSetup] provider.
///
/// Copied from [importEquipmentSetup].
@ProviderFor(importEquipmentSetup)
final importEquipmentSetupProvider =
    AutoDisposeFutureProvider<EquipmentSetup?>.internal(
  importEquipmentSetup,
  name: r'importEquipmentSetupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importEquipmentSetupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportEquipmentSetupRef = AutoDisposeFutureProviderRef<EquipmentSetup?>;
String _$configuredEquipmentSetupHash() =>
    r'71c216b7b74326207c15483b43159727e9ee7743';

/// A provider or holding the configured/loaded [EquipmentSetup] in memory.
///
/// Copied from [ConfiguredEquipmentSetup].
@ProviderFor(ConfiguredEquipmentSetup)
final configuredEquipmentSetupProvider =
    NotifierProvider<ConfiguredEquipmentSetup, EquipmentSetup?>.internal(
  ConfiguredEquipmentSetup.new,
  name: r'configuredEquipmentSetupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentSetupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipmentSetup = Notifier<EquipmentSetup?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
