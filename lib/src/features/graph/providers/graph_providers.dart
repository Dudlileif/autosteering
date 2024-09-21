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
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/graph/graph.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graph_providers.g.dart';

/// A provider for whether the [DraggableGraph] should be shown.
@riverpod
class ShowDraggableGraph extends _$ShowDraggableGraph {
  @override
  bool build() => false;

  /// Updates [state] to [value];
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the time, in seconds, for the graph to show.
@Riverpod(keepAlive: true)
class GraphRetainTimeSeconds extends _$GraphRetainTimeSeconds {
  @override
  double build() {
    return 5;
  }

  /// Updates [state] to [value], [value] is clamped between 1 and 60 seconds.
  void update(double value) => Future(() => state = clampDouble(value, 1, 60));
}

/// A provider for the currently active [GraphParameter]s, i.e. which data to
/// show on the graph.
@Riverpod(keepAlive: true)
class GraphActiveParameters extends _$GraphActiveParameters {
  @override
  Set<GraphParameter> build() {
    return {
      GraphParameter.steeringAngle,
      GraphParameter.steeringAngleTarget,
      GraphParameter.perpendicularDistance,
    };
  }

  /// Adds [parameter] to [state].
  void add(GraphParameter parameter) =>
      Future(() => state = state..add(parameter));

  /// Removes [parameter] from [state].
  void remove(GraphParameter parameter) =>
      Future(() => state = state..remove(parameter));

  /// Toggles [parameter] by removing from or adding it to state.
  void toggle(GraphParameter parameter) => Future(() {
        if (state.contains(parameter)) {
          remove(parameter);
        } else {
          add(parameter);
        }
      });

  /// Updates whether [parameter] is in state by [value].
  void updateParameter(GraphParameter parameter, {required bool? value}) =>
      Future(() {
        if (value != null) {
          if (value && !state.contains(parameter)) {
            add(parameter);
          } else if (!value && state.contains(parameter)) {
            remove(parameter);
          }
        }
      });

  @override
  bool updateShouldNotify(
    Set<GraphParameter> previous,
    Set<GraphParameter> next,
  ) =>
      const SetEquality<GraphParameter>().equals(previous, next);
}

/// A provider for the currently active [GraphData], derived from
/// [GraphActiveParameters].
@riverpod
Set<GraphData> graphActiveData(GraphActiveDataRef ref) {
  final parameters = ref.watch(graphActiveParametersProvider);
  final vehicle = ref.watch(
    mainVehicleProvider.select(
      (value) => (
        steeringAngleMax: value.steeringAngleMax,
        hardware: value.steeringHardwareConfig
      ),
    ),
  );
  final graphData = parameters
      .map(
        (parameter) => switch (parameter) {
          GraphParameter.imuBearing => const GraphData(
              min: 0,
              max: 360,
              parameter: GraphParameter.imuBearing,
            ),
          GraphParameter.imuPitch => const GraphData(
              min: -180,
              max: 180,
              parameter: GraphParameter.imuPitch,
            ),
          GraphParameter.imuRoll => const GraphData(
              min: -180,
              max: 180,
              parameter: GraphParameter.imuRoll,
            ),
          GraphParameter.imuLongitudinalCorrection => const GraphData(
              min: -2,
              max: 2,
              parameter: GraphParameter.imuLongitudinalCorrection,
            ),
          GraphParameter.imuLateralCorrection => const GraphData(
              min: -2,
              max: 2,
              parameter: GraphParameter.imuLateralCorrection,
            ),
          GraphParameter.imuAccelerationX => const GraphData(
              min: 0,
              max: 10,
              parameter: GraphParameter.imuAccelerationX,
            ),
          GraphParameter.imuAccelerationY => const GraphData(
              min: 0,
              max: 10,
              parameter: GraphParameter.imuAccelerationY,
            ),
          GraphParameter.imuAccelerationZ => const GraphData(
              min: 0,
              max: 10,
              parameter: GraphParameter.imuAccelerationZ,
            ),
          GraphParameter.steeringAngle => GraphData(
              min: -vehicle.steeringAngleMax,
              max: vehicle.steeringAngleMax,
              parameter: parameter,
            ),
          GraphParameter.steeringAngleTarget => GraphData(
              min: -vehicle.steeringAngleMax,
              max: vehicle.steeringAngleMax,
              parameter: parameter,
            ),
          GraphParameter.steeringWas => GraphData(
              min: vehicle.hardware.wasMin,
              max: vehicle.hardware.wasMax,
              parameter: parameter,
            ),
          GraphParameter.steeringWasTarget => GraphData(
              min: vehicle.hardware.wasMin,
              max: vehicle.hardware.wasMax,
              parameter: parameter,
            ),
          GraphParameter.perpendicularDistance => GraphData(
              min: -1,
              max: 1,
              parameter: parameter,
            ),
        },
      )
      .nonNulls
      .toSet();
  return graphData;
}

/// A provider for the values to show on the graph.
///
/// It is periodically refreshed with new data at a rate of 30 Hz.
@riverpod
class GraphValues extends _$GraphValues {
  @override
  Map<GraphData, List<({double normalized, num raw})?>> build() {
    final data = ref.watch(graphActiveDataProvider);
    final count = (ref.watch(graphRetainTimeSecondsProvider) / 33e-3).round();
    final values = <GraphData, List<({double normalized, num raw})?>>{};

    final timer = Timer.periodic(const Duration(milliseconds: 33), (timer) {
      for (final parameter in data) {
        if (values[parameter] != null) {
          while (values[parameter]!.length >= count) {
            values[parameter]!.removeAt(0);
          }
        }

        final raw = switch (parameter.parameter) {
          GraphParameter.imuBearing =>
            ref.read(mainVehicleProvider.select((value) => value.imu.bearing)),
          GraphParameter.imuPitch =>
            ref.read(mainVehicleProvider.select((value) => value.imu.pitch)),
          GraphParameter.imuRoll =>
            ref.read(mainVehicleProvider.select((value) => value.imu.roll)),
          GraphParameter.imuLongitudinalCorrection => ref.read(
              mainVehicleProvider
                  .select((value) => value.antennaPitchLongitudinalOffset),
            ),
          GraphParameter.imuLateralCorrection => ref.read(
              mainVehicleProvider
                  .select((value) => value.antennaRollLateralOffset),
            ),
          GraphParameter.imuAccelerationX => ref.read(
              mainVehicleProvider
                  .select((value) => value.imu.reading.accelerationX),
            ),
          GraphParameter.imuAccelerationY => ref.read(
              mainVehicleProvider
                  .select((value) => value.imu.reading.accelerationY),
            ),
          GraphParameter.imuAccelerationZ => ref.read(
              mainVehicleProvider
                  .select((value) => value.imu.reading.accelerationZ),
            ),
          GraphParameter.perpendicularDistance =>
            ref.read(abTrackingPerpendicularDistanceProvider) ??
                ref.read(pathTrackingPerpendicularDistanceProvider),
          GraphParameter.steeringAngle => ref.read(
              mainVehicleProvider.select((value) => value.steeringAngle),
            ),
          GraphParameter.steeringAngleTarget =>
            ref.read(vehicleSteeringAngleTargetProvider),
          GraphParameter.steeringWas => ref.read(
              mainVehicleProvider.select((value) => value.was.reading.value),
            ),
          GraphParameter.steeringWasTarget =>
            ref.read(steeringMotorWasTargetProvider),
        };
        final normalized = parameter.valueNormalized(raw);
        if (values[parameter] != null) {
          if (raw != null && normalized != null) {
            values[parameter]!.add((normalized: normalized, raw: raw));
          } else {
            values[parameter]!.add(null);
          }
        } else {
          if (raw != null && normalized != null) {
            values[parameter] = [(normalized: normalized, raw: raw)];
          } else {
            values[parameter] = [null];
          }
        }
      }
      final keys = values.keys.toList();
      for (final key in keys) {
        if (!data.contains(key)) {
          values.remove(key);
        }
      }
      ref.notifyListeners();
    });
    ref.onDispose(timer.cancel);
    return values;
  }
}

/// A provider for the UI [Offset] for the path recording configurator.
@riverpod
class DraggableGraphUiOffset extends _$DraggableGraphUiOffset {
  @override
  Offset build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
        if (previous != null && next != previous) {
          ref.read(settingsProvider.notifier).update(
                SettingsKey.uiDraggableGraphOffset,
                next.toJson(),
              );
        }
      });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiDraggableGraphOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}
