import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_configurator_providers.g.dart';

/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.
@Riverpod(keepAlive: true)
class VehicleConfiguratorIndex extends _$VehicleConfiguratorIndex {
  @override
  int build() => 0;

  /// Updates the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Increase [state] by 1.
  void increase() => update(state + 1);

  /// Decrease [state] by 1.
  void decrease() => update(state - 1);
}

/// A provider for creating a [PageController] for using throughout the
/// [VehicleConfigurator].
@riverpod
class VehicleConfiguratorPageController
    extends _$VehicleConfiguratorPageController {
  static const _animationDuration = Duration(milliseconds: 250);
  static const _animationCurve = Curves.slowMiddle;

  @override
  Raw<PageController> build() {
    final controller = PageController(
      initialPage: ref.read(vehicleConfiguratorIndexProvider),
    )..addListener(() {
        ref
            .read(vehicleConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round());
      });
    return controller;
  }

  /// Animates to the [index] page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> animateToPage(int index) => state
      .animateToPage(
        index,
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(vehicleConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );

  /// Animates to the next page with [_animationDuration] and [_animationCurve].
  Future<void> nextPage() => state
      .nextPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(vehicleConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );

  /// Animates to the previous page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> previousPage() => state
      .previousPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(vehicleConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );
}

/// A provider for the vehicle from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredVehicle extends _$ConfiguredVehicle {
  @override
  Vehicle build() => ref.read(mainVehicleProvider);

  /// Update the [state] to [vehicle].
  void update(Vehicle vehicle) => Future(() => state = vehicle);

  /// Updates the vehicle's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));
}

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.
@Riverpod(keepAlive: true)
class ConfiguredVehicleNameTextController
    extends _$ConfiguredVehicleNameTextController {
  @override
  Raw<TextEditingController> build() {
    final controller = TextEditingController(
      text: ref.read(configuredVehicleProvider.select((value) => value.name)),
    );

    controller.addListener(() {
      ref.read(configuredVehicleProvider.notifier).updateName(controller.text);
    });

    return controller;
  }
}

/// A provider for loading a vehicle configuration from the user file directory
/// and applying it to the [ConfiguredVehicle] provider.
@riverpod
AsyncValue<Vehicle?> loadFileConfiguredVehicle(
  LoadFileConfiguredVehicleRef ref,
) {
  FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    dialogTitle: 'Choose vehicle file',
    initialDirectory: [
      ref.watch(fileDirectoryProvider).requireValue.path,
      '/vehicles',
    ].join(),
  ).then((pickedFiles) {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      return ref.watch(loadVehicleFromFileProvider(filePath)).when(
            data: (data) {
              if (data != null) {
                ref.read(configuredVehicleProvider.notifier).update(data);
                ref.invalidate(configuredVehicleNameTextControllerProvider);
                return AsyncData(data);
              }
              return const AsyncData(null);
            },
            error: (error, stackTrace) => AsyncError.new,
            loading: () => AsyncLoading.new,
          );
    }

    return const AsyncData(null);
  });
  return const AsyncLoading();
}
