import 'dart:collection';
import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

/// A provider for the settings map for the application.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  Map<String, dynamic> build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        final sortedMap = SplayTreeMap.of(
          next,
          (key1, key2) => key1.compareTo(key2),
        );

        ref.watch(settingsFileProvider).requireValue.writeAsString(
              const JsonEncoder.withIndent('    ').convert(sortedMap),
            );
      }
    });

    var fileString =
        ref.watch(settingsFileProvider).requireValue.readAsStringSync();

    if (fileString.isEmpty) {
      fileString = '{}';
    }
    return Map<String, dynamic>.from(
      jsonDecode(
        fileString,
      ) as Map,
    );
  }

  void update(SettingsKey key, dynamic value) => Future(
        () => state = Map<String, dynamic>.from(state)
          ..update(
            key.name,
            (oldValue) => value,
            ifAbsent: () => value,
          ),
      );

  bool containsKey(SettingsKey key) => state.containsKey(key.name);

  bool? getBool(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as bool : null;

  double? getDouble(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as double : null;

  int? getInt(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as int : null;

  String? getString(SettingsKey key) =>
      state.containsKey(key.name) ? state[key.name] as String : null;

  Map<String, dynamic>? getMap(SettingsKey key) => state.containsKey(key.name)
      ? Map<String, dynamic>.from(state[key.name] as Map)
      : null;

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
