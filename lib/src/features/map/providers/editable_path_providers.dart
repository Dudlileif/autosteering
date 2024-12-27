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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editable_path_providers.g.dart';

/// A provider for whether the editable path feature should be enabled.
@Riverpod(keepAlive: true)
class ActiveEditablePathType extends _$ActiveEditablePathType {
  @override
  EditablePathType? build() {
    listenSelf((previous, next) {
      if (previous != next) {
        Logger.instance.i('Path editing type: $next');
      }
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(EditablePathType? value) => Future(() => state = value);
}

/// A provider for the editable path points.
@riverpod
class EditablePathPoints extends _$EditablePathPoints {
  @override
  List<Geographic>? build() => null;

  /// Updates [state] to [value].
  void update(List<Geographic>? value) => Future(() => state = value);

  /// Move the point at [index] by replacing it with [point].
  void movePoint(int index, Geographic point) => Future(
        () => state = state
          ?..insert(index, point)
          ..removeAt(index + 1),
      );

  /// Insert [point] at [index].
  void insert(int index, Geographic point) =>
      Future(() => state = state?..insert(index, point));

  /// Remove point at [index].
  void remove(int index) => Future(
        () => state = state?..removeAt(index),
      );

  /// Set the state to null.
  void clear() => Future(() => state = null);

  @override
  bool updateShouldNotify(
    List<Geographic>? previous,
    List<Geographic>? next,
  ) =>
      true;
}

/// A provider with [EditablePathPoints] converted to [WayPoint]s.
@riverpod
List<WayPoint>? editablePathAsWayPoints(Ref ref) {
  final points = ref.watch(editablePathPointsProvider);
  if (points != null && points.length >= 2) {
    final wayPoints = <WayPoint>[];
    for (final (index, point) in points.indexed) {
      if (index != points.length - 1) {
        wayPoints.add(
          WayPoint(
            position: point,
            bearing: point.rhumb.initialBearingTo(points[index + 1]),
          ),
        );
      } else {
        wayPoints.add(
          WayPoint(
            position: point,
            bearing: points[index - 1].rhumb.finalBearingTo(point),
          ),
        );
      }
    }
    return wayPoints;
  }
  return null;
}
