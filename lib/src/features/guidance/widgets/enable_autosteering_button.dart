import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
        final enabled = ref.watch(autoSteerEnabledProvider);

        return FloatingActionButton(
          onPressed: ref.read(autoSteerEnabledProvider.notifier).toggle,
          backgroundColor: switch (enabled) {
            true => Colors.orange,
            false => Colors.green,
          },
          foregroundColor: switch (enabled) {
            true => Colors.black,
            false => Colors.white
          },
          tooltip: switch (enabled) {
            false => 'Enable auto steering',
            true => 'Disable auto steering'
          },
          child: Stack(
            children: [
              Align(
                heightFactor: 1.5,
                child: Icon(
                  switch (enabled) {
                    true => Icons.pause_circle,
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
                        color: switch (enabled) {
                          true => Colors.black,
                          false => Colors.white
                        },
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
