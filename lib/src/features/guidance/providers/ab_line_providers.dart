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
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_line_providers.g.dart';

/// A provider for the AB-line.
@Riverpod(keepAlive: true)
Future<ABLine?> aBLine(ABLineRef ref) async {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != null) {
          ref.listenSelf((previous, next) {
            Logger.instance.i(
              '''ABLine created: A:${data.start}, B: ${data.end}, width:${data.width} m, bounded: ${data.boundary != null}, offsetsInsideBoundary: ${data.offsetsInsideBoundary?.toList()}''',
            );
          });
        } else if (previous?.value != null && data == null) {
          Logger.instance.i('ABLine deleted.');
        }
      },
      error: (error, stackTrace) => Logger.instance
          .e('Failed to create ABLine.', error: error, stackTrace: stackTrace),
      loading: () {},
    );
  });

  final a = ref.watch(aBPointAProvider);
  final b = ref.watch(aBPointBProvider);

  if (a != null && b != null) {
    final points = [
      a.copyWith(bearing: a.initialBearingToRhumb(b)),
      b.copyWith(bearing: a.finalBearingToRhumb(b)),
    ];
    final boundary = ref.read(
          configuredABTrackingProvider.select((value) => value?.boundary),
        ) ??
        ref.watch(bufferedFieldProvider).when(
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

/// A provider for the A+-line bearing.
@Riverpod(keepAlive: true)
class APlusLineBearing extends _$APlusLineBearing {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the A+-line.
@Riverpod(keepAlive: true)
Future<APlusLine?> aPlusLine(APlusLineRef ref) async {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != null) {
          ref.listenSelf((previous, next) {
            Logger.instance.i(
              '''APlusLine created: A:${data.start}, width: ${data.width} m, bounded: ${data.boundary != null}, offsetsInsideBoundary: ${data.offsetsInsideBoundary?.toList()}''',
            );
          });
        } else if (previous?.value != null && data == null) {
          Logger.instance.i('APlusLine deleted.');
        }
      },
      error: (error, stackTrace) => Logger.instance
          .e('Failed to create ABLine.', error: error, stackTrace: stackTrace),
      loading: () {},
    );
  });

  final bearing = ref.watch(aPlusLineBearingProvider) ??
      ref.read(mainVehicleProvider.select((value) => value.bearing));
  final start = ref.watch(aBPointAProvider)?.copyWith(bearing: bearing);

  if (start != null) {
    final boundary = ref.read(
          configuredABTrackingProvider.select((value) => value?.boundary),
        ) ??
        ref.watch(bufferedFieldProvider).when(
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
      return APlusLine(
        start: start,
        boundary: boundary,
        width: width,
        turningRadius: turningRadius,
        turnOffsetMinSkips: turnOffsetMinSkips,
        limitMode: limitMode,
      );
    }
    final json = await Future(
      () => jsonEncode({
        'start': start,
        'boundary': boundary?.toText(),
        'width': width,
        'turning_radius': turningRadius,
        'turn_offset_skips': turnOffsetMinSkips,
        'limit_mode': limitMode,
        'calculate_lines': true,
        'type': 'A+ Line',
      }),
    );

    final creation = await compute(
      ABTracking.createAndReturnABTrackingString,
      json,
      debugLabel: 'A+ Line creation isolate',
    );

    final data = jsonDecode(creation);
    if (data is Map) {
      final aPlusLine = APlusLine.fromJson(Map<String, dynamic>.from(data));
      return aPlusLine;
    }
  }

  return null;
}
