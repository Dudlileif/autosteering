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

String _$saveEquipmentHash() => r'43b8d912559999938b43aab6f6e04d8d6e843a95';

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Copied from [saveEquipment].
@ProviderFor(saveEquipment)
const saveEquipmentProvider = SaveEquipmentFamily();

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Copied from [saveEquipment].
class SaveEquipmentFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Copied from [saveEquipment].
  const SaveEquipmentFamily();

  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Copied from [saveEquipment].
  SaveEquipmentProvider call(
    Equipment equipment,
  ) {
    return SaveEquipmentProvider(
      equipment,
    );
  }

  @override
  SaveEquipmentProvider getProviderOverride(
    covariant SaveEquipmentProvider provider,
  ) {
    return call(
      provider.equipment,
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
/// Copied from [saveEquipment].
class SaveEquipmentProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Copied from [saveEquipment].
  SaveEquipmentProvider(
    Equipment equipment,
  ) : this._internal(
          (ref) => saveEquipment(
            ref as SaveEquipmentRef,
            equipment,
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
        );

  SaveEquipmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.equipment,
  }) : super.internal();

  final Equipment equipment;

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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveEquipmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentProvider && other.equipment == equipment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, equipment.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveEquipmentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;
}

class _SaveEquipmentProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveEquipmentRef {
  _SaveEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as SaveEquipmentProvider).equipment;
}

String _$savedEquipmentsHash() => r'74435c13ee025fed36703983558786c957b5eb60';

/// A provider for reading and holding all the saved vehicles in the
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
String _$allEquipmentsHash() => r'4039e573bffde9ff4be9a3dac936bf2e052ab934';

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
String _$equipmentPathsHash() => r'3157984d64489bf4dcc5d00f938479e7f630d053';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
