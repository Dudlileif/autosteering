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
AsyncValue<EquipmentSetup?> importEquipmentSetup(
  ImportEquipmentSetupRef ref,
) {
  FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose equipment setup file',
  ).then((pickedFiles) {
    if (Device.isWeb) {
      final data = pickedFiles?.files.first.bytes;
      if (data != null) {
        final json = jsonDecode(String.fromCharCodes(data));
        if (json is Map) {
          final setup =
              EquipmentSetup.fromJson(Map<String, dynamic>.from(json));
          ref.read(configuredEquipmentSetupProvider.notifier).update(setup);
          ref.invalidate(configuredEquipmentNameTextControllerProvider);
          return AsyncData(setup);
        }
      }
    } else {
      final filePath = pickedFiles?.paths.first;
      if (filePath != null) {
        return ref.watch(loadEquipmentSetupFromFileProvider(filePath)).whenData(
          (data) {
            if (data != null) {
              ref.read(configuredEquipmentSetupProvider.notifier).update(data);
              return data;
            }
            return null;
          },
        );
      }

      return const AsyncData(null);
    }
  });
  return const AsyncLoading();
}
