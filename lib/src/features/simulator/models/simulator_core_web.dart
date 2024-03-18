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

import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/models/simulator_core_state.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
class SimulatorCore {
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
  ) {
    updateMainStream.add(LogEvent(Level.info, 'Simulator Core worker spawned'));

    // The state of the simulation.
    final state = SimulatorCoreState(updateMainStream);

    DateTime? lastHardwareMessageTime;

    final messageDecoder = MessageDecoder();

    final streamController = StreamController<
        ({
          Vehicle? vehicle,
          num velocity,
          num bearing,
          num distance,
          PathTracking? pathTracking,
          ABTracking? abTracking,
          AutosteeringState autosteeringState,
          bool hardwareIsConnected,
        })>();

    var prevHardwareIsConnected = false;

    void simulationStep() {
      state.update();
      if (streamController.hasListener) {
        // Assume that hardware is connected if less than 500 ms since
        // last message.
        final hardwareIsConnected = DateTime.now()
                .difference(lastHardwareMessageTime ?? DateTime(0))
                .inMilliseconds <
            500;
        // If the state has changed we add the new state to the stream.
        if (state.didChange || hardwareIsConnected != prevHardwareIsConnected) {
          prevHardwareIsConnected = hardwareIsConnected;
          streamController.add(
            (
              vehicle: state.vehicle,
              velocity: state.gaugeVelocity,
              bearing: state.gaugeBearing,
              distance: state.distance,
              pathTracking: state.pathTracking,
              abTracking: state.abTracking,
              autosteeringState: state.autosteeringState,
              hardwareIsConnected: hardwareIsConnected,
            ),
          );
        }
      }
    }

    // A stream event generator that periodically updates the simulation and
    // sends the state.
    var simulationTimer = Timer.periodic(
      const Duration(
        microseconds: SimulatorCoreBase.defaultTargetPeriodMicroSeconds,
      ),
      (timer) => simulationStep(),
    );

    LogReplay? logReplay;
    StreamSubscription<String>? replayListener;

    // Handle the incoming messages.
    incomingEvents.listen((message) async {
      if (message is LogReplay) {
        logReplay = message;
        replayListener = logReplay?.replay.listen(
          (record) => SimulatorCoreBase.replayListener(
            record,
            messageDecoder,
            state,
            updateMainStream,
          ),
        )?..pause();
      } else if (message is ({bool replayPause})) {
        replayListener?.pause();
      } else if (message is ({bool replayResume})) {
        replayListener?.resume();
      } else if (message is ({bool replayCancel})) {
        await replayListener?.cancel();
      } else if (message is ({bool replayRestart})) {
        await replayListener?.cancel();
        replayListener = logReplay?.replay.listen(
          (record) => SimulatorCoreBase.replayListener(
            record,
            messageDecoder,
            state,
            updateMainStream,
          ),
        );
      } else if (message is ({int simulationTargetHz})) {
        if (message.simulationTargetHz > 0) {
          simulationTimer.cancel();
          simulationTimer = Timer.periodic(
            Duration(microseconds: (1e6 / message.simulationTargetHz).round()),
            (timer) => simulationStep(),
          );
        }
      } else {
        state.handleMessage(message);
      }
    });

    return streamController.stream;
  }
}
