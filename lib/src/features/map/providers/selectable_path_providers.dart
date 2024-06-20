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
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selectable_path_providers.g.dart';

/// A provider for whether the selectable path feature should be enabled.
@Riverpod(keepAlive: true)
class EnableSelectablePath extends _$EnableSelectablePath {
  @override
  bool build() {
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the index of the start point of the selected path.
@riverpod
class SelectablePathIndexStart extends _$SelectablePathIndexStart {
  @override
  int? build() => null;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the index of the end point of the selected path.
@riverpod
class SelectablePathIndexEnd extends _$SelectablePathIndexEnd {
  @override
  int? build() => null;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the selectable path to get indices from.
@riverpod
class SelectablePathPoints extends _$SelectablePathPoints {
  @override
  Iterable<Geographic>? build() {
    ref.listenSelf((previous, next) {
      if (next == null) {
        ref
          ..invalidate(selectablePathIndexStartProvider)
          ..invalidate(selectablePathIndexEndProvider);
      }
    });

    return ref.watch(
          displayPathTrackingProvider
              .select((value) => value?.wayPoints.map((e) => e.position)),
        ) ??
        ref.watch(
          activeFieldProvider.select(
            (value) => value?.polygon.exterior?.toGeographicPositions,
          ),
        );
  }

  /// Updates [state] to [value].
  void update(Iterable<Geographic>? value) => Future(() => state = value);

  @override
  bool updateShouldNotify(
    Iterable<Geographic>? previous,
    Iterable<Geographic>? next,
  ) =>
      true;
}

/// A provider for several segment selections on the selectable path.
@riverpod
class SelectablePathIndexSegments extends _$SelectablePathIndexSegments {
  @override
  Iterable<Iterable<int>>? build() {
    return null;
  }

  /// Updates [state] to [value].
  void update(Iterable<Iterable<int>>? value) => Future(() => state = value);

  @override
  bool updateShouldNotify(
    Iterable<Iterable<int>>? previous,
    Iterable<Iterable<int>>? next,
  ) =>
      true;
}

/// A provider for the indices of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
@riverpod
Iterable<int>? selectablePathIndices(SelectablePathIndicesRef ref) {
  final start = ref.watch(selectablePathIndexStartProvider);
  final end = ref.watch(selectablePathIndexEndProvider);
  final pathLength =
      ref.watch(selectablePathPointsProvider.select((value) => value?.length));
  if (start != null && end != null && pathLength != null) {
    if (start < pathLength && end < pathLength) {
      final selected = <int>{start};
      var i = 1;
      if (start > end) {
        final points = pathLength - start + end;
        while (i <= points) {
          selected.add((start + i) % pathLength);
          i++;
        }
      } else {
        final points = end - start;
        while (i <= points) {
          selected.add((start + i) % pathLength);
          i++;
        }
      }
      return selected;
    }
  }
  return null;
}

/// A provider for the points of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
@riverpod
Iterable<Geographic>? selectablePathStartToEnd(
  SelectablePathStartToEndRef ref,
) {
  final points = ref.watch(selectablePathPointsProvider);
  final selected = ref.watch(selectablePathIndicesProvider);
  if (points != null && selected != null) {
    if (selected.every((index) => index < points.length)) {
      return selected.map(points.elementAt);
    }
  }
  return null;
}
