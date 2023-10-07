import 'dart:async';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gnss_data_providers.g.dart';

/// A provider for the quality of last GNSS position update.
@riverpod
class GnssCurrentFixQuality extends _$GnssCurrentFixQuality {
  Timer? _resetTimer;
  // DateTime? _prev;
  @override
  GnssFixQuality build() {
    ref.listenSelf((previous, next) {
      // final now = DateTime.now();
      // if (_prev != null) {
      //   print(now.difference(_prev!).inMicroseconds);
      // }
      // _prev = now;
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
      if (previous != next) {
        Logger.instance
            .i('GPS fix quality: ${next.name}, NMEA code: ${next.nmeaValue}');
      }
    });

    return GnssFixQuality.notAvailable;
  }

  /// Updates [state] to [value].
  void update(GnssFixQuality value) => Future(() => state = value);

  /// Updates [state] to the [GnssFixQuality] that corresponds to [index].
  void updateByIndex(int index) => Future(
        () => state = GnssFixQuality.values.elementAtOrNull(index) ?? state,
      );
}

/// A provider for the quality of last GNSS position update.
@riverpod
class GnssCurrentNumSatellites extends _$GnssCurrentNumSatellites {
  Timer? _resetTimer;

  @override
  int? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        () {
          if (state != null) {
            Logger.instance.w('Too long since last GNSS update.');
          }
          ref.invalidateSelf();
        },
      );
      if (previous != next) {
        Logger.instance.i('GNSS satellite count: $next');
      }
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}

/// A provider for the HDOP (horizontal dilution of position) of the GNSS fix.
@riverpod
class GnssCurrentHdop extends _$GnssCurrentHdop {
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

/// A provider for the GNSS altifude.
@riverpod
class GnssCurrentAltitude extends _$GnssCurrentAltitude {
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
