import 'dart:convert';

import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_line_providers.g.dart';

/// A provider for the AB-line object to debug.
@Riverpod(keepAlive: true)
Future<ABLine?> aBLineDebug(ABLineDebugRef ref) async {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        ref.read(simInputProvider.notifier).send((abTracking: data));
        ref.read(displayABTrackingLinesProvider.notifier).update(data?.lines);
      },
      error: (error, stackTrace) {},
      loading: () {},
    );
  });

  final a = ref.watch(aBPointAProvider);
  final b = ref.watch(aBPointBProvider);

  if (a != null && b != null) {
    final points = [
      a.copyWith(bearing: a.initialBearingToSpherical(b)),
      b.copyWith(bearing: a.finalBearingToSpherical(b)),
    ];
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
      return ABLine(
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
      debugLabel: 'ABLine creation isolate',
    );

    final data = jsonDecode(creation);
    if (data is Map) {
      final abLine = ABLine.fromJson(Map<String, dynamic>.from(data));
      return abLine;
    }
  }

  return null;
}
