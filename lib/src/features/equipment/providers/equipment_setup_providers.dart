import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_setup_providers.g.dart';

/// A provider or holding the configured/loaded [EquipmentSetup] in memory.
@Riverpod(keepAlive: true)
class ConfiguredEquipmentSetup extends _$ConfiguredEquipmentSetup {
  @override
  EquipmentSetup? build() => null;

  /// Updates the [state] to [value].
  void update(EquipmentSetup? value) => Future(() => state = value);
}

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
AsyncValue<void> saveEquipmentSetup(
  SaveEquipmentSetupRef ref,
  EquipmentSetup setup, {
  String? overrideName,
}) =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: setup,
        fileName: overrideName ?? setup.name,
        folder: 'equipment/setups',
      ),
    );

/// A provider for reading and holding all the saved [EquipmentSetup]s in the
/// user file directory.
@Riverpod(keepAlive: true)
AsyncValue<List<EquipmentSetup>> savedEquipmentSetups(
  SavedEquipmentSetupsRef ref,
) =>
    ref
        .watch(
          savedFilesProvider(
            fromJson: EquipmentSetup.fromJson,
            folder: 'equipment/setups',
          ),
        )
        .whenData((data) => data.cast());
