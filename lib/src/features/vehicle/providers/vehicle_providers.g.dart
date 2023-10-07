// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveVehicleHash() => r'6d304997a173080a3f603e628a34ddea27a4b59b';

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
  }) {
    return SaveVehicleProvider(
      vehicle,
      overrideName: overrideName,
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
class SaveVehicleProvider extends AutoDisposeProvider<AsyncValue<void>> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveVehicle].
  SaveVehicleProvider(
    Vehicle vehicle, {
    String? overrideName,
  }) : this._internal(
          (ref) => saveVehicle(
            ref as SaveVehicleRef,
            vehicle,
            overrideName: overrideName,
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
  }) : super.internal();

  final Vehicle vehicle;
  final String? overrideName;

  @override
  Override overrideWith(
    AsyncValue<void> Function(SaveVehicleRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveVehicleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveVehicleProvider &&
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

mixin SaveVehicleRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `vehicle` of this provider.
  Vehicle get vehicle;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _SaveVehicleProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>> with SaveVehicleRef {
  _SaveVehicleProviderElement(super.provider);

  @override
  Vehicle get vehicle => (origin as SaveVehicleProvider).vehicle;
  @override
  String? get overrideName => (origin as SaveVehicleProvider).overrideName;
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

  @visibleForOverriding
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
String _$autoSteerEnabledHash() => r'3825c9c26ad90ae171f028e130ee99ac03c94f61';

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
String _$imuSerialFrequencyHash() =>
    r'3bed921ac11f6dd6d1f76a9424c244b95fcbc6f0';

abstract class _$ImuSerialFrequency
    extends BuildlessAutoDisposeNotifier<double?> {
  late final int count;

  double? build({
    int count = 20,
  });
}

/// A provider for the current frequency of IMU updates over serial.
///
/// Copied from [ImuSerialFrequency].
@ProviderFor(ImuSerialFrequency)
const imuSerialFrequencyProvider = ImuSerialFrequencyFamily();

/// A provider for the current frequency of IMU updates over serial.
///
/// Copied from [ImuSerialFrequency].
class ImuSerialFrequencyFamily extends Family<double?> {
  /// A provider for the current frequency of IMU updates over serial.
  ///
  /// Copied from [ImuSerialFrequency].
  const ImuSerialFrequencyFamily();

  /// A provider for the current frequency of IMU updates over serial.
  ///
  /// Copied from [ImuSerialFrequency].
  ImuSerialFrequencyProvider call({
    int count = 20,
  }) {
    return ImuSerialFrequencyProvider(
      count: count,
    );
  }

  @visibleForOverriding
  @override
  ImuSerialFrequencyProvider getProviderOverride(
    covariant ImuSerialFrequencyProvider provider,
  ) {
    return call(
      count: provider.count,
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
  String? get name => r'imuSerialFrequencyProvider';
}

/// A provider for the current frequency of IMU updates over serial.
///
/// Copied from [ImuSerialFrequency].
class ImuSerialFrequencyProvider
    extends AutoDisposeNotifierProviderImpl<ImuSerialFrequency, double?> {
  /// A provider for the current frequency of IMU updates over serial.
  ///
  /// Copied from [ImuSerialFrequency].
  ImuSerialFrequencyProvider({
    int count = 20,
  }) : this._internal(
          () => ImuSerialFrequency()..count = count,
          from: imuSerialFrequencyProvider,
          name: r'imuSerialFrequencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imuSerialFrequencyHash,
          dependencies: ImuSerialFrequencyFamily._dependencies,
          allTransitiveDependencies:
              ImuSerialFrequencyFamily._allTransitiveDependencies,
          count: count,
        );

  ImuSerialFrequencyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  double? runNotifierBuild(
    covariant ImuSerialFrequency notifier,
  ) {
    return notifier.build(
      count: count,
    );
  }

  @override
  Override overrideWith(ImuSerialFrequency Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImuSerialFrequencyProvider._internal(
        () => create()..count = count,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ImuSerialFrequency, double?>
      createElement() {
    return _ImuSerialFrequencyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImuSerialFrequencyProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ImuSerialFrequencyRef on AutoDisposeNotifierProviderRef<double?> {
  /// The parameter `count` of this provider.
  int get count;
}

class _ImuSerialFrequencyProviderElement
    extends AutoDisposeNotifierProviderElement<ImuSerialFrequency, double?>
    with ImuSerialFrequencyRef {
  _ImuSerialFrequencyProviderElement(super.provider);

  @override
  int get count => (origin as ImuSerialFrequencyProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
