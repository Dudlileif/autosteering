import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' show Storage, window;
import 'package:universal_io/io.dart';

part 'settings_providers.g.dart';

/// A provider for the main settings file for the application.
@Riverpod(keepAlive: true)
Future<File> settingsFile(SettingsFileRef ref) async {
  final file = await File(
    '${ref.watch(fileDirectoryProvider).requireValue.path}/settings.json',
  ).create(recursive: true);

  return file;
}

/// A provider for the local storage data map for the web version of the
/// application.
@Riverpod(keepAlive: true)
Storage webLocalStorage(WebLocalStorageRef ref) => window.localStorage;

/// A provider for the settings map for the application.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  SplayTreeMap<String, dynamic> build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        log('Saved settings to file.');
        if (Device.isWeb) {
          ref.watch(webLocalStorageProvider)['settings'] = jsonEncode(next);
        } else {
          ref.watch(settingsFileProvider).requireValue.writeAsString(
                const JsonEncoder.withIndent('    ').convert(next),
              );
        }
      }
    });

    var fileString = switch (Device.isWeb) {
      true => ref.watch(webLocalStorageProvider)['settings'] ?? '',
      false => ref.watch(settingsFileProvider).requireValue.readAsStringSync(),
    };
    if (fileString.isEmpty) {
      fileString = '{}';
    }
    return SplayTreeMap<String, dynamic>.from(jsonDecode(fileString) as Map);
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
          log('Updated setting ${key.name}: ${state[key.name]} => $value');

          state = SplayTreeMap.from(state)
            ..update(
              key.name,
              (oldValue) => value,
              ifAbsent: () => value,
            );
        },
      );

  /// Whether the settings contains a value for [key].
  bool containsKey(SettingsKey key) => state.containsKey(key.name);

  /// Get the value of type [bool] for the setting [key], if it exists.
  bool? getBool(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as bool : null;

  /// Get the value of type [double] for the setting [key], if it exists.
  double? getDouble(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as double : null;

  /// Get the value of type [int] for the setting [key], if it exists.
  int? getInt(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as int : null;

  /// Get the value of type [String] for the setting [key], if it exists.
  String? getString(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as String : null;

  /// Get the value of type [Map] for the setting [key], if it exists.
  Map<String, dynamic>? getMap(SettingsKey key) => state.containsKey(key.name)
      ? Map<String, dynamic>.from(state[key.name] as Map)
      : null;

  /// Get the value of type [List] for the setting [key], if it exists.
  List<dynamic>? getList(SettingsKey key) => state.containsKey(key.name)
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
