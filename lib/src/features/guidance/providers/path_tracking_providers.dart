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

import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'path_tracking_providers.g.dart';

/// A provider for the path interpolation distance.
@Riverpod(keepAlive: true)
class PathInterpolationDistance extends _$PathInterpolationDistance {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simInputProvider.notifier)
          .send((pathInterpolationDistance: state));
    });
    return 4;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].
@Riverpod(keepAlive: true)
class PathTrackingPoints extends _$PathTrackingPoints {
  @override
  List<WayPoint>? build() => null;

  /// Updates [state] to [value].
  void update(List<WayPoint>? value) => Future(() => state = value);
}

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.
@Riverpod(keepAlive: true)
class ConfiguredPathTracking extends _$ConfiguredPathTracking {
  @override
  PathTracking? build() {
    ref.listenSelf((previous, next) {
      if (next != null || previous != null) {
        Logger.instance.i('Path tracking set to ${next?.runtimeType}');
      }
    });

    final wayPoints = ref.watch(pathTrackingPointsProvider);
    if (wayPoints != null) {
      return switch (ref.watch(
        mainVehicleProvider.select((vehicle) => vehicle.pathTrackingMode),
      )) {
        PathTrackingMode.purePursuit => PurePursuitPathTracking(
            wayPoints: wayPoints,
            interpolationDistance: ref.watch(pathInterpolationDistanceProvider),
            loopMode: ref.watch(pathTrackingLoopProvider),
          ),
        PathTrackingMode.stanley => StanleyPathTracking(
            wayPoints: wayPoints,
            interpolationDistance: ref.watch(pathInterpolationDistanceProvider),
            loopMode: ref.watch(pathTrackingLoopProvider),
          )
      };
    }
    return null;
  }

  /// Send the [state] to the simulator.
  void sendToSim() =>
      ref.read(simInputProvider.notifier).send((pathTracking: state));

  /// Updates [state] to [value].
  void update(PathTracking? value) => Future(() => state = value);
}

/// A provider for whether or not the vehicle should follow the
/// [ConfiguredPathTracking] tracking model.
@Riverpod(keepAlive: true)
class EnablePathTracking extends _$EnablePathTracking {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((enablePathTracking: next));
      if (next) {
        ref.read(configuredPathTrackingProvider.notifier).sendToSim();
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.
@Riverpod(keepAlive: true)
class PathTrackingLoop extends _$PathTrackingLoop {
  @override
  PathTrackingLoopMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((pathTrackingLoopMode: next));
    });
    return PathTrackingLoopMode.none;
  }

  /// Update the [state] to [value].
  void update(PathTrackingLoopMode value) => Future(() => state = value);
}

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.
@Riverpod(keepAlive: true)
class DisplayPathTracking extends _$DisplayPathTracking {
  @override
  PathTracking? build() => null;

  /// Update the [state] to [pathTracking].
  void update(PathTracking? pathTracking) => Future(() => state = pathTracking);

  /// Set the state to null.
  void clear() => Future(() => state = null);
}

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].
@riverpod
double? pathTrackingPerpendicularDistance(
  PathTrackingPerpendicularDistanceRef ref,
) =>
    ref
        .watch(displayPathTrackingProvider)
        ?.perpendicularDistance(ref.watch(mainVehicleProvider));

/// A provider for whether or not the path tracking should be shown.
@Riverpod(keepAlive: true)
class ShowPathTracking extends _$ShowPathTracking {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.
@riverpod
FutureOr<PathTracking?> loadPathTrackingFromFile(
  LoadPathTrackingFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    final json = jsonDecode(await file.readAsString());
    if (json is Map) {
      return PathTracking.fromJson(Map<String, dynamic>.from(json));
    }
  }
  return null;
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> savePathTracking(
  SavePathTrackingRef ref,
  PathTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      saveJsonToFileDirectoryProvider(
        object: tracking,
        fileName:
            overrideName ?? tracking.name ?? DateTime.now().toIso8601String(),
        folder: 'guidance/path_tracking',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportPathTracking(
  ExportPathTrackingRef ref,
  PathTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: tracking,
        fileName:
            overrideName ?? tracking.name ?? DateTime.now().toIso8601String(),
        folder: 'guidance/path_tracking',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for reading and holding all the saved [PathTracking] in the
/// user file directory.
@Riverpod(keepAlive: true)
AsyncValue<List<PathTracking>> savedPathTrackings(SavedPathTrackingsRef ref) =>
    ref
        .watch(
          savedFilesProvider(
            fromJson: PathTracking.fromJson,
            folder: 'guidance/path_tracking',
          ),
        )
        .whenData(
          (data) => data.cast(),
        );

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deletePathTracking(
  DeletePathTrackingRef ref,
  PathTracking tracking, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    await ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ??
            tracking.name ??
            '${tracking.runtimeType}-${DateTime.now().toIso8601String()}',
        folder: 'guidance/path_tracking',
      ).future,
    );

/// A provider for importing a [PathTracking] from a file and applying it to
/// the [ConfiguredPathTracking] provider.
@riverpod
AsyncValue<PathTracking?> importPathTracking(
  ImportPathTrackingRef ref,
) {
  FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose path tracking file',
  ).then((pickedFiles) {
    if (Device.isWeb) {
      final data = pickedFiles?.files.first.bytes;
      if (data != null) {
        final json = jsonDecode(String.fromCharCodes(data));
        if (json is Map) {
          final pathTracking =
              PathTracking.fromJson(Map<String, dynamic>.from(json));
          ref
              .read(configuredPathTrackingProvider.notifier)
              .update(pathTracking);
          ref.read(showPathTrackingProvider.notifier).update(value: true);

          return AsyncData(pathTracking);
        }
      }
    } else {
      final filePath = pickedFiles?.paths.first;
      if (filePath != null) {
        return ref.watch(loadPathTrackingFromFileProvider(filePath)).whenData(
          (data) {
            if (data != null) {
              ref.read(configuredPathTrackingProvider.notifier).update(data);
              ref.read(showPathTrackingProvider.notifier).update(value: true);

              return data;
            }
            return null;
          },
        );
      }
    }
    return const AsyncData(null);
  });
  return const AsyncLoading();
}
