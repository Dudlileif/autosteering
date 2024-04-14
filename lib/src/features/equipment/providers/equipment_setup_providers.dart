// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

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
FutureOr<void> saveEquipmentSetup(
  SaveEquipmentSetupRef ref,
  EquipmentSetup setup, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      saveJsonToFileDirectoryProvider(
        object: setup,
        fileName: overrideName ?? setup.name,
        folder: 'equipment/setups',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportEquipmentSetup(
  ExportEquipmentSetupRef ref,
  EquipmentSetup setup, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: setup,
        fileName: overrideName ?? setup.name,
        folder: 'equipment/setups',
        downloadIfWeb: downloadIfWeb,
      ).future,
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

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deleteEquipmentSetup(
  DeleteEquipmentSetupRef ref,
  EquipmentSetup setup, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ?? setup.name,
        folder: 'equipment/setups',
      ).future,
    );

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.
@riverpod
FutureOr<EquipmentSetup?> loadEquipmentSetupFromFile(
  LoadEquipmentSetupFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    final json = jsonDecode(await file.readAsString());
    if (json is Map) {
      return EquipmentSetup.fromJson(Map<String, dynamic>.from(json));
    }
  }
  return null;
}

/// A provider for importing a equipment setup configuration from the user file
/// directory and applying it to the [ConfiguredEquipmentSetup] provider.
@riverpod
FutureOr<EquipmentSetup?> importEquipmentSetup(
  ImportEquipmentSetupRef ref,
) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose equipment setup file',
  );

  EquipmentSetup? equipmentSetup;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      final json = jsonDecode(String.fromCharCodes(data));
      if (json is Map) {
        equipmentSetup =
            EquipmentSetup.fromJson(Map<String, dynamic>.from(json));
      }
      Logger.instance.w(
        'Failed to import equipment setup, data is not a valid json map.',
      );
    } else {
      Logger.instance.w(
        'Failed to import equipment setup, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      equipmentSetup =
          await ref.watch(loadEquipmentSetupFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import equipment setup: $filePath.');
    }
  }
  if (equipmentSetup != null) {
    Logger.instance.i(
      'Imported equipment setup: ${equipmentSetup.name}.',
    );
    equipmentSetup.lastUsed = DateTime.now();
    ref.read(configuredEquipmentSetupProvider.notifier).update(equipmentSetup);
    await ref.watch(saveEquipmentSetupProvider(equipmentSetup).future);
  }

  return equipmentSetup;
}
