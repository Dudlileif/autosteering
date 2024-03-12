import 'dart:async';
import 'dart:isolate';

import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
class SimulatorCore {
  /// Used on native platforms since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async =>
      throw UnimplementedError();

  /// Used in web version since multithreading isn't possible.
  ///
  /// This takes in the stream [incomingEvents] to get events/messages
  /// from the UI.
  static Stream<
      ({
        Vehicle? vehicle,
        num velocity,
        num bearing,
        num distance,
        PathTracking? pathTracking,
        ABTracking? abTracking,
        AutosteeringState autosteeringState,
        bool hardwareIsConnected,
      })> webWorker(
    Stream<dynamic> incomingEvents,
    StreamController<dynamic> updateMainStream,
  ) =>
      throw UnimplementedError();
}
