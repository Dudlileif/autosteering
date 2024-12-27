// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_setup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveEquipmentSetupHash() =>
    r'6e0dc61ad3693807604e4b8314aab2ba3ffe4375';

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
class SaveEquipmentSetupFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  const SaveEquipmentSetupFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveEquipmentSetupProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(SaveEquipmentSetupRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveEquipmentSetupProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'401caa4accd623a0db3cad6119649a4fb14ede92';

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
class ExportEquipmentSetupFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportEquipmentSetup].
  const ExportEquipmentSetupFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportEquipmentSetupProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(ExportEquipmentSetupRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportEquipmentSetupProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'0d6e509cbec5d1f6b1e1bcfdc68053bb39a0fd5e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedEquipmentSetupsRef = FutureProviderRef<List<EquipmentSetup>>;
String _$deleteEquipmentSetupHash() =>
    r'02bf2c93100e497d02165324200e0d189ba1f67e';

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
class DeleteEquipmentSetupFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteEquipmentSetup].
  const DeleteEquipmentSetupFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteEquipmentSetupProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(DeleteEquipmentSetupRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteEquipmentSetupProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'a1f1892452fc1a6c7a1b36881a262c3a9307753c';

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
class LoadEquipmentSetupFromFileFamily
    extends Family<AsyncValue<EquipmentSetup?>> {
  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadEquipmentSetupFromFile].
  const LoadEquipmentSetupFromFileFamily();

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

  @override
  LoadEquipmentSetupFromFileProvider getProviderOverride(
    covariant LoadEquipmentSetupFromFileProvider provider,
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
  String? get name => r'loadEquipmentSetupFromFileProvider';
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
    FutureOr<EquipmentSetup?> Function(LoadEquipmentSetupFromFileRef provider)
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
  AutoDisposeFutureProviderElement<EquipmentSetup?> createElement() {
    return _LoadEquipmentSetupFromFileProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'3c597120b06e5aab721193e82cc1e592443e628f';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportEquipmentSetupRef = AutoDisposeFutureProviderRef<EquipmentSetup?>;
String _$configuredEquipmentSetupHash() =>
    r'b39fe174ad64a3c80c6fbf2fdecc6db9da6bbfea';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
