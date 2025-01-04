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
import 'dart:collection';
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' show Storage, window;
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

part 'settings_providers.g.dart';

/// A provider for the main settings file for the application.
@Riverpod(keepAlive: true)
Future<File> settingsFile(Ref ref) async {
  final file = File(
    path.join(
      ref.watch(fileDirectoryProvider).requireValue.path,
      'settings.json',
    ),
  );

  if (file.existsSync()) {
    Logger.instance.i('Settings file found: ${file.path}');
    return file;
  }

  await file.create(recursive: true);
  Logger.instance.i('Settings file created: ${file.path}');
  return file;
}

/// A provider for the local storage data map for the web version of the
/// application.
@Riverpod(keepAlive: true)
Storage webLocalStorage(Ref ref) {
  Logger.instance.i('Loaded web window localStorage');
  return window.localStorage;
}

/// A provider for the settings map for the application.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  bool _saveToRemoveDeprecated = false;
  @override
  SplayTreeMap<String, dynamic> build() {
    listenSelf((previous, next) {
      if ((previous != null && previous != next) || _saveToRemoveDeprecated) {
        if (Device.isWeb) {
          ref.watch(webLocalStorageProvider)['settings'] = jsonEncode(next);
          Logger.instance.i('Saved settings to web localStorage.');
        } else {
          ref
              .watch(settingsFileProvider)
              .requireValue
              .writeAsString(
                const JsonEncoder.withIndent('    ').convert(next),
              )
              .then(
                (value) => Logger.instance.i('Saved settings to file.'),
              );
        }
      }
      _saveToRemoveDeprecated = false;
    });

    final fileString = switch (Device.isWeb) {
      true => ref.watch(webLocalStorageProvider)['settings'] ?? '',
      false => ref.watch(settingsFileProvider).requireValue.readAsStringSync(),
    };

    if (fileString.isEmpty) {
      Logger.instance.i('No previous settings found, creating new.');
      return SplayTreeMap<String, dynamic>();
    }

    final settings = Map<String, dynamic>.from(jsonDecode(fileString) as Map);
    Logger.instance.i('Loaded ${settings.length} settings from storage.');

    final settingsToRemove = <String>[];
    for (final setting in settings.keys) {
      if (!SettingsKey.values.map((key) => key.name).contains(setting)) {
        settingsToRemove.add(setting);
      }
    }
    if (settingsToRemove.isNotEmpty) {
      for (final setting in settingsToRemove) {
        settings.remove(setting);
      }
      _saveToRemoveDeprecated = true;
      Logger.instance.i(
        '''Removed ${settingsToRemove.length} deprecated settings: $settingsToRemove.''',
      );
    }

    return SplayTreeMap<String, dynamic>.from(settings);
  }

  /// Update the setting [key] to [value].
  void update(SettingsKey key, dynamic value, {bool force = false}) => Future(
        () {
          final oldValue = state[key.name];
          // Skip if value is not new.
          if (!force) {
            if (oldValue is Iterable) {
              if (const DeepCollectionEquality().equals(oldValue, value)) {
                return;
              }
            } else if (oldValue == value) {
              return;
            }
          }

          state = SplayTreeMap.from(state)
            ..update(
              key.name,
              (oldValue) => value,
              ifAbsent: () => value,
            );

          Logger.instance.i('Updated setting ${key.name}: $oldValue => $value');
        },
      );

  /// Sets [state] to [value].
  void set(SplayTreeMap<String, dynamic> value) => Future(() => state = value);

  /// Whether the settings contains a value for [key].
  bool containsKey(SettingsKey key) => state.containsKey(key.name);

  /// Get the value of type [bool] for the setting [key], if it exists.
  bool? getBool(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as bool? : null;

  /// Get the value of type [double] for the setting [key], if it exists.
  double? getDouble(SettingsKey key) => state.containsKey(key.name)
      ? (state[key.name] as num?)?.toDouble()
      : null;

  /// Get the value of type [int] for the setting [key], if it exists.
  int? getInt(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as int? : null;

  /// Get the value of type [String] for the setting [key], if it exists.
  String? getString(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as String? : null;

  /// Get the value of type [Map] for the setting [key], if it exists.
  Map<String, Object?>? getMap(SettingsKey key) =>
      state.containsKey(key.name) && state[key.name] is Map
          ? Map<String, Object?>.from(state[key.name] as Map)
          : null;

  /// Get the value of type [List] for the setting [key], if it exists.
  List<dynamic>? getList(SettingsKey key) =>
      state.containsKey(key.name) && state[key.name] is List
          ? List<dynamic>.from(state[key.name] as List)
          : null;

  @override
  bool updateShouldNotify(
    Map<String, dynamic> previous,
    Map<String, dynamic> next,
  ) {
    return const DeepCollectionEquality().equals(previous, next);
  }
}

/// A provider for whether the debug features and switches should be shown.
@Riverpod(keepAlive: true)
class EnableDebugMode extends _$EnableDebugMode {
  @override
  bool build() {
    return kDebugMode;
  }

  /// Update [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for exporting [Settings] to a file.
@riverpod
FutureOr<void> exportSettings(
  Ref ref, {
  String? overrideName,
  bool downloadIfWeb = true,
  bool removeSensitiveData = false,
}) async {
  final settings = ref.watch(settingsProvider);
  if (removeSensitiveData) {
    settings.removeWhere(
      (key, value) =>
          SettingsKey.canContainSensitiveData.map((e) => e.name).contains(key),
    );
  }
  await ref.watch(
    exportJsonToFileDirectoryProvider(
      object: settings,
      fileName: overrideName ?? 'settings',
      downloadIfWeb: downloadIfWeb,
    ).future,
  );
}

/// A provider for importing [Settings] from a file.
@riverpod
FutureOr<Map<String, dynamic>?> importSettings(Ref ref) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose settings file',
  );

  Map<String, dynamic>? settings;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        settings = Map<String, dynamic>.from(json as Map);
      } on Exception catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import settings.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import settings, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      final file = File(filePath);
      if (file.existsSync()) {
        try {
          final json = jsonDecode(await file.readAsString());
          settings = Map<String, dynamic>.from(json as Map);
        } on Exception catch (error, stackTrace) {
          Logger.instance.w(
            'Failed to load settings from: $filePath.',
            error: error,
            stackTrace: stackTrace,
          );
        }
      }
    } else {
      Logger.instance.w('Failed to import settings: $filePath.');
    }
  }
  if (settings != null) {
    Logger.instance.i('Imported ${settings.length} settings.');
    ref.read(settingsProvider.notifier).set(SplayTreeMap.from(settings));
    ref.invalidate(reloadAllSettingsProvider);
  }

  return settings;
}

/// A provider for rebuilding all providers that reads [Settings] during the
/// build method.
@Riverpod(keepAlive: true)
String reloadAllSettings(Ref ref) => const Uuid().v4();
