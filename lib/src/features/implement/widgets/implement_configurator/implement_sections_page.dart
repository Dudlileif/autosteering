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
import 'package:autosteering/src/features/equipment/equipment.dart'
    show Section;
import 'package:autosteering/src/features/implement/implement.dart';
import 'package:autosteering/src/features/theme/utils/utils.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// A page for configuring the implement's sections.
class ImplementSectionsPage extends ConsumerWidget {
  /// A page for configuring the implement's sections.
  const ImplementSectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final implement = ref.watch(configuredImplementProvider);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const .all(8),
          sliver: SliverToBoxAdapter(
            child: Text(
              strings.sections(0),
              style: theme.textTheme.titleLarge,
              textAlign: .center,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: TextFormField(
                controller: TextEditingController(
                  text: ref.read(
                    configuredImplementProvider.select(
                      (value) => '${value.sections.length}',
                    ),
                  ),
                ),
                decoration: InputDecoration(
                  icon: const Icon(Icons.numbers),
                  labelText: strings.numberOfSections,
                ),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  if (int.tryParse(value.numberInput) case final sections?
                      when sections > 0) {
                    ref
                        .read(configuredImplementProvider.notifier)
                        .update(
                          implement.copyWith(
                            sections: List.generate(
                              sections,
                              (index) => Section(
                                index: index,
                                longitudinalOffset: 0,
                                lateralOffset:
                                    (1 / 2 + index - sections / 2) * 3,
                              ),
                            ),
                          ),
                        );
                    ref.invalidate(configuredImplementOpenSectionsProvider);
                  }
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                strings.totalWidth(
                  ref.watch(
                    configuredImplementProvider.select(
                      (value) => value.width,
                    ),
                  ),
                ),
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        if (implement.sections.length >= 2)
          SliverPadding(
            padding: const EdgeInsets.only(top: 8),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const _SectionWidthExpansionTile(),
                ),
              ),
            ),
          ),
        if (implement.sections.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: _Sections(implement.sections),
          ),
      ],
    );
  }
}

class _SectionWidthExpansionTile extends ConsumerWidget {
  const _SectionWidthExpansionTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final equalWidths = ref.watch(configuredImplementEqualWidthsProvider);

    return AnimatedSize(
      alignment: .topCenter,
      duration: Durations.medium2,
      curve: Easing.standard,
      child: Column(
        children: [
          CheckboxListTile(
            enabled: ref.watch(
              configuredImplementProvider.select(
                (value) => value.sections.length >= 2,
              ),
            ),
            title: Text(strings.equalWidths),
            value: equalWidths,
            onChanged: (value) => value != null
                ? ref
                      .read(configuredImplementEqualWidthsProvider.notifier)
                      .update(value: value)
                : null,
          ),
          AnimatedCrossFade(
            crossFadeState: equalWidths ? .showFirst : .showSecond,
            duration: Durations.medium2,
            firstCurve: Easing.standard,
            secondCurve: Easing.standard,
            sizeCurve: Easing.standard,
            firstChild: Consumer(
              builder: (context, ref, child) {
                final implement = ref.watch(configuredImplementProvider);

                return Padding(
                  padding: const .only(top: 8),
                  child: TextFormField(
                    enabled: equalWidths,
                    controller: TextEditingController(
                      text: NumberFormat.decimalPatternDigits(
                        locale: strings.localeName,
                        decimalDigits: 2,
                      ).format(implement.sections.first.width),
                    ),
                    textAlign: .end,
                    decoration: InputDecoration(
                      labelText: strings.sectionWidth,
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onFieldSubmitted: (value) {
                      final newWidth = double.tryParse(
                        value.numberInput,
                      )?.abs();

                      if (newWidth != null) {
                        ref
                            .read(configuredImplementProvider.notifier)
                            .update(
                              implement.copyWith(
                                sections: implement.sections
                                    .map((section) => section..width = newWidth)
                                    .toList(),
                              ),
                            );
                      }
                    },
                  ),
                );
              },
            ),
            secondChild: const SizedBox(width: double.maxFinite),
          ),
        ],
      ),
    );
  }
}

class _SectionConfigurator extends ConsumerWidget {
  const _SectionConfigurator(
    this.index, {
    this.singleSection = false,
    this.equalWidth = false,
  });

  final int index;
  final bool singleSection;
  final bool equalWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final section = ref.watch(
      configuredImplementProvider.select((value) => value.sections[index]),
    );

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Flex(
          spacing: 8,
          direction: .horizontal,
          children: [
            Expanded(
              child: AnimatedCrossFade(
                crossFadeState: (singleSection || !equalWidth)
                    ? .showFirst
                    : .showSecond,
                duration: Durations.medium2,
                firstCurve: Easing.standard,
                secondCurve: Easing.standard,
                sizeCurve: Easing.standard,
                alignment: .bottomCenter,
                firstChild: Padding(
                  padding: const .only(top: 4),
                  child: _SectionWidth(section),
                ),
                secondChild: const SizedBox(width: double.maxFinite),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const .only(top: 8),
                child: _SectionLength(section),
              ),
            ),
          ],
        ),
        Padding(
          padding: const .only(top: 8),
          child: Flex(
            spacing: 8,
            direction: .horizontal,
            children: [
              Expanded(child: _SectionLateralOffset(section)),
              Expanded(child: _SectionLongitudinalOffset(section)),
            ],
          ),
        ),
        Padding(
          padding: const .only(top: 8),
          child: Flex(
            spacing: 8,
            direction: .horizontal,
            children: [
              Expanded(
                child: _SectionButtonColorSelector(
                  initialColor: section.color,
                  onSelected: (color) => ref
                      .read(configuredImplementProvider.notifier)
                      .updateSection(section..color = color),
                  label: strings.buttonColor,
                  fallbackColor: Colors.green,
                ),
              ),
              Expanded(
                child: _SectionButtonColorSelector(
                  initialColor: section.workedPathColor,
                  onSelected: (color) => ref
                      .read(configuredImplementProvider.notifier)
                      .updateSection(section..workedPathColor = color),
                  label: strings.pathColor,
                  fallbackColor: ColorScheme.of(context).primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionLongitudinalOffset extends ConsumerWidget {
  const _SectionLongitudinalOffset(this.section);

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return TextFormField(
      controller: TextEditingController(
        text: NumberFormat.decimalPatternDigits(
          locale: strings.localeName,
          decimalDigits: 2,
        ).format(section.longitudinalOffset),
      ),
      textAlign: .end,
      decoration: InputDecoration(
        labelText: strings.longitudinalOffset,
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      onFieldSubmitted: (value) {
        if (double.tryParse(value.numberInput) case final longitudinalOffset?) {
          ref
              .read(configuredImplementProvider.notifier)
              .updateSection(section..longitudinalOffset = longitudinalOffset);
        }
      },
    );
  }
}

class _SectionLateralOffset extends ConsumerWidget {
  const _SectionLateralOffset(this.section);

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return TextFormField(
      controller: TextEditingController(
        text: NumberFormat.decimalPatternDigits(
          locale: strings.localeName,
          decimalDigits: 2,
        ).format(section.lateralOffset),
      ),
      textAlign: .end,
      decoration: InputDecoration(
        labelText: strings.lateralOffset,
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      onFieldSubmitted: (value) {
        if (double.tryParse(value.numberInput) case final lateralOffset?) {
          ref
              .read(configuredImplementProvider.notifier)
              .updateSection(section..lateralOffset = lateralOffset);
        }
      },
    );
  }
}

class _SectionWidth extends ConsumerWidget {
  const _SectionWidth(this.section);

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return TextFormField(
      controller: TextEditingController(
        text: NumberFormat.decimalPatternDigits(
          locale: strings.localeName,
          decimalDigits: 2,
        ).format(section.width),
      ),
      textAlign: .end,
      decoration: InputDecoration(
        labelText: strings.width,
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onFieldSubmitted: (value) {
        if (double.tryParse(value.numberInput) case final newWidth?) {
          ref
              .read(configuredImplementProvider.notifier)
              .updateSection(section..width = newWidth);
        }
      },
    );
  }
}

class _SectionLength extends ConsumerWidget {
  const _SectionLength(this.section);

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return TextFormField(
      controller: TextEditingController(
        text: NumberFormat.decimalPatternDigits(
          locale: strings.localeName,
          decimalDigits: 2,
        ).format(section.length),
      ),
      textAlign: .end,
      decoration: InputDecoration(
        labelText: strings.length,
        suffixText: 'm',
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onFieldSubmitted: (value) {
        if (double.tryParse(value.numberInput) case final newLength?) {
          ref
              .read(configuredImplementProvider.notifier)
              .updateSection(section..length = newLength);
        }
      },
    );
  }
}

class _SectionButtonColorSelector extends ConsumerWidget {
  const _SectionButtonColorSelector({
    required this.initialColor,
    required this.label,
    required this.onSelected,
    required this.fallbackColor,
  });
  final Color? initialColor;
  final String label;
  final void Function(Color? color) onSelected;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return DropdownMenu<Color?>(
      width: double.maxFinite,
      label: Text(label),
      leadingIcon: Icon(Icons.color_lens, color: initialColor ?? fallbackColor),
      initialSelection: initialColor,
      onSelected: onSelected,
      selectOnly: true,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(Size(250, 350)),
      ),
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: null,
          label: strings.defaultOption,
          leadingIcon: Icon(Icons.color_lens, color: fallbackColor),
          trailingIcon: initialColor == null ? const Icon(Icons.check) : null,
        ),
        ...Colors.primaries.mapIndexed(
          (index, color) => DropdownMenuEntry(
            value: color.shade500,
            label: strings.primaryColor(
              PrimaryColorNamesExtension.primaryColorKeys[index],
            ),
            leadingIcon: Icon(Icons.color_lens, color: color),
            trailingIcon: initialColor == color.shade500
                ? const Icon(Icons.check)
                : null,
          ),
        ),
      ],
    );
  }
}

class _Sections extends ConsumerWidget {
  const _Sections(this.sections);

  final List<Section> sections;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);
    final strings = AppLocalizations.of(context);

    final equalWidth = ref.watch(configuredImplementEqualWidthsProvider);
    final openSections = ref.watch(configuredImplementOpenSectionsProvider);

    return SliverList.separated(
      itemCount: sections.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ExpansionTile(
        title: Text('${strings.sections(1)} ${index + 1}'),
        onExpansionChanged: (open) => switch (open) {
          true =>
            ref
                .read(configuredImplementOpenSectionsProvider.notifier)
                .add(index),
          false =>
            ref
                .read(configuredImplementOpenSectionsProvider.notifier)
                .remove(index),
        },
        backgroundColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        collapsedShape: RoundedRectangleBorder(borderRadius: .circular(12)),
        initiallyExpanded: openSections.contains(index),
        children: [
          AnimatedSize(
            duration: Durations.medium2,
            curve: Easing.standard,
            alignment: .bottomCenter,
            child: _SectionConfigurator(
              index,
              singleSection: sections.length == 1,
              equalWidth: equalWidth,
            ),
          ),
        ],
      ),
    );
  }
}
