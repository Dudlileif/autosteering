import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gnss_data_providers.g.dart';

/// A provider for the quality of last GNSS position update.
@riverpod
class GnssCurrentSentence extends _$GnssCurrentSentence {
  Timer? _resetTimer;
 
  @override
  GnssPositionCommonSentence? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
      if (previous?.quality != next?.quality) {
        Logger.instance
            .i(
          '''GNSS fix quality: ${GnssFixQuality.values[next?.quality ?? 0]}, NMEA code: ${next?.quality}''',
        );
      }
      if (previous?.numSatellites != next?.numSatellites) {
        Logger.instance.i(
          'GNSS satellite count: ${next?.numSatellites}',
        );
      }
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(GnssPositionCommonSentence? value) => Future(() => state = value);

}



/// A provider for the frequency of the GNSS updates.
@riverpod
class GnssCurrentFrequency extends _$GnssCurrentFrequency {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the time of the last GNSS update.
@riverpod
class GnssLastUpdateTime extends _$GnssLastUpdateTime {
  @override
  ({DateTime device, DateTime? receiver, Duration? delay})? build() => null;

  /// Updates [state] to [value].
  void update(
    ({DateTime device, DateTime? receiver, Duration? delay})? value,
  ) =>
      Future(() => state = value);
}
