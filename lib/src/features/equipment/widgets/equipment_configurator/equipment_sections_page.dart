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
import 'package:autosteering/src/features/theme/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's sections.
class EquipmentSectionsPage extends ConsumerWidget {
  /// A page for configuring the equipment's sections.
  const EquipmentSectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, child) {
          final equipment = ref.watch(configuredEquipmentProvider);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sections',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: TextFormField(
                    controller: TextEditingController(
                      text: ref.read(
                        configuredEquipmentProvider.select(
                          (value) => value.sections.length.toString(),
                        ),
                      ),
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.numbers),
                      labelText: 'Number of sections',
                    ),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      final sections =
                          int.tryParse(value.replaceAll(',', '.')) ?? 1;

                      ref.read(configuredEquipmentProvider.notifier).update(
                            equipment.copyWith(
                              sections: List.generate(
                                sections,
                                (index) => Section(index: index),
                              ),
                            ),
                          );
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '''Total width: ${ref.watch(configuredEquipmentProvider.select((value) => value.width))} m''',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              if (equipment.sections.length >= 2)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 220),
                          child: const _SectionWidthExpansionTile(),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 275),
                          child: const _SectionWorkingWidthExpansionTile(),
                        ),
                      ],
                    ),
                  ),
                ),
              if (equipment.sections.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Builder(
                    builder: (context) {
                      final controller = ScrollController();
                      return Column(
                        children: [
                          ListenableBuilder(
                            listenable: controller,
                            builder: (context, child) => switch ((controller
                                            .positions
                                            .firstOrNull
                                            ?.maxScrollExtent ??
                                        0) >
                                    0 ||
                                equipment.sections.length >= 5) {
                              true => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () => controller.animateTo(
                                        0,
                                        duration: Durations.long4,
                                        curve: Curves.easeInOutCubicEmphasized,
                                      ),
                                      child: const Text('1'),
                                    ),
                                    TextButton(
                                      onPressed: () => controller.animateTo(
                                        controller.positions.first
                                                .maxScrollExtent /
                                            2,
                                        duration: Durations.long4,
                                        curve: Curves.easeInOutCubicEmphasized,
                                      ),
                                      child: Text(
                                        '''${(equipment.sections.length / 2).ceil()}''',
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.animateTo(
                                          controller
                                              .positions.first.maxScrollExtent,
                                          duration: Durations.long4,
                                          curve:
                                              Curves.easeInOutCubicEmphasized,
                                        );
                                      },
                                      child:
                                          Text('${equipment.sections.length}'),
                                    ),
                                  ],
                                ),
                              false => const SizedBox.shrink(),
                            },
                          ),
                          Scrollbar(
                            scrollbarOrientation: ScrollbarOrientation.top,
                            controller: controller,
                            interactive: Device.isDesktop || Device.isWeb,
                            thumbVisibility: Device.isDesktop || Device.isWeb,
                            trackVisibility: Device.isDesktop || Device.isWeb,
                            radius: const Radius.circular(8),
                            child: Consumer(
                              builder: (context, ref, child) {
                                var heightModifier = 0.0;
                                if (equipment.sections.length > 1) {
                                  heightModifier += ref.watch(
                                    configuredEquipmentEqualWidthsProvider,
                                  )
                                      ? 1
                                      : 0;
                                  heightModifier += ref.watch(
                                    configuredEquipmentEqualWorkingWidthsProvider,
                                  )
                                      ? 1
                                      : 0;
                                }

                                return AnimatedContainer(
                                  duration: Durations.medium1,
                                  height: 350 - 80 * heightModifier,
                                  child: CustomScrollView(
                                    primary: false,
                                    controller: controller,
                                    scrollDirection: Axis.horizontal,
                                    // cacheExtent: equipment.sections.length * 300,
                                    slivers: [
                                      SliverList.builder(
                                        itemCount: equipment.sections.length,
                                        itemBuilder: (context, index) {
                                          return _SectionConfigurator(
                                            index,
                                            singleSection:
                                                equipment.sections.length == 1,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionWidthExpansionTile extends ConsumerStatefulWidget {
  const _SectionWidthExpansionTile();

  @override
  ConsumerState<_SectionWidthExpansionTile> createState() =>
      _SectionWidthExpansionTileState();
}

class _SectionWidthExpansionTileState
    extends ConsumerState<_SectionWidthExpansionTile> {
  final key = GlobalKey();

  final textField = Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Consumer(
      builder: (context, ref, child) {
        final equipment = ref.watch(configuredEquipmentProvider);
        return TextFormField(
          enabled: ref.watch(
            configuredEquipmentEqualWidthsProvider,
          ),
          controller: TextEditingController(
            text: '${equipment.sections.first.width}',
          ),
          decoration: const InputDecoration(
            labelText: 'Section width',
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          onFieldSubmitted: (value) {
            final newWidth = double.tryParse(
              value.replaceAll(',', '.'),
            )?.abs();

            if (newWidth != null) {
              ref
                  .read(
                    configuredEquipmentProvider.notifier,
                  )
                  .update(
                    equipment.copyWith(
                      sections: equipment.sections
                          .map(
                            (section) => section..width = newWidth,
                          )
                          .toList(),
                    ),
                  );
            }
          },
        );
      },
    ),
  );

  late final widgets = [
    Consumer(
      builder: (context, ref, child) => CheckboxListTile(
        enabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.sections.length >= 2),
        ),
        title: const Text('Equal widths'),
        value: ref.watch(configuredEquipmentEqualWidthsProvider),
        onChanged: (value) => value != null
            ? ref
                .read(configuredEquipmentEqualWidthsProvider.notifier)
                .update(value: value)
            : null,
      ),
    ),
    if (ref.read(configuredEquipmentEqualWidthsProvider)) textField,
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen(configuredEquipmentEqualWidthsProvider, (previous, next) {
      final state = key.currentState;
      if (state is AnimatedListState) {
        if (next) {
          widgets.add(textField);
          state.insertItem(1, duration: Durations.medium1);
        } else {
          widgets.removeLast();
          state.removeItem(
            1,
            (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: textField,
            ),
          );
        }
      }
    });

    return AnimatedContainer(
      duration: Durations.medium1,
      height: 80 + (ref.watch(configuredEquipmentEqualWidthsProvider) ? 80 : 0),
      child: AnimatedList(
        key: key,
        initialItemCount: widgets.length,
        itemBuilder: (context, index, animation) => SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Easing.emphasizedAccelerate,
          ),
          child: widgets[index],
        ),
      ),
    );
  }
}

class _SectionWorkingWidthExpansionTile extends ConsumerStatefulWidget {
  const _SectionWorkingWidthExpansionTile();

  @override
  ConsumerState<_SectionWorkingWidthExpansionTile> createState() =>
      _SectionWorkingWidthExpansionTileState();
}

class _SectionWorkingWidthExpansionTileState
    extends ConsumerState<_SectionWorkingWidthExpansionTile> {
  final key = GlobalKey();

  final textField = Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Consumer(
      builder: (context, ref, child) {
        final equipment = ref.watch(configuredEquipmentProvider);
        return TextFormField(
          enabled: ref.watch(
            configuredEquipmentEqualWorkingWidthsProvider,
          ),
          controller: TextEditingController(
            text: '${equipment.sections.first.workingWidth}',
          ),
          decoration: const InputDecoration(
            labelText: 'Section working width',
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          onFieldSubmitted: (value) {
            final newWidth = double.tryParse(
              value.replaceAll(',', '.'),
            )?.abs();

            if (newWidth != null) {
              ref
                  .read(
                    configuredEquipmentProvider.notifier,
                  )
                  .update(
                    equipment.copyWith(
                      sections: equipment.sections
                          .map(
                            (section) => section..workingWidth = newWidth,
                          )
                          .toList(),
                    ),
                  );
            }
          },
        );
      },
    ),
  );

  late final widgets = [
    Consumer(
      builder: (context, ref, child) => CheckboxListTile(
        enabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.sections.length >= 2),
        ),
        title: const Text('Equal working widths'),
        value: ref.watch(configuredEquipmentEqualWorkingWidthsProvider),
        onChanged: (value) => value != null
            ? ref
                .read(configuredEquipmentEqualWorkingWidthsProvider.notifier)
                .update(value: value)
            : null,
      ),
    ),
    if (ref.read(configuredEquipmentEqualWorkingWidthsProvider)) textField,
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen(configuredEquipmentEqualWorkingWidthsProvider, (previous, next) {
      final state = key.currentState;
      if (state is AnimatedListState) {
        if (next) {
          widgets.add(textField);
          state.insertItem(1, duration: Durations.medium1);
        } else {
          widgets.removeLast();
          state.removeItem(
            1,
            (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: textField,
            ),
          );
        }
      }
    });

    return AnimatedContainer(
      duration: Durations.medium1,
      height: 80 +
          (ref.watch(configuredEquipmentEqualWorkingWidthsProvider) ? 80 : 0),
      child: AnimatedList(
        key: key,
        initialItemCount: widgets.length,
        itemBuilder: (context, index, animation) => SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Easing.emphasizedAccelerate,
          ),
          child: widgets[index],
        ),
      ),
    );
  }
}

class _SectionConfigurator extends ConsumerStatefulWidget {
  const _SectionConfigurator(this.index, {this.singleSection = false});

  final int index;
  final bool singleSection;

  @override
  ConsumerState<_SectionConfigurator> createState() =>
      _SectionConfiguratorState();
}

class _SectionConfiguratorState extends ConsumerState<_SectionConfigurator> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final widgets = <Widget>[];

  late bool equalWidth = ref.read(configuredEquipmentEqualWidthsProvider);
  late bool equalWorkingWidth =
      ref.read(configuredEquipmentEqualWorkingWidthsProvider);

  @override
  Widget build(BuildContext context) {
    ref
      ..listen(configuredEquipmentEqualWidthsProvider, (previous, next) {
        final state = _listKey.currentState;
        if (state is AnimatedListState) {
          equalWidth = next;
          if (next) {
            widgets.removeAt(0);
            state.removeItem(
              0,
              (context, animation) => SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: Easing.emphasizedAccelerate,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: _SectionWidth(widget.index),
                ),
              ),
              duration: Durations.medium1,
            );
          } else {
            widgets.insert(0, _SectionWidth(widget.index));
            state.insertItem(0, duration: Durations.medium1);
          }
        }
      })
      ..listen(configuredEquipmentEqualWorkingWidthsProvider, (previous, next) {
        final state = _listKey.currentState;
        if (state is AnimatedListState) {
          equalWorkingWidth = next;
          final index = equalWidth ? 0 : 1;
          if (next) {
            widgets.removeAt(index);
            state.removeItem(
              index,
              (context, animation) => SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: Easing.emphasizedAccelerate,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: _SectionWorkingWidth(widget.index),
                ),
              ),
              duration: Durations.medium1,
            );
          } else {
            widgets.insert(index, _SectionWorkingWidth(widget.index));
            state.insertItem(index, duration: Durations.medium1);
          }
        }
      });

    widgets.addAll([
      if (widget.singleSection || !equalWidth) _SectionWidth(widget.index),
      if (widget.singleSection || !equalWorkingWidth)
        _SectionWorkingWidth(widget.index),
      _SectionButtonColorSelector(widget.index),
      _SectionWorkedPathColorSelector(widget.index),
    ]);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 252),
      child: AnimatedList(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 8),
        key: _listKey,
        initialItemCount: widgets.length,
        itemBuilder: (context, index, animation) => SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: Easing.emphasizedAccelerate,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
            child: widgets[index],
          ),
        ),
      ),
    );
  }
}

class _SectionWidth extends ConsumerWidget {
  const _SectionWidth(this.index);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(
      configuredEquipmentProvider
          .select((value) => value.sections.elementAtOrNull(index)),
    );
    if (section == null) {
      return const SizedBox.shrink();
    }
    return TextFormField(
      controller: TextEditingController(text: '${section.width}'),
      decoration: InputDecoration(
        labelText: 'Section ${section.index + 1} width',
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      onFieldSubmitted: (value) {
        final newWidth = double.tryParse(value.replaceAll(',', '.'));

        if (newWidth != null) {
          section.width = newWidth;
          ref
              .read(
                configuredEquipmentProvider.notifier,
              )
              .updateSection(
                section,
              );
        }
      },
    );
  }
}

class _SectionWorkingWidth extends ConsumerWidget {
  const _SectionWorkingWidth(this.index);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(
      configuredEquipmentProvider
          .select((value) => value.sections.elementAtOrNull(index)),
    );
    if (section == null) {
      return const SizedBox.shrink();
    }

    return TextFormField(
      controller: TextEditingController(text: '${section.workingWidth}'),
      decoration: InputDecoration(
        labelText: 'Section ${section.index + 1} working width',
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      onFieldSubmitted: (value) {
        final newWidth = double.tryParse(
          value.replaceAll(',', '.'),
        );

        if (newWidth != null) {
          section.workingWidth = newWidth;
          ref
              .read(
                configuredEquipmentProvider.notifier,
              )
              .updateSection(
                section,
              );
        }
      },
    );
  }
}

class _SectionButtonColorSelector extends ConsumerWidget {
  const _SectionButtonColorSelector(this.index);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(
      configuredEquipmentProvider.select(
        (value) => value.sections.elementAtOrNull(index),
      ),
    );
    if (section == null) {
      return const SizedBox.shrink();
    }
    return DropdownMenu(
      label: Text(
        'Section ${section.index + 1} button color',
      ),
      leadingIcon: Icon(
        Icons.color_lens,
        color: section.color ?? Colors.green,
      ),
      initialSelection: section.color,
      onSelected: (color) {
        section.color = color;
        ref
            .read(
              configuredEquipmentProvider.notifier,
            )
            .updateSection(
              section,
            );
      },
      menuStyle: const MenuStyle(alignment: Alignment.topCenter),
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: null,
          label: 'Default',
          leadingIcon: const Icon(
            Icons.color_lens,
            color: Colors.green,
          ),
          trailingIcon: section.color == null ? const Icon(Icons.check) : null,
        ),
        ...Colors.primaries.mapIndexed(
          (index, color) => DropdownMenuEntry(
            value: color.shade500,
            label: PrimaryColorNamesExtension.primaryColorNames[index],
            leadingIcon: Icon(
              Icons.color_lens,
              color: color,
            ),
            trailingIcon: section.color == color
                ? const Icon(
                    Icons.check,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class _SectionWorkedPathColorSelector extends ConsumerWidget {
  const _SectionWorkedPathColorSelector(this.index);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final section = ref.watch(
      configuredEquipmentProvider.select(
        (value) => value.sections.elementAtOrNull(index),
      ),
    );
    if (section == null) {
      return const SizedBox.shrink();
    }
    return DropdownMenu(
      label: Text(
        'Section ${section.index + 1} path color',
      ),
      leadingIcon: Icon(
        Icons.color_lens,
        color: section.workedPathColor ?? theme.primaryColor,
      ),
      initialSelection: section.workedPathColor,
      onSelected: (color) {
        section.workedPathColor = color;
        ref
            .read(
              configuredEquipmentProvider.notifier,
            )
            .updateSection(
              section,
            );
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: null,
          label: 'Default',
          leadingIcon: Icon(
            Icons.color_lens,
            color: theme.primaryColor,
          ),
          trailingIcon: section.workedPathColor == null
              ? const Icon(
                  Icons.check,
                )
              : null,
        ),
        ...Colors.primaries.mapIndexed(
          (index, color) => DropdownMenuEntry(
            value: color.shade500,
            label: PrimaryColorNamesExtension.primaryColorNames[index],
            leadingIcon: Icon(
              Icons.color_lens,
              color: color,
            ),
            trailingIcon: section.workedPathColor == color
                ? const Icon(
                    Icons.check,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
