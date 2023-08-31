import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_configurator_providers.g.dart';

/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.
@Riverpod(keepAlive: true)
class EquipmentConfiguratorIndex extends _$EquipmentConfiguratorIndex {
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
/// [EquipmentConfigurator].
@riverpod
class EquipmentConfiguratorPageController
    extends _$EquipmentConfiguratorPageController {
  static const _animationDuration = Duration(milliseconds: 250);
  static const _animationCurve = Curves.slowMiddle;

  @override
  Raw<PageController> build() {
    final controller = PageController(
      initialPage: ref.read(equipmentConfiguratorIndexProvider),
    )..addListener(() {
        ref
            .read(equipmentConfiguratorIndexProvider.notifier)
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
            .read(equipmentConfiguratorIndexProvider.notifier)
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
            .read(equipmentConfiguratorIndexProvider.notifier)
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
            .read(equipmentConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );
}

/// A provider for the vehicle from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredEquipment extends _$ConfiguredEquipment {
  @override
  Equipment build() {
    ref.listenSelf((previous, next) {
      ref.read(allEquipmentsProvider.notifier).update(next);
    });
    return Equipment(hitchType: HitchType.fixed);
  }

  /// Update the [state] to [equipment].
  void update(Equipment equipment) => Future(() => state = equipment);

  /// Updates the vehicle's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));
}

/// A provider for the [TextEditingController] for the name in the
/// equipment configurator.
@Riverpod(keepAlive: true)
class ConfiguredEquipmentNameTextController
    extends _$ConfiguredEquipmentNameTextController {
  @override
  Raw<TextEditingController> build() {
    final controller = TextEditingController(
      text: ref.read(configuredEquipmentProvider.select((value) => value.name)),
    );

    controller.addListener(() {
      ref
          .read(configuredEquipmentProvider.notifier)
          .updateName(controller.text);
    });

    return controller;
  }
}

/// A provider for loading a vehicle configuration from the user file directory
/// and applying it to the [ConfiguredEquipment] provider.
@riverpod
AsyncValue<Equipment?> loadFileConfiguredEquipment(
  LoadFileConfiguredEquipmentRef ref,
) {
  FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose equipment file',
    initialDirectory: Device.isWeb
        ? null
        : [
            ref.watch(fileDirectoryProvider).requireValue.path,
            '/equipment',
          ].join(),
  ).then((pickedFiles) {
    if (Device.isWeb) {
      final data = pickedFiles?.files.first.bytes;
      if (data != null) {
        final json = jsonDecode(String.fromCharCodes(data));
        if (json is Map) {
          final equipment = Equipment.fromJson(Map<String, dynamic>.from(json));
          ref.read(configuredEquipmentProvider.notifier).update(equipment);
          ref.invalidate(configuredEquipmentNameTextControllerProvider);
          return AsyncData(equipment);
        }
      }
    } else {
      final filePath = pickedFiles?.paths.first;
      if (filePath != null) {
        return ref.watch(loadEquipmentFromFileProvider(filePath)).when(
              data: (data) {
                if (data != null) {
                  ref.read(configuredEquipmentProvider.notifier).update(data);
                  ref.invalidate(configuredEquipmentNameTextControllerProvider);
                  return AsyncData(data);
                }
                return const AsyncData(null);
              },
              error: (error, stackTrace) => AsyncError.new,
              loading: () => AsyncLoading.new,
            );
      }

      return const AsyncData(null);
    }
  });
  return const AsyncLoading();
}
