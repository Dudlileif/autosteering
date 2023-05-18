import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for options related to the
/// simulated vehicle.
class VehicleSimMenu extends ConsumerWidget {
  const VehicleSimMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);

    return SubmenuButton(
      menuChildren: [
        CheckboxListTile(
          value: vehicle is Tractor,
          onChanged: (value) {
            ref.read(simVehicleInputProvider.notifier).send(
                  Tractor(
                    position: vehicle.position,
                    antennaHeight: 2.822,
                    heading: vehicle.heading,
                    length: 4.358,
                    width: 2.360,
                    wheelBase: 2.550,
                    solidAxleDistance: 1.275,
                    trackWidth: 1.8,
                    minTurningRadius: 4.25,
                    steeringAngleMax: 32,
                    simulated: true,
                  ),
                );
            ref.invalidate(debugTravelledPathListProvider);
          },
          title: Text(
            'Tractor',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        CheckboxListTile(
          value: vehicle is ArticulatedTractor,
          onChanged: (value) {
            ref.read(simVehicleInputProvider.notifier).send(
                  ArticulatedTractor(
                    position: vehicle.position,
                    antennaHeight: 2.822,
                    heading: vehicle.heading,
                    length: 4.358,
                    width: 2.360,
                    pivotToAntennaDistance: 1,
                    pivotToFrontAxle: 2,
                    pivotToRearAxle: 2,
                    trackWidth: 2.75,
                    minTurningRadius: 6,
                    steeringAngleMax: 20,
                    simulated: true,
                  ),
                );
            ref.invalidate(debugTravelledPathListProvider);
          },
          title: Text(
            'Articulated tractor',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        CheckboxListTile(
          value: vehicle is Harvester,
          onChanged: (value) {
            ref.read(simVehicleInputProvider.notifier).send(
                  Harvester(
                    position: vehicle.position,
                    antennaHeight: 2.822,
                    heading: vehicle.heading,
                    length: 4.358,
                    width: 2.360,
                    wheelBase: 3.550,
                    solidAxleDistance: 1.275,
                    trackWidth: 1.8,
                    minTurningRadius: 4.25,
                    steeringAngleMax: 45,
                    simulated: true,
                  ),
                );
            ref.invalidate(debugTravelledPathListProvider);
          },
          title: Text(
            'Harvester',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        )
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.agriculture),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Vehicle',
              style: Theme.of(context).menuButtonWithChildrenText,
            ),
          ),
        ],
      ),
    );
  }
}
