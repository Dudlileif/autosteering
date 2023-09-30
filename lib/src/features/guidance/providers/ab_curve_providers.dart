import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
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
      ref.read(aBTrackingDebugShowProvider.notifier).update(value: true);
    }
  }
}

/// A provider for the AB-curve object to debug.
@Riverpod(keepAlive: true)
Future<ABCurve?> aBCurveDebug(ABCurveDebugRef ref) async {
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
        ref.read(simInputProvider.notifier).send((abTracking: data));
        ref.read(displayABTrackingLinesProvider.notifier).update(data?.lines);
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
