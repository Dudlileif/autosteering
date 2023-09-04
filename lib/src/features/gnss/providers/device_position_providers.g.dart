// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_position_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$devicePositionStreamHash() =>
    r'd3e3ab06752f0c602fd261bf29f91ea151d9919a';

/// A provider for the position stream for the device.
///
/// Copied from [devicePositionStream].
@ProviderFor(devicePositionStream)
final devicePositionStreamProvider =
    AutoDisposeStreamProvider<Position>.internal(
  devicePositionStream,
  name: r'devicePositionStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$devicePositionStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DevicePositionStreamRef = AutoDisposeStreamProviderRef<Position>;
String _$devicePositionHash() => r'd2fa19a5d9175ae8cad335f0d06dbfd199260dd2';

/// A provider for the position of the device.
///
/// Copied from [devicePosition].
@ProviderFor(devicePosition)
final devicePositionProvider = AutoDisposeFutureProvider<Geographic?>.internal(
  devicePosition,
  name: r'devicePositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$devicePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DevicePositionRef = AutoDisposeFutureProviderRef<Geographic?>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
