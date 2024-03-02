import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A button for enabling/disabling auto steering.
class EnableAutosteeringButton extends StatelessWidget {
  /// A button for enabling/disabling auto steering.

  const EnableAutosteeringButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(activeAutosteeringStateProvider);

        return FloatingActionButton(
          onPressed: () => ref
              .read(simInputProvider.notifier)
              .send((enableAutoSteer: state == AutosteeringState.disabled)),
          backgroundColor: switch (state) {
            AutosteeringState.disabled => Colors.green,
            AutosteeringState.standby => Colors.blue,
            AutosteeringState.enabled => Colors.red,
          },
          foregroundColor: Colors.white,
          tooltip: switch (state != AutosteeringState.disabled) {
            false => 'Enable auto steering',
            true => 'Disable auto steering'
          },
          child: Stack(
            children: [
              Align(
                heightFactor: 1.5,
                child: Icon(
                  switch (state != AutosteeringState.disabled) {
                    true => Icons.stop_circle,
                    false => Icons.play_circle
                  },
                  size: 32,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'AUTO',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
