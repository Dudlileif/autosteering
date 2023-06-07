import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main map widget with overlayed widgets (buttons, gauges).
class MapAndGaugeStackView extends ConsumerWidget {
  const MapAndGaugeStackView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const map = MainMap();

    return Stack(
      children: [
        switch (ref.watch(mapUse3DPerspectiveProvider)) {
          false => map,
          true => PerspectiveWithOverflow(
              perspectiveAngle: ref.watch(map3DPerspectiveAngleProvider),
              widthFactor: 1.5,
              heightFactor: 3,
              child: map,
            ),
        },
        const Align(
          alignment: Alignment.bottomRight,
          child: MapContributionWidget(),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: MapControlButtons(),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: VehicleSimScreenControls(),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: BasicVehicleGauges(),
          ),
        ),
        if (ref.watch(displayPurePursuitProvider) != null)
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      ref
                          .watch(displayPurePursuitProvider)!
                          .perpendicularDistance(ref.watch(mainVehicleProvider))
                          .toStringAsFixed(3),
                    );
                  },
                ),
              ),
            ),
          )
      ],
    );
  }
}
