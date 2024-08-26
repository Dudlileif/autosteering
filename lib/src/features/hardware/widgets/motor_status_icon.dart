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

import 'dart:math';

import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

/// An icon with extendable menu for showing the status of the steering motor.
/// The icon will spin following the motor's RPM.
///
/// A detailed overlay can be toggled by pressing/tapping the icon.
class MotorStatusIcon extends ConsumerStatefulWidget {
  /// An icon with extendable menu for showing the status of the steering
  /// motor. The icon will spin following the motor's RPM.
  ///
  /// A detailed overlay can be toggled on and off by pressing/tapping the icon.
  ///
  /// [size] if the size of the icon.
  const MotorStatusIcon({super.key, this.size});

  /// The size of the icon.
  final double? size;

  @override
  ConsumerState<MotorStatusIcon> createState() => _MotorStatusIconState();
}

class _MotorStatusIconState extends ConsumerState<MotorStatusIcon>
    with SingleTickerProviderStateMixin {
  final portalController = OverlayPortalController();

  String get message {
    final textLines = <String>[];
    final motorStatus = ref.watch(steeringMotorStatusProvider);
    if (motorStatus != null) {
      textLines.add(motorStatus.text);
    }

    final targetSteeringAngle = ref.watch(vehicleSteeringAngleTargetProvider);
    if (targetSteeringAngle != null) {
      textLines.add(
        'Steering target: ${targetSteeringAngle.toStringAsFixed(1)}°',
      );
    }

    final actualSteeringAngle =
        ref.watch(mainVehicleProvider.select((value) => value.steeringAngle));
    textLines.add(
      'Steering actual: ${actualSteeringAngle.toStringAsFixed(1)}°',
    );

    if (targetSteeringAngle != null) {
      textLines.add(
        '''Steering Δ: ${(targetSteeringAngle - actualSteeringAngle).toStringAsFixed(1)}°''',
      );
    }

    final wasReading = ref
        .watch(mainVehicleProvider.select((value) => value.was.reading.value));
    textLines.add(
      'WAS reading: $wasReading',
    );
    final wasTarget = ref.watch(steeringMotorWasTargetProvider);
    if (wasTarget != null) {
      textLines.add('WAS target: $wasTarget');
    }

    final actualRPM = ref.watch(steeringMotorActualRPMProvider);
    if (actualRPM != null) {
      textLines.add('Actual RPM: ${actualRPM.toStringAsFixed(1)}');
    }

    final currentScaleValue = ref.watch(steeringMotorCurrentScaleProvider);
    if (currentScaleValue != null) {
      textLines.add('CS: $currentScaleValue');
    }

    final stallguardValue = ref.watch(steeringMotorStallguardProvider);
    if (stallguardValue != null) {
      textLines.add('Stallguard: $stallguardValue');
    }

    final calibrationTarget = ref.watch(steeringMotorTargetRotationProvider);
    if (calibrationTarget != null) {
      textLines.add('Target: $calibrationTarget');
    }

    final rotation = ref.watch(steeringMotorRotationProvider);
    if (rotation != null) {
      textLines.add('Rotation: $rotation');
    }

    final stepsMinCenter =
        ref.watch(steeringMotorStepsPerWasIncrementMinToCenterProvider);

    final stepsCenterMax =
        ref.watch(steeringMotorStepsPerWasIncrementCenterToMaxProvider);

    if (stepsMinCenter != null || stepsCenterMax != null) {
      textLines.add('Steps / increment');
    }
    if (stepsMinCenter != null) {
      textLines.add('Min-Center: $stepsMinCenter');
    }
    if (stepsCenterMax != null) {
      textLines.add('Center-Max: $stepsCenterMax');
    }

    return textLines.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => switch (portalController.isShowing) {
        true => portalController.hide(),
        false => portalController.show(),
      },
      child: OverlayPortal(
        controller: portalController,
        overlayChildBuilder: (context) {
          // The render box of the InkWell/icon widget. Use this to position
          // the tooltip.
          final box = this.context.findRenderObject()! as RenderBox;
          final target = box.localToGlobal(box.size.center(Offset.zero));
          return Positioned(
            top: target.dy + box.size.height / 2 + 8,
            right: 0,
            child: DecoratedBox(
              decoration: Theme.of(context).tooltipTheme.decoration ??
                  const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          );
        },
        child: Consumer(
          builder: (context, ref, child) {
            final motorStatus = ref.watch(steeringMotorStatusProvider);
            final motorRotationAngle = ref.watch(
                  mainVehicleProvider.select(
                    (value) => value.steeringAngle / value.steeringAngleMax,
                  ),
                ) *
                3.5 *
                pi;
            return Stack(
              children: [
                Align(
                  child: Transform.rotate(
                    angle: motorRotationAngle,
                    child: Icon(
                      Symbols.search_hands_free,
                      weight: 1000,
                      size: widget.size,
                      color: switch (motorStatus) {
                        MotorStatus.running => Colors.green,
                        MotorStatus.standby => Colors.blue,
                        MotorStatus.stalled => Colors.orange,
                        MotorStatus.disabled => Colors.red,
                        MotorStatus.freeWheeling => Colors.blue,
                        MotorStatus.noCommand => Colors.pink,
                        null => Colors.grey,
                      },
                      shadows: [
                        Shadow(offset: Offset(sin(motorRotationAngle), 0)),
                        Shadow(offset: Offset(0, cos(motorRotationAngle))),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
