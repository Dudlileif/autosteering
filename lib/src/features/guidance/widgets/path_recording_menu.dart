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

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';
import 'package:quiver/strings.dart';

/// An enumerator for what mode the recording should use.
enum _RecordingMode {
  automatic,
  manual;
}

/// A menu button with attached submenu for working with the path recording
/// and editing feature.
class PathRecordingMenu extends ConsumerStatefulWidget {
  /// A menu button with attached submenu for working with the path recording
  /// and editing feature.
  const PathRecordingMenu({super.key});

  @override
  ConsumerState<PathRecordingMenu> createState() => _PathRecordingMenuState();
}

class _PathRecordingMenuState extends ConsumerState<PathRecordingMenu> {
  var _recordingMode = _RecordingMode.automatic;

  @override
  void initState() {
    super.initState();
    ref.read(enablePathRecorderProvider.notifier).update(value: true);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(automaticPathRecordingProvider);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final settings = ref.watch(activePathRecordingSettingsProvider);

    final target = ref.watch(activePathRecordingTargetProvider);

    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: SizedBox(
        width: 300,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
          appBar: AppBar(
            scrolledUnderElevation: 0,
            primary: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${switch (target) {
                  PathRecordingTarget.abCurve => 'AB Curve',
                  PathRecordingTarget.field => 'Field',
                  PathRecordingTarget.pathTracking => 'Tracking'
                }} Recording'),
                Consumer(
                  builder: (context, ref, child) => CloseButton(
                    onPressed: () {
                      ref
                          .read(showPathRecordingMenuProvider.notifier)
                          .update(value: false);
                      ref
                          .read(enablePathRecorderProvider.notifier)
                          .update(value: false);
                    },
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: SegmentedButton<_RecordingMode>(
                    style: theme.segmentedButtonTheme.style?.copyWith(
                      visualDensity: VisualDensity.compact,
                    ),
                    showSelectedIcon: false,
                    onSelectionChanged: (values) => setState(() {
                      _recordingMode = values.first;
                      ref
                          .read(enableAutomaticPathRecorderProvider.notifier)
                          .update(value: false);
                    }),
                    selected: {_recordingMode},
                    segments: const [
                      ButtonSegment(
                        value: _RecordingMode.automatic,
                        label: Text('Automatic'),
                      ),
                      ButtonSegment(
                        value: _RecordingMode.manual,
                        label: Text('Manual'),
                      ),
                    ],
                  ),
                ),
              ),
              ...switch (_recordingMode) {
                _RecordingMode.automatic => [
                    Consumer(
                      builder: (context, ref, child) {
                        final enabled =
                            ref.watch(enableAutomaticPathRecorderProvider);
                        return MenuItemButton(
                          closeOnActivate: false,
                          leadingIcon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: enabled
                                ? const SizedBox.square(
                                    dimension: 24,
                                    child: CircularProgressIndicator(),
                                  )
                                : const Icon(Icons.play_arrow),
                          ),
                          onPressed: () {
                            ref
                                .read(
                                  enableAutomaticPathRecorderProvider.notifier,
                                )
                                .update(value: !enabled);
                            if (enabled) {
                              ref
                                  .read(showFinishedPathProvider.notifier)
                                  .update(value: true);
                            }
                          },
                          child: Text(
                            enabled ? 'Recording, tap to pause' : 'Record',
                            style: textStyle,
                          ),
                        );
                      },
                    ),
                    MenuItemButton(
                      closeOnActivate: false,
                      leadingIcon: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.check),
                      ),
                      onPressed: ref.watch(
                        pathRecordingListProvider
                            .select((value) => value.isNotEmpty),
                      )
                          ? () {
                              ref
                                  .read(
                                    enableAutomaticPathRecorderProvider
                                        .notifier,
                                  )
                                  .update(value: false);
                              ref
                                  .read(pathRecordingListProvider.notifier)
                                  .finishRecording();
                              ref
                                  .read(showFinishedPathProvider.notifier)
                                  .update(value: true);
                            }
                          : null,
                      child: Text(
                        'Finish recording',
                        style: textStyle,
                      ),
                    ),
                  ],
                _RecordingMode.manual => [
                    Consumer(
                      builder: (context, ref, child) {
                        return MenuItemButton(
                          closeOnActivate: false,
                          leadingIcon: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.add),
                          ),
                          onPressed: () =>
                              ref.read(pathRecordingListProvider.notifier).add(
                                    ref.read(
                                      mainVehicleProvider
                                          .select((value) => value.wayPoint),
                                    ),
                                    applySettings: true,
                                  ),
                          child: Text(
                            'Add point',
                            style: textStyle,
                          ),
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return MenuItemButton(
                          closeOnActivate: false,
                          leadingIcon: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.check),
                          ),
                          onPressed: ref.watch(
                            pathRecordingListProvider
                                .select((value) => value.isNotEmpty),
                          )
                              ? () {
                                  ref
                                      .read(pathRecordingListProvider.notifier)
                                      .finishRecording();
                                  ref
                                      .read(showFinishedPathProvider.notifier)
                                      .update(value: true);
                                }
                              : null,
                          child: Text(
                            'Finish recording',
                            style: textStyle,
                          ),
                        );
                      },
                    ),
                  ]
              },
              if (ref.watch(
                finishedPathRecordingListProvider
                    .select((value) => value != null && value.isNotEmpty),
              )) ...[
                MenuItemButton(
                  closeOnActivate: false,
                  leadingIcon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.check),
                  ),
                  onPressed: () {
                    switch (target) {
                      case PathRecordingTarget.abCurve:
                        ref
                          ..read(aBCurvePointsProvider.notifier).update(
                            ref.read(finishedPathRecordingListProvider),
                          )
                          ..read(showABTrackingProvider.notifier)
                              .update(value: true)
                          ..read(
                            showPathRecordingMenuProvider.notifier,
                          ).update(value: false)
                          ..read(enablePathRecorderProvider.notifier)
                              .update(value: false)
                          ..read(showFinishedPathProvider.notifier)
                              .update(value: false);
                      case PathRecordingTarget.field:
                        ref
                          ..read(fieldExteriorRingProvider.notifier).update(
                            ref
                                .read(finishedPathRecordingListProvider)
                                ?.map((e) => e.position)
                                .toList(),
                          )
                          ..invalidate(finishedPathRecordingListProvider);
                      case PathRecordingTarget.pathTracking:
                        ref
                          ..read(pathTrackingPointsProvider.notifier).update(
                            ref.watch(finishedPathRecordingListProvider),
                          )
                          ..read(showPathTrackingProvider.notifier)
                              .update(value: true)
                          ..read(
                            showPathRecordingMenuProvider.notifier,
                          ).update(value: false)
                          ..read(enablePathRecorderProvider.notifier)
                              .update(value: false)
                          ..read(showFinishedPathProvider.notifier)
                              .update(value: false)
                          ..invalidate(finishedPathRecordingListProvider);
                    }
                  },
                  child: Text(
                    switch (target) {
                      PathRecordingTarget.abCurve => 'Create AB curve',
                      PathRecordingTarget.field => 'Use as exterior boundary',
                      PathRecordingTarget.pathTracking =>
                        'Create path tracking',
                    },
                    style: textStyle,
                  ),
                ),
                if (target == PathRecordingTarget.field) ...[
                  MenuItemButton(
                    closeOnActivate: false,
                    leadingIcon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.add),
                    ),
                    onPressed: () => ref
                      ..read(fieldInteriorRingsProvider.notifier).addRing(
                        ref
                            .read(finishedPathRecordingListProvider)
                            ?.map((e) => e.position)
                            .toList(),
                      )
                      ..invalidate(finishedPathRecordingListProvider),
                    child: Text('Add interior boundary', style: textStyle),
                  ),
                ],
              ],
              if (target == PathRecordingTarget.field)
                if (ref.watch(
                  fieldExteriorRingProvider
                      .select((value) => value != null && value.length >= 3),
                ))
                  const _CreateFieldButton(),
              Consumer(
                builder: (context, ref, child) {
                  final distance = settings.lateralOffset;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lateral offset: ${distance.toStringAsFixed(1)} m',
                        style: textStyle,
                      ),
                      Slider.adaptive(
                        value: distance,
                        onChanged: (value) => ref
                            .read(
                              activePathRecordingSettingsProvider.notifier,
                            )
                            .update(
                              settings.copyWith(lateralOffset: value),
                            ),
                        min: -5,
                        max: 5,
                        divisions: 20,
                      ),
                    ],
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final distance = settings.longitudinalOffset;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Longitudinal offset: ${distance.toStringAsFixed(1)} m',
                        style: textStyle,
                      ),
                      Slider.adaptive(
                        value: distance,
                        onChanged: (value) => ref
                            .read(
                              activePathRecordingSettingsProvider.notifier,
                            )
                            .update(
                              settings.copyWith(
                                longitudinalOffset: value,
                              ),
                            ),
                        min: -5,
                        max: 5,
                        divisions: 20,
                      ),
                    ],
                  );
                },
              ),
              if (_recordingMode == _RecordingMode.automatic) ...[
                Consumer(
                  builder: (context, ref, child) {
                    final distance = settings.maxDistance;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '''Max distance: ${distance.toStringAsFixed(1)} m''',
                          style: textStyle,
                        ),
                        Slider.adaptive(
                          value: distance,
                          onChanged: (value) => ref
                              .read(
                                activePathRecordingSettingsProvider.notifier,
                              )
                              .update(
                                settings.copyWith(maxDistance: value),
                              ),
                          min: 1,
                          max: 100,
                          divisions: 99,
                        ),
                      ],
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final distance = settings.minDistance;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Min distance: ${distance.toStringAsFixed(1)} m',
                          style: textStyle,
                        ),
                        Slider.adaptive(
                          value: distance,
                          onChanged: (value) => ref
                              .read(
                                activePathRecordingSettingsProvider.notifier,
                              )
                              .update(
                                settings.copyWith(minDistance: value),
                              ),
                          min: 0.1,
                          max: 2,
                          divisions: 19,
                        ),
                      ],
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final angle = settings.maxBearingDifference;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '''Turn trigger angle: ${angle.toStringAsFixed(1)}°''',
                          style: textStyle,
                        ),
                        Slider.adaptive(
                          value: angle,
                          onChanged: (value) => ref
                              .read(
                                activePathRecordingSettingsProvider.notifier,
                              )
                              .update(
                                settings.copyWith(
                                  maxBearingDifference: value,
                                ),
                              ),
                          min: 0.1,
                          max: 2,
                          divisions: 19,
                        ),
                      ],
                    );
                  },
                ),
              ],
              if (ref.watch(
                finishedPathRecordingListProvider
                    .select((value) => value?.isNotEmpty ?? false),
              )) ...[
                Consumer(
                  child: Text(
                    'Show last recorded path',
                    style: textStyle,
                  ),
                  builder: (context, ref, child) => CheckboxListTile(
                    title: child,
                    secondary: const Icon(Icons.route),
                    value: ref.watch(showFinishedPathProvider),
                    onChanged: (value) => value != null
                        ? ref
                            .read(showFinishedPathProvider.notifier)
                            .update(value: value)
                        : null,
                  ),
                ),
                Consumer(
                  child: Text(
                    'Edit recorded path',
                    style: textStyle,
                  ),
                  builder: (context, ref, child) => CheckboxListTile(
                    title: child,
                    secondary: const Icon(Icons.edit),
                    value: ref.watch(editFinishedPathProvider),
                    onChanged: (value) => value != null
                        ? ref
                            .read(editFinishedPathProvider.notifier)
                            .update(value: value)
                        : null,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => MenuItemButton(
                    leadingIcon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.clear),
                    ),
                    onPressed: () {
                      ref
                          .read(finishedPathRecordingListProvider.notifier)
                          .clear();
                      if (ref.watch(
                        activeEditablePathTypeProvider.select(
                          (value) => value == EditablePathType.recordedPath,
                        ),
                      )) {
                        ref
                          ..invalidate(editablePathPointsProvider)
                          ..read(activeEditablePathTypeProvider.notifier)
                              .update(null)
                          ..invalidate(editFinishedPathProvider);
                      }
                    },
                    child: Text(
                      'Clear recorded path',
                      style: textStyle,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateFieldButton extends ConsumerWidget {
  const _CreateFieldButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.check),
      ),
      onPressed: () {
        ref.read(enablePathRecorderProvider.notifier).update(value: false);

        unawaited(
          showDialog<void>(
            context: context,
            builder: (context) {
              var name = '';
              return StatefulBuilder(
                builder: (context, setState) => SimpleDialog(
                  title: const Text('Name the field'),
                  contentPadding: const EdgeInsets.only(
                    left: 24,
                    top: 12,
                    right: 24,
                    bottom: 16,
                  ),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.label_outline),
                        labelText: 'Name',
                      ),
                      initialValue: name,
                      onChanged: (value) => setState(() => name = value),
                      onFieldSubmitted: (value) => setState(() => name = value),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => isBlank(value)
                          ? '''No name entered! Please enter a name so that the field can be saved!'''
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Consumer(
                        builder: (context, ref, child) => FilledButton(
                          onPressed: () {
                            Timer(
                                const Duration(
                                  milliseconds: 100,
                                ), () {
                              final exteriorRing = ref.read(
                                fieldExteriorRingProvider,
                              );
                              final interiorRings = ref.read(
                                    fieldInteriorRingsProvider,
                                  ) ??
                                  [];
                              if (exteriorRing != null) {
                                final field = Field(
                                  name: name,
                                  polygon: Polygon([
                                    PositionSeries.from(
                                      exteriorRing,
                                    ),
                                    ...interiorRings.map(
                                      PositionSeries.from,
                                    ),
                                  ]),
                                  boundingBox: GeoBox.from(
                                    exteriorRing,
                                  ),
                                );
                                ref
                                  ..read(
                                    saveFieldProvider(field),
                                  )
                                  ..read(
                                    activeFieldProvider.notifier,
                                  ).update(field)
                                  ..read(showFieldProvider.notifier)
                                      .update(value: true)
                                  ..read(
                                    showPathRecordingMenuProvider.notifier,
                                  ).update(value: false)
                                  ..read(enablePathRecorderProvider.notifier)
                                      .update(value: false)
                                  ..read(showFinishedPathProvider.notifier)
                                      .update(value: false)
                                  ..invalidate(fieldExteriorRingProvider)
                                  ..invalidate(fieldInteriorRingsProvider);
                              }
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save field'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      child: Text(
        'Create field',
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
    );
  }
}

/// A draggable version of [PathRecordingMenu], typically used as
/// a child of a [Stack] that is a child of a [LayoutBuilder].
class DraggablePathRecordingMenu extends ConsumerStatefulWidget {
  /// A draggable version of [PathRecordingMenu], typically used as
  /// a child of a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.
  const DraggablePathRecordingMenu({required this.constraints, super.key});

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DraggablePathRecordingMenuState();
}

class _DraggablePathRecordingMenuState
    extends ConsumerState<DraggablePathRecordingMenu> {
  late Offset offset = ref.read(pathRecordingMenuUiOffsetProvider);

  @override
  Widget build(BuildContext context) => Positioned(
        left: clampDouble(
          offset.dx,
          0,
          widget.constraints.maxWidth - 380,
        ),
        top: clampDouble(offset.dy, 0, widget.constraints.maxHeight - 350),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: min(
              700,
              widget.constraints.maxHeight -
                  clampDouble(
                    offset.dy,
                    0,
                    widget.constraints.maxHeight - 350,
                  ),
            ),
            child: LongPressDraggable(
              onDragUpdate: (update) => setState(
                () => offset = Offset(
                  offset.dx + update.delta.dx,
                  offset.dy + update.delta.dy,
                ),
              ),
              onDragEnd: (details) => ref
                  .read(
                    pathRecordingMenuUiOffsetProvider.notifier,
                  )
                  .update(
                    Offset(
                      clampDouble(
                        offset.dx,
                        0,
                        widget.constraints.maxWidth - 380,
                      ),
                      clampDouble(
                        offset.dy,
                        0,
                        widget.constraints.maxHeight - 350,
                      ),
                    ),
                  ),
              childWhenDragging: const SizedBox.shrink(),
              feedback: const Opacity(
                opacity: 0.7,
                child: SizedBox(
                  height: 700,
                  child: PathRecordingMenu(),
                ),
              ),
              child: const PathRecordingMenu(),
            ),
          ),
        ),
      );
}
