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

import 'dart:collection';
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' show Storage, window;
import 'package:universal_io/io.dart';

part 'settings_providers.g.dart';

/// A provider for the main settings file for the application.
@Riverpod(keepAlive: true)
Future<File> settingsFile(SettingsFileRef ref) async {
  final path =
      '${ref.watch(fileDirectoryProvider).requireValue.path}/settings.json';
  final file = File(path);

  if (file.existsSync()) {
    Logger.instance.i('Settings file found: $path');
    return file;
  }

  await file.create(recursive: true);
  Logger.instance.i('Settings file created: $path');
  return file;
}

/// A provider for the local storage data map for the web version of the
/// application.
@Riverpod(keepAlive: true)
Storage webLocalStorage(WebLocalStorageRef ref) {
  Logger.instance.i('Loaded web window localStorage');
  return window.localStorage;
}

/// A provider for the settings map for the application.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  bool _saveToRemoveDeprecated = false;
  @override
  SplayTreeMap<String, dynamic> build() {
    ref.listenSelf((previous, next) {
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
  void update(SettingsKey key, dynamic value) => Future(
        () {
          final oldValue = state[key.name];
          // Skip if value is not new.
          if (oldValue is Iterable) {
            if (const DeepCollectionEquality().equals(oldValue, value)) {
              return;
            }
          } else if (oldValue == value) {
            return;
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
