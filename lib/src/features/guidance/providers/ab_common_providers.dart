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
import 'package:autosteering/src/features/equipment/providers/equipment_providers.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'ab_common_providers.g.dart';

/// A provider for the current AB tracking type.
@Riverpod(keepAlive: true)
class CurrentABTrackingType extends _$CurrentABTrackingType {
  @override
  ABTrackingType build() {
    return ABTrackingType.abLine;
  }

  /// Updates [state] to [value].
  void update(ABTrackingType value) => Future(() => state = value);
}

/// A provider for whether the AB-tracking should be shown.
@Riverpod(keepAlive: true)
class ShowABTracking extends _$ShowABTracking {
  @override
  bool build() => true;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether the AB-tracking debug features should be shown.
@Riverpod(keepAlive: true)
class DebugABTracking extends _$DebugABTracking {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the step size of an AB-line.
@Riverpod(keepAlive: true)
class ABDebugStepSize extends _$ABDebugStepSize {
  @override
  double build() => 5;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
@Riverpod(keepAlive: true)
class ABDebugNumPointsAhead extends _$ABDebugNumPointsAhead {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
@Riverpod(keepAlive: true)
class ABDebugNumPointsBehind extends _$ABDebugNumPointsBehind {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the width of an AB-line.
@Riverpod(keepAlive: true)
class ABWidth extends _$ABWidth {
  @override
  double build() =>
      ref.read(
        loadedEquipmentProvider.select((value) => value?.width),
      ) ??
      15;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the sideways offset of an AB-line.
@Riverpod(keepAlive: true)
class ABSidewaysOffset extends _$ABSidewaysOffset {
  @override
  double build() => 0;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the turning radius of an AB-line.
@Riverpod(keepAlive: true)
class ABTurningRadius extends _$ABTurningRadius {
  @override
  double build() => ref.read(
        mainVehicleProvider.select((value) => 1.25 * value.minTurningRadius),
      );

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the width of an AB-line.
@Riverpod(keepAlive: true)
class ABTurnOffsetMinSkips extends _$ABTurnOffsetMinSkips {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for which limit mode the AB tracking should use.
@Riverpod(keepAlive: true)
class ABTrackingLimitMode extends _$ABTrackingLimitMode {
  @override
  ABLimitMode build() => ABLimitMode.unlimited;

  /// Updates [state] to [value].
  void update(ABLimitMode value) => Future(() => state = value);
}

/// A provider for which swapping which way the AB-tracking should turn.
@Riverpod(keepAlive: true)
class ABOffsetOppositeTurn extends _$ABOffsetOppositeTurn {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Inverts [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether the AB-tracking should snap to the closest line.
@Riverpod(keepAlive: true)
class ABSnapToClosestLine extends _$ABSnapToClosestLine {
  @override
  bool build() {
    listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((abSnapToClosestLine: next));
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Inverts [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the currently configured [ABTracking].
@Riverpod(keepAlive: true)
class ConfiguredABTracking extends _$ConfiguredABTracking {
  @override
  ABTracking? build() {
    listenSelf((previous, next) {
      if (next != null || previous != null) {
        Logger.instance.i('Path tracking set to ${next?.runtimeType}');
        if (next != null) {
          ref
            ..invalidate(displayPathTrackingProvider)
            ..read(activeWorkSessionProvider.notifier).updateABTracking(next);

          if (ref.read(
                displayPathTrackingProvider.select((value) => value == null),
              ) &&
              ref.read(
                displayABTrackingProvider.select((value) => value == null),
              )) {
            sendToSim();
          }
        } else {
          sendToSim();
        }
      }
    });
    return null;
  }

  /// Send the [state] to the simulator.
  void sendToSim() =>
      ref.read(simInputProvider.notifier).send((abTracking: state));

  /// Updates [state] to [value].
  void update(ABTracking? value) => Future(() => state = value);
}

/// A provider for the currently configured [ABTracking].
@Riverpod(keepAlive: true)
class ConfiguredMenuABTracking extends _$ConfiguredMenuABTracking {
  @override
  FutureOr<ABTracking?> build() async =>
      await switch (ref.watch(currentABTrackingTypeProvider)) {
        ABTrackingType.aPlusLine => ref.watch(aPlusLineProvider.future),
        ABTrackingType.abLine => ref.watch(aBLineProvider.future),
        ABTrackingType.abCurve => ref.watch(aBCurveProvider.future),
      };

  /// Send the [state] to the simulator.
  void sendToSim() =>
      ref.read(simInputProvider.notifier).send((abTracking: state));

  /// Updates [state] to [value].
  void updateTo(ABTracking? value) =>
      Future(() => state = AsyncValue.data(value));
}

/// A provider for the [ABTracking] to display.
@Riverpod(keepAlive: true)
class DisplayABTracking extends _$DisplayABTracking {
  @override
  ABTracking? build() {
    listenSelf((previous, next) {
      if (next != null) {
        ref.read(activeWorkSessionProvider.notifier).updateABTracking(next);
      }
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(ABTracking? value) => Future(() => state = value);
}

/// A provider for the starting point A of an AB-line.
@Riverpod(keepAlive: true)
class ABPointA extends _$ABPointA {
  @override
  WayPoint? build() {
    listenSelf((previous, next) {
      if (next != null) {
        Logger.instance.i('AB point A set to: $next');
      }
    });
    return null;
  }

  /// Updates [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// A provider for the ending point B of an AB-line.
@Riverpod(keepAlive: true)
class ABPointB extends _$ABPointB {
  @override
  WayPoint? build() {
    listenSelf((previous, next) {
      if (next != null) {
        Logger.instance.i('AB point B set to: $next');
      }
    });
    return null;
  }

  /// Updates [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// A provider for whether to show the starting point A of an AB-line.
@Riverpod(keepAlive: true)
class ShowABPointA extends _$ShowABPointA {
  @override
  bool build() => true;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Toggles [state] to [!state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether to show the ending point B of an AB-line.
@Riverpod(keepAlive: true)
class ShowABPointB extends _$ShowABPointB {
  @override
  bool build() => true;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Toggles [state] to [!state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].
@riverpod
double? abTrackingPerpendicularDistance(
  Ref ref,
) =>
    ref
        .watch(displayABTrackingProvider)
        ?.signedPerpendicularDistanceToCurrentLine(
          ref.watch(mainVehicleProvider),
        );

/// A provider for the currently active AB configuration.
@Riverpod(keepAlive: true)
ABConfig activeABConfig(Ref ref) {
  final config = ABConfig(
    turningRadius: ref.watch(aBTurningRadiusProvider),
    turnOffsetMinSkips: ref.watch(aBTurnOffsetMinSkipsProvider),
    snapToClosestLine: ref.watch(aBSnapToClosestLineProvider),
    offsetOppositeTurn: ref.watch(aBOffsetOppositeTurnProvider),
    limitMode: ref.watch(aBTrackingLimitModeProvider),
  );

  ref.read(simInputProvider.notifier).send(config);

  return config;
}

/// A provider for whether all the calculated lines for the AB tracking should
/// be shown.
@Riverpod(keepAlive: true)
class ABTrackingShowAllLines extends _$ABTrackingShowAllLines {
  @override
  bool build() => true;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.
@riverpod
FutureOr<ABTracking?> loadABTrackingFromFile(
  Ref ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      final json = jsonDecode(await file.readAsString());
      return ABTracking.fromJson(Map<String, dynamic>.from(json as Map));
    } on Exception catch (error, stackTrace) {
      Logger.instance.w(
        'Failed to load AB tracking from: $path.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  return null;
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> saveABTracking(
  Ref ref,
  ABTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      saveJsonToFileDirectoryProvider(
        object: tracking,
        fileName: overrideName ??
            tracking.name ??
            '${tracking.runtimeType}-${DateTime.now().toIso8601String()}',
        folder: path.join('guidance', 'ab_tracking'),
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportABTracking(
  Ref ref,
  ABTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: tracking,
        fileName: overrideName ??
            tracking.name ??
            '${tracking.runtimeType}-${DateTime.now().toIso8601String()}',
        folder: path.join('guidance', 'ab_tracking'),
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for reading and holding all the saved [ABTracking] in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<ABTracking>> savedABTrackings(Ref ref) async => await ref
    .watch(
      savedFilesProvider(
        fromJson: ABTracking.fromJson,
        folder: path.join('guidance', 'ab_tracking'),
      ).future,
    )
    .then((data) => data.cast());

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deleteABTracking(
  Ref ref,
  ABTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    await ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ??
            tracking.name ??
            '${tracking.runtimeType}-${DateTime.now().toIso8601String()}',
        folder: path.join('guidance', 'ab_tracking'),
      ).future,
    );

/// A provider for importing an [ABTracking] from a file and applying it to
/// the [ConfiguredABTracking] provider.
@riverpod
FutureOr<ABTracking?> importABTracking(
  Ref ref,
) async {
  ref.keepAlive();
  Timer(const Duration(seconds: 5), ref.invalidateSelf);

  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose AB tracking file',
  );
  ABTracking? abTracking;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));

        abTracking =
            ABTracking.fromJson(Map<String, dynamic>.from(json as Map));
      } on Exception catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import AB tracking.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w('Failed to import AB tracking, data is null.');
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      abTracking =
          await ref.watch(loadABTrackingFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import AB tracking: $filePath');
    }
  }
  if (abTracking != null) {
    Logger.instance
        .i('Imported AB tracking: ${abTracking.name ?? abTracking.uuid}');
    ref.read(configuredABTrackingProvider.notifier).update(abTracking);
    ref.read(showABTrackingProvider.notifier).update(value: true);
  }
  return abTracking;
}
