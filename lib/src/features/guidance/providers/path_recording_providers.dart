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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'path_recording_providers.g.dart';

/// Whether the path recording menu should be shown.
@riverpod
class ShowPathRecordingMenu extends _$ShowPathRecordingMenu {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// Whether the path recorder is enabled.
@Riverpod(keepAlive: true)
class EnablePathRecorder extends _$EnablePathRecorder {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next || previous != null) {
        Logger.instance.i('Path recorder ${switch (next) {
          true => 'enabled',
          false => 'disabled'
        }}.');
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// Whether the automatic path recorder is enabled.
@Riverpod(keepAlive: true)
class EnableAutomaticPathRecorder extends _$EnableAutomaticPathRecorder {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (!next && (previous != null && previous)) {
        if (ref.read(pathRecordingListProvider).isNotEmpty) {
          ref.read(pathRecordingListProvider.notifier).add(
                ref.read(mainVehicleProvider.select((value) => value.wayPoint)),
                applySettings: true,
              );
        }
      }
      if (next || previous != null) {
        Logger.instance.i('Automatic path recorder ${switch (next) {
          true => 'enabled',
          false => 'disabled'
        }}.');
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for the [PathRecordingSettings] which configures how paths
/// should be recorded.
@Riverpod(keepAlive: true)
class ActivePathRecordingSettings extends _$ActivePathRecordingSettings {
  @override
  PathRecordingSettings build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.pathRecordingSettings, next);
      }
    });
    final json = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.pathRecordingSettings);
    if (json != null) {
      return PathRecordingSettings.fromJson(Map<String, dynamic>.from(json));
    }
    return const PathRecordingSettings();
  }

  /// Updates [state] to [value].
  void update(PathRecordingSettings value) => Future(() => state = value);
}

/// Whether the path recording menu should be shown.
@Riverpod(keepAlive: true)
class ActivePathRecordingTarget extends _$ActivePathRecordingTarget {
  @override
  PathRecordingTarget build() => PathRecordingTarget.pathTracking;

  /// Update the [state] to [value].
  void update(PathRecordingTarget value) => Future(() => state = value);
}

/// A provider for watching to keep the automatic path recording going.
@riverpod
Future<void> automaticPathRecording(AutomaticPathRecordingRef ref) async {
  final doRecord = ref.watch(
    enableAutomaticPathRecorderProvider,
  );

  if (doRecord) {
    final points = ref.watch(pathRecordingListProvider);
    final settings = ref.watch(activePathRecordingSettingsProvider);
    final wayPoint =
        ref.watch(mainVehicleProvider.select((vehicle) => vehicle.wayPoint));
    if (wayPoint != points.lastOrNull) {
      var correctedWayPoint = wayPoint;
      if (settings.lateralOffset.abs() > 0) {
        correctedWayPoint = correctedWayPoint.moveRhumb(
          distance: settings.lateralOffset,
          angleFromBearing: 90,
        );
      }
      if (settings.longitudinalOffset.abs() > 0) {
        correctedWayPoint = correctedWayPoint.moveRhumb(
          distance: settings.longitudinalOffset,
        );
      }
      if (points.isNotEmpty) {
        final distance = points.last.position.rhumb.distanceTo(
          correctedWayPoint.position,
        );
        if (distance > settings.maxDistance) {
          await ref
              .read(pathRecordingListProvider.notifier)
              .add(correctedWayPoint);
        } else if (distance > settings.minDistance && points.length >= 2) {
          final prevBearing =
              points[points.length - 2].position.rhumb.initialBearingTo(
                    points.last.position,
                  );
          final bearing = points.last.position.rhumb.initialBearingTo(
            correctedWayPoint.position,
          );

          if (bearingDifference(prevBearing, bearing) >
              settings.maxBearingDifference) {
            await ref
                .read(pathRecordingListProvider.notifier)
                .add(correctedWayPoint);
          }
        } else if (points.length < 2 && distance > 1) {
          await ref
              .read(pathRecordingListProvider.notifier)
              .add(correctedWayPoint);
        }
      } else {
        await ref
            .read(pathRecordingListProvider.notifier)
            .add(correctedWayPoint);
      }
    }
  }
}

/// A list of the currently recording points.
@Riverpod(keepAlive: true)
class PathRecordingList extends _$PathRecordingList {
  @override
  List<WayPoint> build() => <WayPoint>[];

  /// Add the [point] to the [state], if [applySettings] is true, the offset
  /// parts of active [PathRecordingSettings] are applied to the point.
  Future<void> add(WayPoint point, {bool applySettings = false}) async =>
      Future(() {
        var correctedPoint = point;
        if (applySettings) {
          final settings = ref.read(activePathRecordingSettingsProvider);
          if (settings.longitudinalOffset.abs() > 0) {
            correctedPoint =
                correctedPoint.moveRhumb(distance: settings.longitudinalOffset);
          }
          if (settings.lateralOffset.abs() > 0) {
            correctedPoint = correctedPoint.moveRhumb(
              distance: settings.lateralOffset,
              angleFromBearing: 90,
            );
          }
        }
        if (state.lastOrNull != correctedPoint) {
          state = [...state, correctedPoint];
        }
      });

  /// Remove all the waypoints.
  void clear() => Future(state.clear);

  /// Finished the recording by sending the points to
  /// [FinishedPathRecordingList] and invalidating itself.
  void finishRecording() => Future(() {
        ref.read(finishedPathRecordingListProvider.notifier).update(state);
        ref.invalidateSelf();
      });
}

/// A list of path points for the last finished recording.
@Riverpod(keepAlive: true)
class FinishedPathRecordingList extends _$FinishedPathRecordingList {
  @override
  List<WayPoint>? build() {
    ref.listenSelf((previous, next) {
      if (next?.length != previous?.length) {
        Logger.instance
            .i('Finished path recording list: ${next?.length} points.');
      }
    });
    return null;
  }

  /// Update the [state] to [points].
  void update(List<WayPoint> points) => Future(() => state = points);

  /// Move the [point] to [index].
  void movePoint(int index, WayPoint point) => Future(
        () {
          var bearing = point.bearing;
          if (state != null && state!.length > index + 1) {
            bearing = point.initialBearingToRhumb(state![index + 1]);
          } else if (state != null &&
              state!.length > 1 &&
              index == state!.length - 1) {
            bearing = state![index - 1].finalBearingToRhumb(point);
          }

          return state = state
            ?..insert(index, point.copyWith(bearing: bearing))
            ..removeAt(index + 1);
        },
      );

  /// Insert [point] at [index].
  void insert(int index, WayPoint point) =>
      Future(() => state = state?..insert(index, point));

  /// Remove point at [index].
  void remove(int index) => Future(
        () => state = state?..removeAt(index),
      );

  /// Set the state to null.
  void clear() => Future(() => state = null);

  @override
  bool updateShouldNotify(List<WayPoint>? previous, List<WayPoint>? next) =>
      true;
}

/// Whether to show the last fininshed path recording.
@Riverpod(keepAlive: true)
class ShowFinishedPath extends _$ShowFinishedPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// Whether to activate editing of the last finished path recording.
@Riverpod(keepAlive: true)
class EditFinishedPath extends _$EditFinishedPath {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next || previous != null) {
        Logger.instance.i('Editing recorded path: $next.');
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}
