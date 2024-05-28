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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_debug_providers.g.dart';

/// Whether to show equipment turning debug features.
@riverpod
class DebugEquipmentTurning extends _$DebugEquipmentTurning {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show equipment trajectory debug features.
@riverpod
class DebugEquipmentTrajectory extends _$DebugEquipmentTrajectory {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show equipment travelled path debug.
@riverpod
class DebugEquipmentTravelledPath extends _$DebugEquipmentTravelledPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The amount of points [DebugEquipmentTravelledPathList] should hold.
@Riverpod(keepAlive: true)
class DebugEquipmentTravelledPathSize
    extends _$DebugEquipmentTravelledPathSize {
  @override
  int build() => 100;

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A list of the last [DebugEquipmentTravelledPathSize] position points for the
/// equipments.
@riverpod
class DebugEquipmentTravelledPathList
    extends _$DebugEquipmentTravelledPathList {
  @override
  Map<String, List<LatLng>> build() {
    if (ref.watch(debugEquipmentTravelledPathProvider)) {
      ref.listen(allEquipmentsProvider, (prev, next) {
        for (final equipment in next.values) {
          add(equipment.uuid, equipment.workingCenter.latLng);
        }
      });
    }

    return {};
  }

  /// Add the [point] to the travelled path.
  void add(String uuid, LatLng point) => Future(() {
        if (state[uuid] != null) {
          while (state[uuid]!.length >
              ref.watch(debugEquipmentTravelledPathSizeProvider)) {
            state[uuid] = state[uuid]!..removeLast();
          }
        }
        state[uuid] = [point, ...state[uuid] ?? []];
      });
}

/// Whether to show equipment hitches debug.
@riverpod
class DebugEquipmentHitches extends _$DebugEquipmentHitches {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show equipment section debug features.
@riverpod
class DebugEquipmentSections extends _$DebugEquipmentSections {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The amount of seconds equipment trajectories should predict.
@Riverpod(keepAlive: true)
class DebugEquipmentTrajectorySeconds
    extends _$DebugEquipmentTrajectorySeconds {
  @override
  double build() => 10;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// The minimum length equipment trajectories should predict.
@Riverpod(keepAlive: true)
class DebugEquipmentTrajectoryMinLength
    extends _$DebugEquipmentTrajectoryMinLength {
  @override
  double build() => 10;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
