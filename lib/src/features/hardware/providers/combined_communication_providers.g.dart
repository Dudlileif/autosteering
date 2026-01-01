// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_communication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for combining the native network providers that need to be
/// watched.

@ProviderFor(_combinedNativeNetwork)
final _combinedNativeNetworkProvider = _CombinedNativeNetworkProvider._();

/// A provider for combining the native network providers that need to be
/// watched.

final class _CombinedNativeNetworkProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for combining the native network providers that need to be
  /// watched.
  _CombinedNativeNetworkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_combinedNativeNetworkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_combinedNativeNetworkHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return _combinedNativeNetwork(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$_combinedNativeNetworkHash() =>
    r'bcb3ac5ff347c9c6946613c487bd5ee05121c5ae';

/// A provider for combining the serial providers that need to be watched.

@ProviderFor(_combinedSerial)
final _combinedSerialProvider = _CombinedSerialProvider._();

/// A provider for combining the serial providers that need to be watched.

final class _CombinedSerialProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for combining the serial providers that need to be watched.
  _CombinedSerialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_combinedSerialProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_combinedSerialHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return _combinedSerial(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$_combinedSerialHash() => r'6ec5620fc4b903429782dd75665f56b4584cac2c';

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.

@ProviderFor(combinedCommunication)
final combinedCommunicationProvider = CombinedCommunicationProvider._();

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.

final class CombinedCommunicationProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for combining all the network and hardware communication
  /// providers that need to be watched.
  CombinedCommunicationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'combinedCommunicationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$combinedCommunicationHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return combinedCommunication(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$combinedCommunicationHash() =>
    r'3674c86e1684f5a867aa5868875ecc87dae318fc';

/// A provider for whether any hardware is connected and communicating with
/// us.

@ProviderFor(hardwareAlive)
final hardwareAliveProvider = HardwareAliveProvider._();

/// A provider for whether any hardware is connected and communicating with
/// us.

final class HardwareAliveProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// A provider for whether any hardware is connected and communicating with
  /// us.
  HardwareAliveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardwareAliveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardwareAliveHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hardwareAlive(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hardwareAliveHash() => r'50658d49b282388b8f604df97b9aeedf910341f7';
