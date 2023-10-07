// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_serial_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableSerialPortsHash() =>
    r'c8572cd86484a91be1ff9fd0fa5efe702e911172';

/// A provider for the available serial ports.
///
/// Copied from [availableSerialPorts].
@ProviderFor(availableSerialPorts)
final availableSerialPortsProvider =
    AutoDisposeProvider<List<SerialPort>>.internal(
  availableSerialPorts,
  name: r'availableSerialPortsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSerialPortsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AvailableSerialPortsRef = AutoDisposeProviderRef<List<SerialPort>>;
String _$gnssSerialStreamHash() => r'80e7db702f4c39dcbb5035694561cf7d63bf4c8b';

/// A stream of the incoming serial data from the GNSS serial hardware.
///
/// Copied from [gnssSerialStream].
@ProviderFor(gnssSerialStream)
final gnssSerialStreamProvider = StreamProvider<String?>.internal(
  gnssSerialStream,
  name: r'gnssSerialStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssSerialStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GnssSerialStreamRef = StreamProviderRef<String?>;
String _$gnssSerialBaudRateHash() =>
    r'874f5cd83ebbf42df330fa4cf34af78bf81f1da0';

/// A provider for the baud rate for the [GnssSerial] connection.
///
/// Copied from [GnssSerialBaudRate].
@ProviderFor(GnssSerialBaudRate)
final gnssSerialBaudRateProvider =
    NotifierProvider<GnssSerialBaudRate, int>.internal(
  GnssSerialBaudRate.new,
  name: r'gnssSerialBaudRateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssSerialBaudRateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssSerialBaudRate = Notifier<int>;
String _$gnssSerialHash() => r'ba0b75419240ed5a38928494bd65d37b313bf034';

/// A provider for which port [GnssSerial] should use.
///
/// Copied from [GnssSerial].
@ProviderFor(GnssSerial)
final gnssSerialProvider = NotifierProvider<GnssSerial, SerialPort?>.internal(
  GnssSerial.new,
  name: r'gnssSerialProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gnssSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssSerial = Notifier<SerialPort?>;
String _$gnssSerialAliveHash() => r'10ac9f379261eeb959aae92d3462a7934911fec1';

/// A provider for telling whether the [GnssSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
///
/// Copied from [GnssSerialAlive].
@ProviderFor(GnssSerialAlive)
final gnssSerialAliveProvider =
    NotifierProvider<GnssSerialAlive, bool>.internal(
  GnssSerialAlive.new,
  name: r'gnssSerialAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gnssSerialAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GnssSerialAlive = Notifier<bool>;
String _$gnssSerialFrequencyHash() =>
    r'39c0bd1c19ac921f6d37916849ee4871efe7faf4';

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

abstract class _$GnssSerialFrequency
    extends BuildlessAutoDisposeNotifier<double?> {
  late final int count;

  double? build({
    int count = 20,
  });
}

/// A provider for the current frequency of GNSS updates over serial.
///
/// Copied from [GnssSerialFrequency].
@ProviderFor(GnssSerialFrequency)
const gnssSerialFrequencyProvider = GnssSerialFrequencyFamily();

/// A provider for the current frequency of GNSS updates over serial.
///
/// Copied from [GnssSerialFrequency].
class GnssSerialFrequencyFamily extends Family<double?> {
  /// A provider for the current frequency of GNSS updates over serial.
  ///
  /// Copied from [GnssSerialFrequency].
  const GnssSerialFrequencyFamily();

  /// A provider for the current frequency of GNSS updates over serial.
  ///
  /// Copied from [GnssSerialFrequency].
  GnssSerialFrequencyProvider call({
    int count = 20,
  }) {
    return GnssSerialFrequencyProvider(
      count: count,
    );
  }

  @visibleForOverriding
  @override
  GnssSerialFrequencyProvider getProviderOverride(
    covariant GnssSerialFrequencyProvider provider,
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
  String? get name => r'gnssSerialFrequencyProvider';
}

/// A provider for the current frequency of GNSS updates over serial.
///
/// Copied from [GnssSerialFrequency].
class GnssSerialFrequencyProvider
    extends AutoDisposeNotifierProviderImpl<GnssSerialFrequency, double?> {
  /// A provider for the current frequency of GNSS updates over serial.
  ///
  /// Copied from [GnssSerialFrequency].
  GnssSerialFrequencyProvider({
    int count = 20,
  }) : this._internal(
          () => GnssSerialFrequency()..count = count,
          from: gnssSerialFrequencyProvider,
          name: r'gnssSerialFrequencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gnssSerialFrequencyHash,
          dependencies: GnssSerialFrequencyFamily._dependencies,
          allTransitiveDependencies:
              GnssSerialFrequencyFamily._allTransitiveDependencies,
          count: count,
        );

  GnssSerialFrequencyProvider._internal(
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
    covariant GnssSerialFrequency notifier,
  ) {
    return notifier.build(
      count: count,
    );
  }

  @override
  Override overrideWith(GnssSerialFrequency Function() create) {
    return ProviderOverride(
      origin: this,
      override: GnssSerialFrequencyProvider._internal(
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
  AutoDisposeNotifierProviderElement<GnssSerialFrequency, double?>
      createElement() {
    return _GnssSerialFrequencyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GnssSerialFrequencyProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GnssSerialFrequencyRef on AutoDisposeNotifierProviderRef<double?> {
  /// The parameter `count` of this provider.
  int get count;
}

class _GnssSerialFrequencyProviderElement
    extends AutoDisposeNotifierProviderElement<GnssSerialFrequency, double?>
    with GnssSerialFrequencyRef {
  _GnssSerialFrequencyProviderElement(super.provider);

  @override
  int get count => (origin as GnssSerialFrequencyProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
