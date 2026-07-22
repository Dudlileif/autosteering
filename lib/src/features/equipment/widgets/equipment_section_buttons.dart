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

// Some colors are not overidden at the moment.
// ignore_for_file: unused_element_parameter

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// A widget with buttons for toggling active sections of equipment.
class EquipmentSectionButtons extends ConsumerWidget {
  /// A widget with buttons for toggling active sections of equipment.
  const EquipmentSectionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (entry) => entry.values.where(
          (equipment) =>
              equipment.sections.any((element) => element.workingWidth > 0),
        ),
      ),
    );

    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return equipments.isEmpty
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: equipments
                .map(
                  (equipment) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: switch (equipment.sections.length == 1) {
                      true => _SectionButton(
                        section: equipment.sections.first,
                        onTap: () => ref.read(simInputProvider.notifier).send((
                          id: equipment.id,
                          activeSections: (equipment..toggleSection(0))
                              .sectionActivationStatus,
                        )),
                        overrideOnText: strings.on.toUpperCase(),
                        overrideOffText: strings.off.toUpperCase(),
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
                                  onTap: () =>
                                      ref.read(simInputProvider.notifier).send((
                                        id: equipment.id,
                                        activeSections:
                                            (equipment..deactivateAll())
                                                .sectionActivationStatus,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 4),
                                          child: RepaintBoundary(
                                            child: CustomPaint(
                                              painter: _CrossPainter(),
                                              size: Size.square(10),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                          ),
                                          child: TextWithStroke(
                                            strings.deactivateAll,
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
                                  onTap: () =>
                                      ref.read(simInputProvider.notifier).send((
                                        id: equipment.id,
                                        activeSections:
                                            (equipment..activateAll())
                                                .sectionActivationStatus,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 4),
                                          child: RepaintBoundary(
                                            child: CustomPaint(
                                              painter: _CheckmarkPainter(),
                                              size: Size.square(12),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                          ),
                                          child: TextWithStroke(
                                            strings.activateAll,
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
                            child: _SectionButtons(equipment: equipment),
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

class _SectionButtons extends ConsumerWidget {
  const _SectionButtons({required this.equipment, super.key});
  final Equipment equipment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: equipment.sections
          .where((section) => section.workingWidth > 0)
          .map(
            (section) => _SectionButton(
              section: section,
              onTap: () => ref.read(simInputProvider.notifier).send((
                id: equipment.id,
                activeSections: (equipment..toggleSection(section.index))
                    .sectionActivationStatus,
              )),
            ),
          )
          .toList(),
    );
  }
}

class _SectionButton extends ConsumerStatefulWidget {
  const _SectionButton({
    required this.section,
    required this.onTap,
    this.overrideOnText,
    this.overrideOffText,
  });
  final Section section;
  final void Function() onTap;
  final String? overrideOnText;
  final String? overrideOffText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SectionButtonState();
}

class __SectionButtonState extends ConsumerState<_SectionButton> {
  bool prevActive = false;
  DateTime switchTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.section.active != prevActive) {
      switchTime = DateTime.now();
    }
    prevActive = widget.section.active;

    return AnimatedContainer(
      duration: Durations.short4,
      width: 80,
      height: 40,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: switch ((
          widget.section.active,
          DateTime.now().difference(switchTime),
        )) {
          (true, > Durations.short4) => Colors.green,
          (true, _) => Colors.green.darken(),
          (false, > Durations.short4) => Colors.grey,
          (false, _) => Colors.red,
        },
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashFactory: theme.splashFactory,
          splashColor: widget.section.active
              ? Colors.red
              : (widget.section.color ?? Colors.green).getShadeColor(
                  lighten: switch (theme.brightness) {
                    Brightness.light => true,
                    Brightness.dark => false,
                  },
                ),
          onTap: widget.onTap,
          child: Center(
            child: TextWithStroke(
              widget.section.active
                  ? widget.overrideOnText ?? '${widget.section.index + 1}'
                  : widget.overrideOffText ?? '${widget.section.index + 1}',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textStyle: theme.textTheme.bodyLarge,
              ),
              strokeWidth: 3.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  const _CrossPainter({
    this.fillColor = Colors.red,
    this.strokeColor = Colors.black,
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
    this.fillColor = Colors.green,
    this.strokeColor = Colors.black,
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
