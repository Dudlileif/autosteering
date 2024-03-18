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
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_curve_providers.g.dart';

/// A provider for the curve points for the AB-curve.
@Riverpod(keepAlive: true)
class ABCurvePoints extends _$ABCurvePoints {
  @override
  List<WayPoint>? build() {
    ref.listenSelf((previous, next) {
      if (next != null) {
        Logger.instance.i('AB curve recorded points: ${next.length}.');
      }
    });
    return null;
  }

  /// Updates [state] to [points].
  void update(List<WayPoint> points) => Future(() => state = points);

  /// Updates [state] from [FinishedPathRecordingList] if possible.
  Future<void> updateFromRecording() async {
    ref.read(simInputProvider.notifier).send((abTracking: null));

    await Future<void>.delayed(const Duration(milliseconds: 100));

    final points = ref.read(finishedPathRecordingListProvider);
    if (points != null && points.isNotEmpty) {
      update(points);

      ref
        ..invalidate(pathRecordingListProvider)
        ..invalidate(finishedPathRecordingListProvider);

      ref.read(showFinishedPathProvider.notifier).update(value: false);
      ref.read(showABTrackingProvider.notifier).update(value: true);
    }
  }
}

/// A provider for the AB-curve.
@Riverpod(keepAlive: true)
Future<ABCurve?> aBCurve(ABCurveRef ref) async {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != null) {
          ref.listenSelf((previous, next) {
            Logger.instance.i(
              '''ABCurve created: A:${data.start}, B: ${data.end}, points: ${data.baseLine.length}, bounded: ${data.boundary != null}, offsetsInsideBoundary: ${data.offsetsInsideBoundary?.toList()}''',
            );
          });
        } else if (previous?.value != null && data == null) {
          Logger.instance.i('ABCurve deleted.');
        }
        ref.read(configuredABTrackingProvider.notifier).update(data);
      },
      error: (error, stackTrace) {},
      loading: () {},
    );
  });

  final points = ref.watch(aBCurvePointsProvider);

  if (points != null) {
    if ((points.length) >= 2) {
      final boundary = ref.watch(bufferedFieldProvider).when(
            data: (data) =>
                data?.polygon ?? ref.watch(activeFieldProvider)?.polygon,
            error: (error, stackTrace) => null,
            loading: () => null,
          );
      final width = ref.watch(aBWidthProvider);
      final turningRadius = ref.read(aBTurningRadiusProvider);
      final turnOffsetMinSkips = ref.read(aBTurnOffsetMinSkipsProvider);
      final limitMode = ref.read(aBTrackingLimitModeProvider);

      if (kIsWeb) {
        return ABCurve(
          baseLine: points,
          boundary: boundary,
          width: width,
          turningRadius: turningRadius,
          turnOffsetMinSkips: turnOffsetMinSkips,
          limitMode: limitMode,
        );
      }
      final json = await Future(
        () => jsonEncode({
          'base_line': points,
          'boundary': boundary?.toText(),
          'width': width,
          'turning_radius': turningRadius,
          'turn_offset_skips': turnOffsetMinSkips,
          'limit_mode': limitMode,
          'calculate_lines': true,
          'type': 'AB Curve',
        }),
      );

      final creation = await compute(
        ABTracking.createAndReturnABTrackingString,
        json,
        debugLabel: 'ABCurve creation isolate',
      );

      final data = jsonDecode(creation);
      if (data is Map) {
        final abCurve = ABCurve.fromJson(Map<String, dynamic>.from(data));
        return abCurve;
      }
    }
  }

  return null;
}
