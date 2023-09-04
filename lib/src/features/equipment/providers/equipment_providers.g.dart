// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadEquipmentFromFileHash() =>
    r'4e4006945c3bf754855225412d5dc7b2ce1f97b6';

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

String _$saveEquipmentHash() => r'79b127695ddd5594fbca9735c10a1f3c509b02f2';

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
  }) {
    return SaveEquipmentProvider(
      equipment,
      overrideName: overrideName,
    );
  }

  @override
  SaveEquipmentProvider getProviderOverride(
    covariant SaveEquipmentProvider provider,
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
  String? get name => r'saveEquipmentProvider';
}

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipment].
class SaveEquipmentProvider extends AutoDisposeProvider<AsyncValue<void>> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipment].
  SaveEquipmentProvider(
    Equipment equipment, {
    String? overrideName,
  }) : this._internal(
          (ref) => saveEquipment(
            ref as SaveEquipmentRef,
            equipment,
            overrideName: overrideName,
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
  }) : super.internal();

  final Equipment equipment;
  final String? overrideName;

  @override
  Override overrideWith(
    AsyncValue<void> Function(SaveEquipmentRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveEquipmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentProvider &&
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

mixin SaveEquipmentRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _SaveEquipmentProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>> with SaveEquipmentRef {
  _SaveEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as SaveEquipmentProvider).equipment;
  @override
  String? get overrideName => (origin as SaveEquipmentProvider).overrideName;
}

String _$savedEquipmentsHash() => r'07c737a4e45444ae43c789a36be7caf450add31d';

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.
///
/// Copied from [savedEquipments].
@ProviderFor(savedEquipments)
final savedEquipmentsProvider = Provider<AsyncValue<List<Equipment>>>.internal(
  savedEquipments,
  name: r'savedEquipmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedEquipmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedEquipmentsRef = ProviderRef<AsyncValue<List<Equipment>>>;
String _$showEquipmentDebugHash() =>
    r'a4130310d497a5d7a8b6cc65d8d843968f668d28';

/// Whether or not to show the equipment debugging features.
///
/// Copied from [ShowEquipmentDebug].
@ProviderFor(ShowEquipmentDebug)
final showEquipmentDebugProvider =
    NotifierProvider<ShowEquipmentDebug, bool>.internal(
  ShowEquipmentDebug.new,
  name: r'showEquipmentDebugProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showEquipmentDebugHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowEquipmentDebug = Notifier<bool>;
String _$allEquipmentsHash() => r'a6940a2eb2dde3c4cba38ebfa57a7c29acd2ac1c';

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
String _$equipmentHoveredHash() => r'cbf31e925f9878e4ac78df491aad05d3bdb45961';

/// Whether or not a cursor is hovering over an equipment section.
///
/// Copied from [EquipmentHovered].
@ProviderFor(EquipmentHovered)
final equipmentHoveredProvider =
    NotifierProvider<EquipmentHovered, bool>.internal(
  EquipmentHovered.new,
  name: r'equipmentHoveredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentHoveredHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentHovered = Notifier<bool>;
String _$equipmentPathsHash() => r'3d786a2d2f9552aca6de0849562eec0e9d07b5ac';

abstract class _$EquipmentPaths
    extends BuildlessAutoDisposeNotifier<List<Map<int, List<Geographic>?>>> {
  late final String uuid;

  List<Map<int, List<Geographic>?>> build(
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
class EquipmentPathsFamily extends Family<List<Map<int, List<Geographic>?>>> {
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
class EquipmentPathsProvider extends AutoDisposeNotifierProviderImpl<
    EquipmentPaths, List<Map<int, List<Geographic>?>>> {
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
  List<Map<int, List<Geographic>?>> runNotifierBuild(
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
  AutoDisposeNotifierProviderElement<EquipmentPaths,
      List<Map<int, List<Geographic>?>>> createElement() {
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

mixin EquipmentPathsRef
    on AutoDisposeNotifierProviderRef<List<Map<int, List<Geographic>?>>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _EquipmentPathsProviderElement extends AutoDisposeNotifierProviderElement<
    EquipmentPaths, List<Map<int, List<Geographic>?>>> with EquipmentPathsRef {
  _EquipmentPathsProviderElement(super.provider);

  @override
  String get uuid => (origin as EquipmentPathsProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
