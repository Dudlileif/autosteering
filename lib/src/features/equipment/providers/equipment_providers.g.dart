// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$configuredEquipmentHash() =>
    r'd9e96b57256947544a92753e14bb00cf261795db';

/// A provider for a equipment that can be configured.
///
/// Copied from [ConfiguredEquipment].
@ProviderFor(ConfiguredEquipment)
final configuredEquipmentProvider =
    NotifierProvider<ConfiguredEquipment, Equipment>.internal(
  ConfiguredEquipment.new,
  name: r'configuredEquipmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipment = Notifier<Equipment>;
String _$allEquipmentsHash() => r'8659bdfdda0792d6f061297869cd94813cbba7f6';

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

/// Whether or not a cursor is hovering over an equipment segment.
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
String _$equipmentPathsHash() => r'ec5ad4a592e1e64e4c5c822bb5fb07b1d32f811c';

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
    this.uuid,
  ) : super.internal(
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
        );

  final String uuid;

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

  @override
  List<Map<int, List<Geographic>?>> runNotifierBuild(
    covariant EquipmentPaths notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
