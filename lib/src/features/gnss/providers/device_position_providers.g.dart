// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_position_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the position of the device.

@ProviderFor(devicePositionPermission)
const devicePositionPermissionProvider = DevicePositionPermissionProvider._();

/// A provider for the position of the device.

final class DevicePositionPermissionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// A provider for the position of the device.
  const DevicePositionPermissionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicePositionPermissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicePositionPermissionHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return devicePositionPermission(ref);
  }
}

String _$devicePositionPermissionHash() =>
    r'c2d3b5acc7a4414168237e0443c43736f16a4e9e';

/// A provider for whether the device's position should be used for the vehicle.

@ProviderFor(DevicePositionAsVehiclePosition)
const devicePositionAsVehiclePositionProvider =
    DevicePositionAsVehiclePositionProvider._();

/// A provider for whether the device's position should be used for the vehicle.
final class DevicePositionAsVehiclePositionProvider
    extends $NotifierProvider<DevicePositionAsVehiclePosition, bool> {
  /// A provider for whether the device's position should be used for the vehicle.
  const DevicePositionAsVehiclePositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicePositionAsVehiclePositionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicePositionAsVehiclePositionHash();

  @$internal
  @override
  DevicePositionAsVehiclePosition create() => DevicePositionAsVehiclePosition();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$devicePositionAsVehiclePositionHash() =>
    r'e3451b702e226ec7e1546e0560ebe5ed9c4f720f';

/// A provider for whether the device's position should be used for the vehicle.

abstract class _$DevicePositionAsVehiclePosition extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the raw position stream from the device.

@ProviderFor(rawDevicePositionStream)
const rawDevicePositionStreamProvider = RawDevicePositionStreamProvider._();

/// A provider for the raw position stream from the device.

final class RawDevicePositionStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Position>, Position, Stream<Position>>
    with $FutureModifier<Position>, $StreamProvider<Position> {
  /// A provider for the raw position stream from the device.
  const RawDevicePositionStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawDevicePositionStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawDevicePositionStreamHash();

  @$internal
  @override
  $StreamProviderElement<Position> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Position> create(Ref ref) {
    return rawDevicePositionStream(ref);
  }
}

String _$rawDevicePositionStreamHash() =>
    r'0de5b1ba8d764378d5f523415109b5717191164d';

/// A provider that sends device position updates to the simulation core
/// if [DevicePositionAsVehiclePosition] and [devicePositionPermission] allow
/// it.

@ProviderFor(updatePositionFromDevice)
const updatePositionFromDeviceProvider = UpdatePositionFromDeviceProvider._();

/// A provider that sends device position updates to the simulation core
/// if [DevicePositionAsVehiclePosition] and [devicePositionPermission] allow
/// it.

final class UpdatePositionFromDeviceProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider that sends device position updates to the simulation core
  /// if [DevicePositionAsVehiclePosition] and [devicePositionPermission] allow
  /// it.
  const UpdatePositionFromDeviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePositionFromDeviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePositionFromDeviceHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return updatePositionFromDevice(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$updatePositionFromDeviceHash() =>
    r'2b91e5346ffc93502f3d7185171e8bf00b44866a';
