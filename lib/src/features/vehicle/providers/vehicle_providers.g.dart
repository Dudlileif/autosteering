// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

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
class SaveVehicleFamily extends Family {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveVehicle].
  const SaveVehicleFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveVehicleProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(SaveVehicleRef ref) create) {
    return _$SaveVehicleFamilyOverride(this, create);
  }
}

class _$SaveVehicleFamilyOverride implements FamilyOverride {
  _$SaveVehicleFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveVehicleRef ref) create;

  @override
  final SaveVehicleFamily overriddenFamily;

  @override
  SaveVehicleProvider getProviderOverride(
    covariant SaveVehicleProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(SaveVehicleRef ref) create,
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
  (
    Vehicle, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveVehicleProviderElement(this);
  }

  SaveVehicleProvider _copyWith(
    FutureOr<void> Function(SaveVehicleRef ref) create,
  ) {
    return SaveVehicleProvider._internal(
      (ref) => create(ref as SaveVehicleRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      vehicle: vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
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
class ExportVehicleFamily extends Family {
  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportVehicle].
  const ExportVehicleFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportVehicleProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(ExportVehicleRef ref) create) {
    return _$ExportVehicleFamilyOverride(this, create);
  }
}

class _$ExportVehicleFamilyOverride implements FamilyOverride {
  _$ExportVehicleFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportVehicleRef ref) create;

  @override
  final ExportVehicleFamily overriddenFamily;

  @override
  ExportVehicleProvider getProviderOverride(
    covariant ExportVehicleProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(ExportVehicleRef ref) create,
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
  (
    Vehicle, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportVehicleProviderElement(this);
  }

  ExportVehicleProvider _copyWith(
    FutureOr<void> Function(ExportVehicleRef ref) create,
  ) {
    return ExportVehicleProvider._internal(
      (ref) => create(ref as ExportVehicleRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      vehicle: vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
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

String _$savedVehiclesHash() => r'2fd0ed9dde2e0b21456e5153b95a2b4232c61d17';

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.
///
/// Copied from [savedVehicles].
@ProviderFor(savedVehicles)
final savedVehiclesProvider = Provider<AsyncValue<List<Vehicle>>>.internal(
  savedVehicles,
  name: r'savedVehiclesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedVehiclesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedVehiclesRef = ProviderRef<AsyncValue<List<Vehicle>>>;
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
class DeleteVehicleFamily extends Family {
  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteVehicle].
  const DeleteVehicleFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteVehicleProvider';

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

  @visibleForOverriding
  @override
  DeleteVehicleProvider getProviderOverride(
    covariant DeleteVehicleProvider provider,
  ) {
    return call(
      provider.vehicle,
      overrideName: provider.overrideName,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(DeleteVehicleRef ref) create) {
    return _$DeleteVehicleFamilyOverride(this, create);
  }
}

class _$DeleteVehicleFamilyOverride implements FamilyOverride {
  _$DeleteVehicleFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteVehicleRef ref) create;

  @override
  final DeleteVehicleFamily overriddenFamily;

  @override
  DeleteVehicleProvider getProviderOverride(
    covariant DeleteVehicleProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(DeleteVehicleRef ref) create,
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
  (
    Vehicle, {
    String? overrideName,
  }) get argument {
    return (
      vehicle,
      overrideName: overrideName,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteVehicleProviderElement(this);
  }

  DeleteVehicleProvider _copyWith(
    FutureOr<void> Function(DeleteVehicleRef ref) create,
  ) {
    return DeleteVehicleProvider._internal(
      (ref) => create(ref as DeleteVehicleRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      vehicle: vehicle,
      overrideName: overrideName,
    );
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
    r'c0fbeb362d82690b35e0b1a891ff6a8cf62848ba';

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
///
/// Copied from [loadVehicleFromFile].
@ProviderFor(loadVehicleFromFile)
const loadVehicleFromFileProvider = LoadVehicleFromFileFamily();

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.
///
/// Copied from [loadVehicleFromFile].
class LoadVehicleFromFileFamily extends Family {
  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.
  ///
  /// Copied from [loadVehicleFromFile].
  const LoadVehicleFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadVehicleFromFileProvider';

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

  @visibleForOverriding
  @override
  LoadVehicleFromFileProvider getProviderOverride(
    covariant LoadVehicleFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Vehicle?> Function(LoadVehicleFromFileRef ref) create) {
    return _$LoadVehicleFromFileFamilyOverride(this, create);
  }
}

class _$LoadVehicleFromFileFamilyOverride implements FamilyOverride {
  _$LoadVehicleFromFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Vehicle?> Function(LoadVehicleFromFileRef ref) create;

  @override
  final LoadVehicleFromFileFamily overriddenFamily;

  @override
  LoadVehicleFromFileProvider getProviderOverride(
    covariant LoadVehicleFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    FutureOr<Vehicle?> Function(LoadVehicleFromFileRef ref) create,
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
  (String,) get argument {
    return (path,);
  }

  @override
  AutoDisposeFutureProviderElement<Vehicle?> createElement() {
    return _LoadVehicleFromFileProviderElement(this);
  }

  LoadVehicleFromFileProvider _copyWith(
    FutureOr<Vehicle?> Function(LoadVehicleFromFileRef ref) create,
  ) {
    return LoadVehicleFromFileProvider._internal(
      (ref) => create(ref as LoadVehicleFromFileRef),
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
String _$importVehicleHash() => r'a9d446787ba251c44a41458cc2331fca8c5b664b';

/// A provider for importing a vehicle configuration from a file and applying it
/// to the [ConfiguredVehicle] provider.
///
/// Copied from [importVehicle].
@ProviderFor(importVehicle)
final importVehicleProvider =
    AutoDisposeProvider<AsyncValue<Vehicle?>>.internal(
  importVehicle,
  name: r'importVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportVehicleRef = AutoDisposeProviderRef<AsyncValue<Vehicle?>>;
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
    r'35c2fabbbb9a104f1c1794d94049ad4cd0e2b65f';

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
    r'8b36c1bc95239048650b55ea1f7da6920ea3ddc0';

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
String _$imuCurrentFrequencyHash() =>
    r'37d83d64c27e1793cca6b546e9777fa0157c86bc';

/// A provider for the frequency of the IMU updates.
///
/// Copied from [ImuCurrentFrequency].
@ProviderFor(ImuCurrentFrequency)
final imuCurrentFrequencyProvider =
    AutoDisposeNotifierProvider<ImuCurrentFrequency, double?>.internal(
  ImuCurrentFrequency.new,
  name: r'imuCurrentFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imuCurrentFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImuCurrentFrequency = AutoDisposeNotifier<double?>;
String _$imuCurrentReadingHash() => r'52018dd12927d1890edb4af3670eee380615e279';

/// A provider for the current raw [ImuReading] from the hardware.
///
/// Copied from [ImuCurrentReading].
@ProviderFor(ImuCurrentReading)
final imuCurrentReadingProvider =
    AutoDisposeNotifierProvider<ImuCurrentReading, ImuReading?>.internal(
  ImuCurrentReading.new,
  name: r'imuCurrentReadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imuCurrentReadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImuCurrentReading = AutoDisposeNotifier<ImuReading?>;
String _$wasCurrentFrequencyHash() =>
    r'c5c45a14fc33f405dc840d21ddeb43c7971cea4d';

/// A provider for the frequency of the WAS updates.
///
/// Copied from [WasCurrentFrequency].
@ProviderFor(WasCurrentFrequency)
final wasCurrentFrequencyProvider =
    AutoDisposeNotifierProvider<WasCurrentFrequency, double?>.internal(
  WasCurrentFrequency.new,
  name: r'wasCurrentFrequencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wasCurrentFrequencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WasCurrentFrequency = AutoDisposeNotifier<double?>;
String _$wasCurrentReadingHash() => r'9307def230e7852695d3854e367308e81b21249d';

/// A provider for the current raw [WasReading] from the hardware.
///
/// Copied from [WasCurrentReading].
@ProviderFor(WasCurrentReading)
final wasCurrentReadingProvider =
    AutoDisposeNotifierProvider<WasCurrentReading, WasReading?>.internal(
  WasCurrentReading.new,
  name: r'wasCurrentReadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wasCurrentReadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WasCurrentReading = AutoDisposeNotifier<WasReading?>;
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
