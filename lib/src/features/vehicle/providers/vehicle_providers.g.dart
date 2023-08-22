// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveVehicleHash() => r'3d46a3daa803c51050290e7d5b6ff8819980b1fe';

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

typedef SaveVehicleRef = AutoDisposeFutureProviderRef<void>;

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Copied from [saveVehicle].
@ProviderFor(saveVehicle)
const saveVehicleProvider = SaveVehicleFamily();

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Copied from [saveVehicle].
class SaveVehicleFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Copied from [saveVehicle].
  const SaveVehicleFamily();

  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Copied from [saveVehicle].
  SaveVehicleProvider call(
    Vehicle vehicle,
  ) {
    return SaveVehicleProvider(
      vehicle,
    );
  }

  @override
  SaveVehicleProvider getProviderOverride(
    covariant SaveVehicleProvider provider,
  ) {
    return call(
      provider.vehicle,
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
/// Copied from [saveVehicle].
class SaveVehicleProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Copied from [saveVehicle].
  SaveVehicleProvider(
    this.vehicle,
  ) : super.internal(
          (ref) => saveVehicle(
            ref,
            vehicle,
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
        );

  final Vehicle vehicle;

  @override
  bool operator ==(Object other) {
    return other is SaveVehicleProvider && other.vehicle == vehicle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicle.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$savedVehiclesHash() => r'1ef9b53975a6e354c3b95c6bf0fec9ae203f7ac6';

/// A provider for reading and holding all the saved vehicles in the
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
String _$loadVehicleFromFileHash() =>
    r'c0fbeb362d82690b35e0b1a891ff6a8cf62848ba';
typedef LoadVehicleFromFileRef = AutoDisposeFutureProviderRef<Vehicle?>;

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
    this.path,
  ) : super.internal(
          (ref) => loadVehicleFromFile(
            ref,
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
        );

  final String path;

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

String _$lastUsedVehicleHash() => r'3d62a3873e68a5e9ae6935a079aa5bdadca6b8d4';

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
String _$mainVehicleHash() => r'f058220065edb410ef53ba556dda9569de6c0b6b';

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
String _$autoSteerEnabledHash() => r'491f89abd6aa83fa8ef8a6fb8c79430e99631e54';

/// A provider for whether the vehicle should steer automatically.
///
/// Copied from [AutoSteerEnabled].
@ProviderFor(AutoSteerEnabled)
final autoSteerEnabledProvider =
    NotifierProvider<AutoSteerEnabled, bool>.internal(
  AutoSteerEnabled.new,
  name: r'autoSteerEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoSteerEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AutoSteerEnabled = Notifier<bool>;
String _$useIMUBearingHash() => r'7011a616009be1e5664d6bd7c0560bfe1e27593d';

/// A provider for whether the vehicle's bearing is set by the IMU input.
///
/// Copied from [UseIMUBearing].
@ProviderFor(UseIMUBearing)
final useIMUBearingProvider = NotifierProvider<UseIMUBearing, bool>.internal(
  UseIMUBearing.new,
  name: r'useIMUBearingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$useIMUBearingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UseIMUBearing = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
