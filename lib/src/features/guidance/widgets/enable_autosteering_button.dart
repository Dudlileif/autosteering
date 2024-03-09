import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A button for enabling/disabling auto steering.
class EnableAutosteeringButton extends StatelessWidget {
  /// A button for enabling/disabling auto steering.

  const EnableAutosteeringButton({super.key});

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
            AutosteeringState.disabled => Colors.grey.shade700,
            AutosteeringState.standby => Colors.blue,
            AutosteeringState.enabled => Colors.green,
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
                child: SvgPicture.asset(
                  'assets/icons/autosteering_base.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 30,
                  width: 30,
                ),
              
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(      
                  switch (state) {
                    AutosteeringState.disabled => 'OFF',
                    AutosteeringState.standby => 'STBY',
                    AutosteeringState.enabled => 'AUTO',
                  },
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Noto Sans Mono',
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
