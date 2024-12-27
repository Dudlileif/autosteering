// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_position_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$devicePositionPermissionHash() =>
    r'c2d3b5acc7a4414168237e0443c43736f16a4e9e';

/// A provider for the position of the device.
///
/// Copied from [devicePositionPermission].
@ProviderFor(devicePositionPermission)
final devicePositionPermissionProvider =
    AutoDisposeFutureProvider<bool>.internal(
  devicePositionPermission,
  name: r'devicePositionPermissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$devicePositionPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DevicePositionPermissionRef = AutoDisposeFutureProviderRef<bool>;
String _$rawDevicePositionStreamHash() =>
    r'0de5b1ba8d764378d5f523415109b5717191164d';

/// A provider for the raw position stream from the device.
///
/// Copied from [rawDevicePositionStream].
@ProviderFor(rawDevicePositionStream)
final rawDevicePositionStreamProvider =
    AutoDisposeStreamProvider<Position>.internal(
  rawDevicePositionStream,
  name: r'rawDevicePositionStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rawDevicePositionStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RawDevicePositionStreamRef = AutoDisposeStreamProviderRef<Position>;
String _$updatePositionFromDeviceHash() =>
    r'a40fc236d4bb3a012b051fcc3731888b4632173e';

/// A provider that sends device position updates to the simulation core
/// if [DevicePositionAsVehiclePosition] and [devicePositionPermission] allow
/// it.
///
/// Copied from [updatePositionFromDevice].
@ProviderFor(updatePositionFromDevice)
final updatePositionFromDeviceProvider = AutoDisposeProvider<void>.internal(
  updatePositionFromDevice,
  name: r'updatePositionFromDeviceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updatePositionFromDeviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdatePositionFromDeviceRef = AutoDisposeProviderRef<void>;
String _$devicePositionAsVehiclePositionHash() =>
    r'e3451b702e226ec7e1546e0560ebe5ed9c4f720f';

/// A provider for whether the device's position should be used for the vehicle.
///
/// Copied from [DevicePositionAsVehiclePosition].
@ProviderFor(DevicePositionAsVehiclePosition)
final devicePositionAsVehiclePositionProvider =
    NotifierProvider<DevicePositionAsVehiclePosition, bool>.internal(
  DevicePositionAsVehiclePosition.new,
  name: r'devicePositionAsVehiclePositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$devicePositionAsVehiclePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DevicePositionAsVehiclePosition = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
