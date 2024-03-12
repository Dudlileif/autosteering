import 'dart:async';
import 'dart:typed_data';

import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/models/simulator_core_state.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';

export 'simulator_core_none.dart'
    if (dart.library.io) 'simulator_core_native.dart'
    if (dart.library.js_interop) 'simulator_core_web.dart';

/// An enumerator used to signal how a value in the [SimulatorCoreState]
/// should change.
enum SimInputChange {
  /// Increase the value.
  increase,

  /// Decrease the value.
  decrease,

  /// Keep the current value.
  hold,

  /// Resets the value to 0.
  reset,
}

/// A base class with common methods for the simulator core regardless of
/// native or web platform.
class SimulatorCoreBase {
  /// Targets 60 hz => 16666.66... micro seconds
  static const defaultTargetPeriodMicroSeconds = 16667;

  /// Handles data/events that are received over the network.
  static void networkListener(
    Uint8List? data,
    MessageDecoder decoder,
    SimulatorCoreState state,
    StreamController<dynamic> updateMainThreadStream,
  ) {
    if (data != null) {
      final messages = decoder.decode(data);

      for (final message in messages) {
        if (message is ImuReading ||
            message is ({Geographic gnssPosition, DateTime time}) ||
            message is WasReading) {
          state.handleMessage(message);
        } else if (message != null) {
          updateMainThreadStream.add(message);
          if (message is GnssPositionCommonSentence) {
            state.handleMessage((gnssFixQuality: message.quality ?? 0));
          }
        }
      }
    }
  }

  /// Handles replaying of a previously recorded log.
  static void replayListener(
    String record,
    MessageDecoder decoder,
    SimulatorCoreState state,
    StreamController<dynamic> updateMainThreadStream,
  ) {
    for (final message in decoder.parseString(record)) {
      if (message is ImuReading ||
          message is ({Geographic gnssPosition, DateTime time}) ||
          message is WasReading) {
        state.handleMessage(message);
      } else if (message != null) {
        updateMainThreadStream.add(message);
        if (message is GnssPositionCommonSentence) {
          state.handleMessage((gnssFixQuality: message.quality ?? 0));
        }
      }
    }
  }
}
