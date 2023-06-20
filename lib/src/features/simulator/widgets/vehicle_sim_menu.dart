import 'package:agopengps_flutter/src/features/common/common.dart';
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

    return MenuButtonWithChildren(
      icon: Icons.agriculture,
      text: 'Vehicle',
      menuChildren: [
        MenuButtonWithChildren(
          text: 'Type',
          menuChildren: [
            CheckboxListTile(
              value: vehicle is Tractor,
              onChanged: (value) {
                ref.read(simVehicleInputProvider.notifier).send(
                      // MF 5713S -ish
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
                        steeringAngleMax: 31,
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
                      // NH T9.700 -ish
                      ArticulatedTractor(
                        position: vehicle.position,
                        antennaHeight: 3.8,
                        heading: vehicle.heading,
                        length: 7.5,
                        width: 3,
                        pivotToAntennaDistance: 1,
                        pivotToFrontAxle: 1.6,
                        pivotToRearAxle: 1.8,
                        trackWidth: 2.75,
                        wheelDiameter: 2.1,
                        wheelWidth: 0.710,
                        minTurningRadius: 5.7,
                        steeringAngleMax: 38,
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
                      // MF Activa 7345
                      Harvester(
                        position: vehicle.position,
                        antennaHeight: 3.5,
                        heading: vehicle.heading,
                        length: 9,
                        width: 3.3,
                        wheelBase: 3.7,
                        solidAxleDistance: 1.275,
                        trackWidth: 2.2,
                        solidAxleWheelWidth: 0.65,
                        steeringAxleWheelWidth: 0.46,
                        steeringAxleWheelDiameter: 1.25,
                        minTurningRadius: 4.25,
                        steeringAngleMax: 35,
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
        ),
        CheckboxListTile(
          secondary: Text(
            'Auto center steering',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          value: ref.watch(simVehicleAutoCenterSteeringProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(simVehicleAutoCenterSteeringProvider.notifier)
                  .update(value: value)
              : null,
        ),
        CheckboxListTile(
          secondary: Text(
            'Auto slow down',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          value: ref.watch(simVehicleAutoSlowDownProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(simVehicleAutoSlowDownProvider.notifier)
                  .update(value: value)
              : null,
        )
      ],
    );
  }
}
