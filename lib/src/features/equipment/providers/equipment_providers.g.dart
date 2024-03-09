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

String _$saveEquipmentHash() => r'334b2e5eea0212d284f05afd1df4da4904c6fe80';

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
  Override overrideWith(
      AsyncValue<void> Function(SaveEquipmentRef ref) create) {
    return _$SaveEquipmentFamilyOverride(this, create);
  }
}

class _$SaveEquipmentFamilyOverride implements FamilyOverride {
  _$SaveEquipmentFamilyOverride(this.overriddenFamily, this.create);

  final AsyncValue<void> Function(SaveEquipmentRef ref) create;

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
class SaveEquipmentProvider extends AutoDisposeProvider<AsyncValue<void>> {
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
    AsyncValue<void> Function(SaveEquipmentRef ref) create,
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
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveEquipmentProviderElement(this);
  }

  SaveEquipmentProvider _copyWith(
    AsyncValue<void> Function(SaveEquipmentRef ref) create,
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

mixin SaveEquipmentRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `equipment` of this provider.
  Equipment get equipment;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveEquipmentProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>> with SaveEquipmentRef {
  _SaveEquipmentProviderElement(super.provider);

  @override
  Equipment get equipment => (origin as SaveEquipmentProvider).equipment;
  @override
  String? get overrideName => (origin as SaveEquipmentProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveEquipmentProvider).downloadIfWeb;
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
String _$allEquipmentsHash() => r'032a9501fbef22d430589cd3162af47df7044a19';

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
String _$equipmentPathsHash() => r'c1f6b5e6dcb0c1173da8999f2fe65a59ffbdee34';

abstract class _$EquipmentPaths extends BuildlessAutoDisposeNotifier<
    List<Map<int, List<SectionEdgePositions>?>>> {
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
class EquipmentPathsProvider extends AutoDisposeNotifierProviderImpl<
    EquipmentPaths, List<Map<int, List<SectionEdgePositions>?>>> {
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
  AutoDisposeNotifierProviderElement<EquipmentPaths,
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

mixin EquipmentPathsRef on AutoDisposeNotifierProviderRef<
    List<Map<int, List<SectionEdgePositions>?>>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _EquipmentPathsProviderElement extends AutoDisposeNotifierProviderElement<
    EquipmentPaths,
    List<Map<int, List<SectionEdgePositions>?>>> with EquipmentPathsRef {
  _EquipmentPathsProviderElement(super.provider);

  @override
  String get uuid => (origin as EquipmentPathsProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
