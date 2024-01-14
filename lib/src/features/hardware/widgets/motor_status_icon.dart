import 'dart:math';

import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  double motorRotationAngle = 0;
  int prevTickerTimeMicroseconds = 0;
  late final motorRotationTicker = Ticker(
    (elapsed) {
      final rpm = ref.watch(steeringMotorActualRPMProvider) ?? 0;
      if (rpm.abs() > 0) {
        final tick =
            (elapsed.inMicroseconds - prevTickerTimeMicroseconds) / 1e6;
        final radiansPerTick = 2 * pi * (-rpm / 60) * tick;
        setState(
          () => motorRotationAngle =
              (motorRotationAngle + radiansPerTick) % (2 * pi),
        );
      }
      prevTickerTimeMicroseconds = elapsed.inMicroseconds;
    },
  );

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

    final targetRPM = ref.watch(steeringMotorTargetRPMProvider);
    if (targetRPM != null) {
      textLines.add('Target RPM: ${targetRPM.toStringAsFixed(1)}');
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

    return textLines.join('\n');
  }

  @override
  void initState() {
    super.initState();
    motorRotationTicker.start();
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

            return Stack(
              children: [
                Align(
                  child: Transform.rotate(
                    angle: motorRotationAngle,
                    child: Icon(
                      Icons.settings_backup_restore,
                      size: widget.size,
                      color: switch (motorStatus) {
                        MotorStatus.running => Colors.green,
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
