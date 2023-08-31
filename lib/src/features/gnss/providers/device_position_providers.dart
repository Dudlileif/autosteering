import 'dart:developer';

import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:geobase/geobase.dart' show Geographic;
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_position_providers.g.dart';

/// A provider for the position stream for the device.
@riverpod
Stream<Position> devicePositionStream(DevicePositionStreamRef ref) =>
    Geolocator.getPositionStream();

/// A provider for the position of the device.
@riverpod
FutureOr<Geographic?> devicePosition(DevicePositionRef ref) async {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != null &&
            ref.watch(devicePositionAsVehiclePositionProvider)) {
          ref.read(simInputProvider.notifier).send((position: data));
        }
      },
      error: (error, stackTrace) => log(error.toString()),
      loading: () => null,
    );
  });

  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    final settingsOpen = await Geolocator.openLocationSettings();
    if (settingsOpen) {
      ref.invalidateSelf();
    }
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    final settingsOpen = await Geolocator.openAppSettings();
    if (settingsOpen) {
      ref.invalidateSelf();
    }
    return Future.error(
      '''Location permissions are permanently denied, we cannot request permissions.''',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  return ref.watch(devicePositionStreamProvider).when(
        data: (data) {
          return Geographic(lon: data.longitude, lat: data.latitude);
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
}

/// A provider for whether the device's position should be used for the vehicle.
@Riverpod(keepAlive: true)
class DevicePositionAsVehiclePosition
    extends _$DevicePositionAsVehiclePosition {
  @override
  bool build() => false;

  /// Updates the [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}
