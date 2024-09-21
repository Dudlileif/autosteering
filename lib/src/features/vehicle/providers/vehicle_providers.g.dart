// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveVehicleHash() => r'ce89bba4dcd7af4ce029bcabc1470e2772f92e1b';

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

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveVehicle].
@ProviderFor(saveVehicle)
const saveVehicleProvider = SaveVehicleFamily();

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveVehicle].
class SaveVehicleFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveVehicle].
  const SaveVehicleFamily();

  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveVehicle].
  SaveVehicleProvider call(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveVehicleProvider(
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  SaveVehicleProvider getProviderOverride(
    covariant SaveVehicleProvider provider,
  ) {
    return call(
      provider.vehicle,
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
  String? get name => r'saveVehicleProvider';
}

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveVehicle].
class SaveVehicleProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveVehicle].
  SaveVehicleProvider(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveVehicle(
            ref as SaveVehicleRef,
            vehicle,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveVehicleProvider,
          name: r'saveVehicleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveVehicleHash,
          dependencies: SaveVehicleFamily._dependencies,
          allTransitiveDependencies:
              SaveVehicleFamily._allTransitiveDependencies,
          vehicle: vehicle,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveVehicleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicle,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Vehicle vehicle;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveVehicleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveVehicleProvider._internal(
        (ref) => create(ref as SaveVehicleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicle: vehicle,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveVehicleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveVehicleProvider &&
        other.vehicle == vehicle &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicle.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveVehicleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `vehicle` of this provider.
  Vehicle get vehicle;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveVehicleProviderElement extends AutoDisposeFutureProviderElement<void>
    with SaveVehicleRef {
  _SaveVehicleProviderElement(super.provider);

  @override
  Vehicle get vehicle => (origin as SaveVehicleProvider).vehicle;
  @override
  String? get overrideName => (origin as SaveVehicleProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveVehicleProvider).downloadIfWeb;
}

String _$exportVehicleHash() => r'78a69723b1eb246edb92c4763447b3f540157160';

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportVehicle].
@ProviderFor(exportVehicle)
const exportVehicleProvider = ExportVehicleFamily();

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportVehicle].
class ExportVehicleFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportVehicle].
  const ExportVehicleFamily();

  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportVehicle].
  ExportVehicleProvider call(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return ExportVehicleProvider(
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  ExportVehicleProvider getProviderOverride(
    covariant ExportVehicleProvider provider,
  ) {
    return call(
      provider.vehicle,
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
  String? get name => r'exportVehicleProvider';
}

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportVehicle].
class ExportVehicleProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportVehicle].
  ExportVehicleProvider(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => exportVehicle(
            ref as ExportVehicleRef,
            vehicle,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportVehicleProvider,
          name: r'exportVehicleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportVehicleHash,
          dependencies: ExportVehicleFamily._dependencies,
          allTransitiveDependencies:
              ExportVehicleFamily._allTransitiveDependencies,
          vehicle: vehicle,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportVehicleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicle,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Vehicle vehicle;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportVehicleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportVehicleProvider._internal(
        (ref) => create(ref as ExportVehicleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicle: vehicle,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportVehicleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportVehicleProvider &&
        other.vehicle == vehicle &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicle.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportVehicleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `vehicle` of this provider.
  Vehicle get vehicle;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportVehicleProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportVehicleRef {
  _ExportVehicleProviderElement(super.provider);

  @override
  Vehicle get vehicle => (origin as ExportVehicleProvider).vehicle;
  @override
  String? get overrideName => (origin as ExportVehicleProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportVehicleProvider).downloadIfWeb;
}

String _$savedVehiclesHash() => r'3ff81606b7f593c2244418ebd77e709960c450b0';

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.
///
/// Copied from [savedVehicles].
@ProviderFor(savedVehicles)
final savedVehiclesProvider = FutureProvider<List<Vehicle>>.internal(
  savedVehicles,
  name: r'savedVehiclesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedVehiclesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedVehiclesRef = FutureProviderRef<List<Vehicle>>;
String _$deleteVehicleHash() => r'82eb292792c91d1d0690d546469839b4004f50b4';

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteVehicle].
@ProviderFor(deleteVehicle)
const deleteVehicleProvider = DeleteVehicleFamily();

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteVehicle].
class DeleteVehicleFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteVehicle].
  const DeleteVehicleFamily();

  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteVehicle].
  DeleteVehicleProvider call(
    Vehicle vehicle, {
    String? overrideName,
  }) {
    return DeleteVehicleProvider(
      vehicle,
      overrideName: overrideName,
    );
  }

  @override
  DeleteVehicleProvider getProviderOverride(
    covariant DeleteVehicleProvider provider,
  ) {
    return call(
      provider.vehicle,
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
  String? get name => r'deleteVehicleProvider';
}

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteVehicle].
class DeleteVehicleProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteVehicle].
  DeleteVehicleProvider(
    Vehicle vehicle, {
    String? overrideName,
  }) : this._internal(
          (ref) => deleteVehicle(
            ref as DeleteVehicleRef,
            vehicle,
            overrideName: overrideName,
          ),
          from: deleteVehicleProvider,
          name: r'deleteVehicleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteVehicleHash,
          dependencies: DeleteVehicleFamily._dependencies,
          allTransitiveDependencies:
              DeleteVehicleFamily._allTransitiveDependencies,
          vehicle: vehicle,
          overrideName: overrideName,
        );

  DeleteVehicleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicle,
    required this.overrideName,
  }) : super.internal();

  final Vehicle vehicle;
  final String? overrideName;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteVehicleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteVehicleProvider._internal(
        (ref) => create(ref as DeleteVehicleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicle: vehicle,
        overrideName: overrideName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteVehicleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteVehicleProvider &&
        other.vehicle == vehicle &&
        other.overrideName == overrideName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicle.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteVehicleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `vehicle` of this provider.
  Vehicle get vehicle;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _DeleteVehicleProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteVehicleRef {
  _DeleteVehicleProviderElement(super.provider);

  @override
  Vehicle get vehicle => (origin as DeleteVehicleProvider).vehicle;
  @override
  String? get overrideName => (origin as DeleteVehicleProvider).overrideName;
}

String _$loadVehicleFromFileHash() =>
    r'4a7b24c90bd4d07300e5f09c4ffa7cc4794ed325';

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
///
/// Copied from [loadVehicleFromFile].
@ProviderFor(loadVehicleFromFile)
const loadVehicleFromFileProvider = LoadVehicleFromFileFamily();

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
///
/// Copied from [loadVehicleFromFile].
class LoadVehicleFromFileFamily extends Family<AsyncValue<Vehicle?>> {
  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.
  ///
  /// Copied from [loadVehicleFromFile].
  const LoadVehicleFromFileFamily();

  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.
  ///
  /// Copied from [loadVehicleFromFile].
  LoadVehicleFromFileProvider call(
    String path,
  ) {
    return LoadVehicleFromFileProvider(
      path,
    );
  }

  @override
  LoadVehicleFromFileProvider getProviderOverride(
    covariant LoadVehicleFromFileProvider provider,
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
  String? get name => r'loadVehicleFromFileProvider';
}

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
///
/// Copied from [loadVehicleFromFile].
class LoadVehicleFromFileProvider extends AutoDisposeFutureProvider<Vehicle?> {
  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.
  ///
  /// Copied from [loadVehicleFromFile].
  LoadVehicleFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadVehicleFromFile(
            ref as LoadVehicleFromFileRef,
            path,
          ),
          from: loadVehicleFromFileProvider,
          name: r'loadVehicleFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadVehicleFromFileHash,
          dependencies: LoadVehicleFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadVehicleFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadVehicleFromFileProvider._internal(
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
    FutureOr<Vehicle?> Function(LoadVehicleFromFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadVehicleFromFileProvider._internal(
        (ref) => create(ref as LoadVehicleFromFileRef),
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
  AutoDisposeFutureProviderElement<Vehicle?> createElement() {
    return _LoadVehicleFromFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadVehicleFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadVehicleFromFileRef on AutoDisposeFutureProviderRef<Vehicle?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadVehicleFromFileProviderElement
    extends AutoDisposeFutureProviderElement<Vehicle?>
    with LoadVehicleFromFileRef {
  _LoadVehicleFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadVehicleFromFileProvider).path;
}

String _$lastUsedVehicleHash() => r'685997d196ec06b072c0af95be50bfc5fe78b202';

/// A provider for the most recently used [Vehicle].
///
/// The vehicle is found by sorting the saved vehicles by their last used
/// property.
///
/// Copied from [lastUsedVehicle].
@ProviderFor(lastUsedVehicle)
final lastUsedVehicleProvider = Provider<AsyncValue<Vehicle>>.internal(
  lastUsedVehicle,
  name: r'lastUsedVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastUsedVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LastUsedVehicleRef = ProviderRef<AsyncValue<Vehicle>>;
String _$importVehicleHash() => r'5404b690145aadc0cfe630c1898a0c91c02c6b31';

/// A provider for importing a vehicle configuration from a file and applying it
/// to the [ConfiguredVehicle] provider.
///
/// Copied from [importVehicle].
@ProviderFor(importVehicle)
final importVehicleProvider = AutoDisposeFutureProvider<Vehicle?>.internal(
  importVehicle,
  name: r'importVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportVehicleRef = AutoDisposeFutureProviderRef<Vehicle?>;
String _$exportVehiclesHash() => r'54ec2f0b7430d3f878dad695628af952d99bfadd';

/// A provider for exporting all vehicle files.
///
/// Copied from [exportVehicles].
@ProviderFor(exportVehicles)
const exportVehiclesProvider = ExportVehiclesFamily();

/// A provider for exporting all vehicle files.
///
/// Copied from [exportVehicles].
class ExportVehiclesFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all vehicle files.
  ///
  /// Copied from [exportVehicles].
  const ExportVehiclesFamily();

  /// A provider for exporting all vehicle files.
  ///
  /// Copied from [exportVehicles].
  ExportVehiclesProvider call({
    bool zip = true,
  }) {
    return ExportVehiclesProvider(
      zip: zip,
    );
  }

  @override
  ExportVehiclesProvider getProviderOverride(
    covariant ExportVehiclesProvider provider,
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
  String? get name => r'exportVehiclesProvider';
}

/// A provider for exporting all vehicle files.
///
/// Copied from [exportVehicles].
class ExportVehiclesProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all vehicle files.
  ///
  /// Copied from [exportVehicles].
  ExportVehiclesProvider({
    bool zip = true,
  }) : this._internal(
          (ref) => exportVehicles(
            ref as ExportVehiclesRef,
            zip: zip,
          ),
          from: exportVehiclesProvider,
          name: r'exportVehiclesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportVehiclesHash,
          dependencies: ExportVehiclesFamily._dependencies,
          allTransitiveDependencies:
              ExportVehiclesFamily._allTransitiveDependencies,
          zip: zip,
        );

  ExportVehiclesProvider._internal(
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
    FutureOr<void> Function(ExportVehiclesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportVehiclesProvider._internal(
        (ref) => create(ref as ExportVehiclesRef),
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
    return _ExportVehiclesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportVehiclesProvider && other.zip == zip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zip.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportVehiclesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportVehiclesProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportVehiclesRef {
  _ExportVehiclesProviderElement(super.provider);

  @override
  bool get zip => (origin as ExportVehiclesProvider).zip;
}

String _$mainVehicleHash() => r'dd2c1e60707dd90caeef5e4ac7460333506bf47a';

/// The main provider for the vehicle state.
///
/// Copied from [MainVehicle].
@ProviderFor(MainVehicle)
final mainVehicleProvider = NotifierProvider<MainVehicle, Vehicle>.internal(
  MainVehicle.new,
  name: r'mainVehicleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainVehicle = Notifier<Vehicle>;
String _$activeAutosteeringStateHash() =>
    r'179e96f0f4769919800d274e879d27b41dcdcafd';

/// A provider for the active [AutosteeringState] of the vehicle.
///
/// Copied from [ActiveAutosteeringState].
@ProviderFor(ActiveAutosteeringState)
final activeAutosteeringStateProvider =
    NotifierProvider<ActiveAutosteeringState, AutosteeringState>.internal(
  ActiveAutosteeringState.new,
  name: r'activeAutosteeringStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeAutosteeringStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveAutosteeringState = Notifier<AutosteeringState>;
String _$gaugesAverageCountHash() =>
    r'3a61a280ef00f4f7898c45aeabcb6a5fe36b5bff';

/// A provider for the number of previous positions to use for calculating
/// the gauge velocity and bearing values.
///
/// Copied from [GaugesAverageCount].
@ProviderFor(GaugesAverageCount)
final gaugesAverageCountProvider =
    NotifierProvider<GaugesAverageCount, int>.internal(
  GaugesAverageCount.new,
  name: r'gaugesAverageCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gaugesAverageCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GaugesAverageCount = Notifier<int>;
String _$vehicleSteeringAngleTargetHash() =>
    r'7d5f2ffb6c1757fe4633b37829f487579cf704e0';

/// A provider for the target steering angle when using guidance.
///
/// Copied from [VehicleSteeringAngleTarget].
@ProviderFor(VehicleSteeringAngleTarget)
final vehicleSteeringAngleTargetProvider =
    AutoDisposeNotifierProvider<VehicleSteeringAngleTarget, double?>.internal(
  VehicleSteeringAngleTarget.new,
  name: r'vehicleSteeringAngleTargetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleSteeringAngleTargetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleSteeringAngleTarget = AutoDisposeNotifier<double?>;
String _$showOverrideSteeringHash() =>
    r'589da280c5feee0b9e1f741c7a3e00bc2db71966';

/// A provider for whether widgets for overriding the steering should be shown.
///
/// Copied from [ShowOverrideSteering].
@ProviderFor(ShowOverrideSteering)
final showOverrideSteeringProvider =
    AutoDisposeNotifierProvider<ShowOverrideSteering, bool>.internal(
  ShowOverrideSteering.new,
  name: r'showOverrideSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showOverrideSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowOverrideSteering = AutoDisposeNotifier<bool>;
String _$overrideSteeringHash() => r'4ced2e608447af433913fbfccd271058deb470d2';

/// Whether the steering should be overridden. Usually used to test the
/// steering motor and WAS together.
///
/// Copied from [OverrideSteering].
@ProviderFor(OverrideSteering)
final overrideSteeringProvider =
    AutoDisposeNotifierProvider<OverrideSteering, bool>.internal(
  OverrideSteering.new,
  name: r'overrideSteeringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overrideSteeringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OverrideSteering = AutoDisposeNotifier<bool>;
String _$overrideSteeringAngleHash() =>
    r'1b900da2b35f4f4a099e4ffd84786acd7ab8ed5b';

/// A provider for the steering angle to override with.
///
/// Copied from [OverrideSteeringAngle].
@ProviderFor(OverrideSteeringAngle)
final overrideSteeringAngleProvider =
    AutoDisposeNotifierProvider<OverrideSteeringAngle, double>.internal(
  OverrideSteeringAngle.new,
  name: r'overrideSteeringAngleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overrideSteeringAngleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OverrideSteeringAngle = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
