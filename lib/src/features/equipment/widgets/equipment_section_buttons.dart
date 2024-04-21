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


import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget with buttons for toggling active sections of equipment.
class EquipmentSectionButtons extends ConsumerWidget {
  /// A widget with buttons for toggling active sections of equipment.
  const EquipmentSectionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (entry) =>
            entry.values.where((equipment) => equipment.sections.isNotEmpty),
      ),
    );
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    return equipments.isEmpty
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: equipments
                .where((element) => element.sections.isNotEmpty)
                .map(
                  (equipment) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: switch (equipment.sections.length == 1) {
                      true => SizedBox(
                          height: 40,
                          width: 80,
                          child: Material(
                            type: MaterialType.button,
                            clipBehavior: Clip.antiAlias,
                            color: equipment.sections.first.active
                                ? equipment.sections.first.color ?? Colors.green
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              splashFactory: theme.splashFactory,
                              splashColor: equipment.sections.first.active
                                  ? Colors.red
                                  : equipment.sections.first.color ??
                                      Colors.green,
                              onTap: () => ref
                                  .read(
                                simInputProvider.notifier,
                              )
                                  .send(
                                (
                                  uuid: equipment.uuid,
                                  activeSections: (equipment
                                        ..toggleSection(
                                          0,
                                        ))
                                      .sectionActivationStatus
                                ),
                              ),
                              child: Center(
                                child: TextWithStroke(
                                  equipment.sections.first.active
                                      ? 'On'
                                      : 'Off',
                                  style: textStyle,
                                  strokeWidth: 3.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      false => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.center,
                              children: [
                                Material(
                                  type: MaterialType.button,
                                  clipBehavior: Clip.antiAlias,
                                  color: switch (theme.brightness) {
                                    Brightness.light => Colors.red.shade200,
                                    Brightness.dark => Colors.red.darken(45),
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    splashFactory: theme.splashFactory,
                                    splashColor: Colors.red,
                                    onTap: () => ref
                                        .read(simInputProvider.notifier)
                                        .send(
                                      (
                                        uuid: equipment.uuid,
                                        activeSections: (equipment
                                              ..deactivateAll())
                                            .sectionActivationStatus,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: CustomPaint(
                                              painter: _CrossPainter(),
                                              size: Size.square(10),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                            ),
                                            child: TextWithStroke(
                                              'Deactivate all',
                                              style: textStyle,
                                              strokeWidth: 3.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  type: MaterialType.button,
                                  clipBehavior: Clip.antiAlias,
                                  color: switch (theme.brightness) {
                                    Brightness.light => Colors.green.shade200,
                                    Brightness.dark => Colors.green.darken(30),
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    splashFactory: theme.splashFactory,
                                    splashColor: Colors.green,
                                    onTap: () => ref
                                        .read(simInputProvider.notifier)
                                        .send(
                                      (
                                        uuid: equipment.uuid,
                                        activeSections: (equipment
                                              ..activateAll())
                                            .sectionActivationStatus,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: CustomPaint(
                                              painter: _CheckmarkPainter(),
                                              size: Size.square(12),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),
                                            child: TextWithStroke(
                                              'Activate all',
                                              style: textStyle,
                                              strokeWidth: 3.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: equipment.sections
                                    .map(
                                      (section) => SizedBox(
                                        height: 40,
                                        width: 80,
                                        child: Material(
                                          type: MaterialType.button,
                                          clipBehavior: Clip.antiAlias,
                                          color: section.active
                                              ? section.color ?? Colors.green
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: InkWell(
                                            splashFactory: theme.splashFactory,
                                            splashColor: section.active
                                                ? Colors.red
                                                : section.color ?? Colors.green,
                                            onTap: () => ref
                                                .read(
                                              simInputProvider.notifier,
                                            )
                                                .send(
                                              (
                                                uuid: equipment.uuid,
                                                activeSections: (equipment
                                                      ..toggleSection(
                                                        section.index,
                                                      ))
                                                    .sectionActivationStatus
                                              ),
                                            ),
                                            child: Center(
                                              child: TextWithStroke(
                                                '${section.index + 1}',
                                                style: textStyle,
                                                strokeWidth: 3.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                    },
                  ),
                )
                .toList(),
          );
  }
}

class _CrossPainter extends CustomPainter {
  const _CrossPainter({
    // ignore: unused_element
    this.fillColor = Colors.red, 
    // ignore: unused_element
    this.strokeColor = Colors.black,
    // ignore: unused_element
    this.strokeWidth = 10,
  });

  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth / 3
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawLine(Offset.zero, Offset(size.width, size.height), strokePaint)
      ..drawLine(Offset(0, size.height), Offset(size.width, 0), strokePaint)
      ..drawLine(Offset.zero, Offset(size.width, size.height), fillPaint)
      ..drawLine(Offset(0, size.height), Offset(size.width, 0), fillPaint);
  }

  @override
  bool shouldRepaint(_CrossPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CrossPainter oldDelegate) => false;
}

class _CheckmarkPainter extends CustomPainter {
  const _CheckmarkPainter({
    // ignore: unused_element
    this.fillColor = Colors.green,
    // ignore: unused_element
    this.strokeColor = Colors.black,
    // ignore: unused_element
    this.strokeWidth = 10,
  });

  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth / 3
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawLine(
        Offset(0, size.height * 0.4),
        Offset(size.width * 0.3, size.height),
        strokePaint,
      )
      ..drawLine(
        Offset(size.width * 0.3, size.height),
        Offset(size.width, size.height * 0.3),
        strokePaint,
      )
      ..drawLine(
        Offset(0, size.height * 0.4),
        Offset(size.width * 0.3, size.height),
        fillPaint,
      )
      ..drawLine(
        Offset(size.width * 0.3, size.height),
        Offset(size.width, size.height * 0.3),
        fillPaint,
      );
  }

  @override
  bool shouldRepaint(_CrossPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CrossPainter oldDelegate) => false;
}
