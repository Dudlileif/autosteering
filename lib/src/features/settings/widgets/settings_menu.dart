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

import 'package:autosteering/src/features/audio/audio.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/graph/graph.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// A settings menu for map, sim core and theme settings.
class SettingsMenu extends ConsumerWidget {
  /// A settings menu for map, sim core and theme settings.
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    final dadMode = ref.watch(enableDadModeProvider);
    return MenuButtonWithChildren(
      icon: Icons.settings,
      text: strings.settings,
      menuChildren: [
        const MapMenu(),
        const SimCoreMenu(),
        const _UnitMenu(),
        const ThemeMenu(),
        const AudioVolumeMenu(),
        const _ImportExportMenu(),
        const _DadModeButton(),
        if (!dadMode) ...[const _DebugModeButton(), const _GraphButton()],
        const _LocaleMenu(),
        const _LicenseButton(),
      ],
    );
  }
}

class _ImportExportMenu extends StatelessWidget {
  const _ImportExportMenu();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return MenuButtonWithChildren(
      text: strings.importExport,
      icon: Icons.import_export,
      menuChildren: [
        const _ExportLogsButton(),
        const _ExportEverythingButton(),
        const _ImportExportSettingsButton(),
        if (Device.isNative) const _ImportEverythingButton(),
      ],
    );
  }
}

class _ExportLogsButton extends ConsumerWidget {
  const _ExportLogsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return MenuItemButton(
      onPressed: () => ref.read(
        exportLogsProvider(
          dialogTitle: strings.selectExportFolder,
        ),
      ),
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Symbols.export_notes),
      ),
      child: Text(
        strings.exportValue(strings.logs.toLowerCase()),
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
    );
  }
}

class _ImportExportSettingsButton extends ConsumerWidget {
  const _ImportExportSettingsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return MenuButtonWithChildren(
      text: [strings.importExport, strings.settings.toLowerCase()].join(' '),
      icon: Icons.import_export,
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.download),
          ),
          closeOnActivate: false,
          onPressed: () => ref.read(
            importSettingsProvider(
              dialogTitle: strings.selectValueFile(
                strings.settings.toLowerCase(),
              ),
            ),
          ),
          child: Text(
            strings.importAction,
            style: theme.menuButtonWithChildrenText,
          ),
        ),
        MenuItemButton(
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.upload),
          ),
          closeOnActivate: false,
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => Consumer(
              builder: (context, ref, child) {
                var removeSensitiveData = false;
                return StatefulBuilder(
                  builder: (context, setState) {
                    return SimpleDialog(
                      title: Text(
                        strings.exportValue(strings.settings.toLowerCase()),
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 24,
                        top: 12,
                        right: 24,
                        bottom: 16,
                      ),
                      children: [
                        CheckboxListTile(
                          value: removeSensitiveData,
                          onChanged: (value) => setState(
                            () => removeSensitiveData =
                                value ?? removeSensitiveData,
                          ),
                          title: Text(strings.removeSensitiveData),
                          subtitle: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                            ),
                            child: Text(strings.removeSensitiveDataDescription),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: Navigator.of(context).pop,
                                  icon: const Icon(Icons.clear),
                                  label: Text(strings.cancel),
                                ),
                                FilledButton.icon(
                                  onPressed: () async {
                                    await ref.read(
                                      exportSettingsProvider(
                                        removeSensitiveData:
                                            removeSensitiveData,
                                        dialogTitle: strings.selectExportFolder,
                                      ).future,
                                    );

                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                  label: Text(strings.confirm),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          child: Text(
            strings.exportAction,
            style: theme.menuButtonWithChildrenText,
          ),
        ),
      ],
    );
  }
}

class _DadModeButton extends ConsumerWidget {
  const _DadModeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return CheckboxListTile(
      value: ref.watch(enableDadModeProvider),
      onChanged: (value) => value != null
          ? ref.read(enableDadModeProvider.notifier).update(value: value)
          : null,
      title: Text(
        strings.dadMode,
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      secondary: const Icon(Icons.elderly),
    );
  }
}

class _DebugModeButton extends ConsumerWidget {
  const _DebugModeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return CheckboxListTile(
      value: ref.watch(enableDebugModeProvider),
      onChanged: (value) => value != null
          ? ref.read(enableDebugModeProvider.notifier).update(value: value)
          : null,
      title: Text(
        strings.debugMode,
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      secondary: const Icon(Icons.bug_report),
    );
  }
}

class _LicenseButton extends StatelessWidget {
  const _LicenseButton();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Symbols.info),
      ),
      child: Text(
        strings.about,
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      onPressed: () async {
        final packageInfo = await PackageInfo.fromPlatform();
        if (context.mounted) {
          showAboutDialog(
            context: context,
            applicationName: 'Autosteering',
            applicationVersion:
                '${packageInfo.version}+${packageInfo.buildNumber}',
            applicationLegalese: '''
  Copyright (C) 2025 Gaute Hagen
  
  Autosteering is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  Autosteering is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with Autosteering. If not, see https://www.gnu.org/licenses/.
  ''',
          );
        }
      },
    );
  }
}

class _ExportEverythingButton extends ConsumerWidget {
  const _ExportEverythingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.folder_zip_outlined),
      ),
      child: Text(
        strings.exportValue(strings.everything.toLowerCase()),
        style: textStyle,
      ),
      onPressed: () => ref.read(
        exportWholeFileDirectoryProvider(
          dialogTitle: strings.selectExportFolder,
        ),
      ),
    );
  }
}

class _ImportEverythingButton extends ConsumerWidget {
  const _ImportEverythingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.folder_zip_outlined),
      ),
      child: Text(
        strings.importValue(strings.everything.toLowerCase()),
        style: textStyle,
      ),
      onPressed: () => ref.read(
        importWholeFileDirectoryProvider(
          dialogTitle: strings.selectZipFileToImport,
        ),
      ),
    );
  }
}

class _GraphButton extends ConsumerWidget {
  const _GraphButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return switch (ref.watch(
      enableDebugModeProvider,
    )) {
      true => CheckboxListTile(
        value: ref.watch(showDraggableGraphProvider),
        onChanged: (value) => value != null
            ? ref.read(showDraggableGraphProvider.notifier).update(value: value)
            : null,
        title: Text(
          strings.graph,
          style: Theme.of(context).menuButtonWithChildrenText,
        ),
        secondary: const Icon(Icons.line_axis),
      ),
      false => const SizedBox.shrink(),
    };
  }
}

class _UnitMenu extends ConsumerWidget {
  const _UnitMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final dadMode = ref.watch(enableDadModeProvider);

    return MenuButtonWithChildren(
      text: strings.units,
      icon: Icons.speed,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            final selectedUnit = ref.watch(uiUnitAreaProvider);
            return MenuButtonWithChildren(
              text: strings.area,
              icon: Icons.square_foot,
              menuChildren: UnitArea.values
                  .map(
                    (unit) => Consumer(
                      builder: (context, ref, child) => ListTile(
                        title: Text(strings.unitAreaName(unit.symbol)),
                        leading: Text(strings.unitAreaDisplay(unit.symbol)),
                        subtitle: Text(
                          '''${unit.inSquareMeters.toStringAsFixed(1)} ${strings.unitAreaDisplay(UnitArea.squareMeter.symbol)}''',
                        ),
                        onTap: () =>
                            ref.read(uiUnitAreaProvider.notifier).update(unit),
                        selected: selectedUnit == unit,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final selectedUnit = ref.watch(uiUnitLengthProvider);
            return MenuButtonWithChildren(
              text: strings.length,
              icon: Icons.straighten,
              menuChildren: UnitLength.values
                  .map(
                    (unit) => Consumer(
                      builder: (context, ref, child) => ListTile(
                        title: Text(strings.unitLengthName(unit.symbol)),
                        leading: Text(strings.unitLengthDisplay(unit.symbol)),
                        subtitle: Text(
                          '''${unit.inMeters} ${strings.unitLengthDisplay(UnitLength.meter.symbol)}''',
                        ),
                        onTap: () => ref
                            .read(uiUnitLengthProvider.notifier)
                            .update(unit),
                        selected: selectedUnit == unit,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final selectedUnit = ref.watch(uiUnitVelocityProvider);
            return MenuButtonWithChildren(
              text: strings.velocity,
              icon: Icons.speed,
              menuChildren: UnitVelocity.values
                  .map(
                    (unit) => Consumer(
                      builder: (context, ref, child) => ListTile(
                        title: Text(strings.unitVelocityName(unit.symbol)),
                        leading: Text(strings.unitVelocityDisplay(unit.symbol)),
                        subtitle: Text(
                          '''${unit.inMetersPerSecond.toStringAsFixed(3)} ${strings.unitVelocityDisplay(UnitVelocity.metersPerSecond.symbol)}''',
                        ),
                        onTap: () => ref
                            .read(uiUnitVelocityProvider.notifier)
                            .update(unit),
                        selected: selectedUnit == unit,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        if (!dadMode)
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(gaugesAverageCountProvider);
              return ListTile(
                title: Text(strings.gaugeAverageCount),
                subtitle: Row(
                  spacing: 8,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: switch (count) {
                        > 5 =>
                          () => ref
                              .read(gaugesAverageCountProvider.notifier)
                              .update(count - 5),
                        _ => null,
                      },
                    ),
                    Text('$count'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: switch (count) {
                        < 50 =>
                          () => ref
                              .read(gaugesAverageCountProvider.notifier)
                              .update(count + 5),
                        _ => null,
                      },
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}

class _LocaleMenu extends ConsumerWidget {
  const _LocaleMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(uiLocaleProvider);
    final strings = AppLocalizations.of(context);

    return MenuButtonWithChildren(
      text: strings.locale,
      icon: Icons.language,
      menuChildren: AppLocalizations.supportedLocales
          .map(
            (locale) => ListTile(
              title: Text(switch (locale) {
                Locale(languageCode: 'en') => 'English',
                Locale(languageCode: 'nb') => 'Norsk',
                _ => strings.unknownLocale,
              }),
              selected: locale == selectedLocale,
              onTap: () => ref.read(uiLocaleProvider.notifier).update(locale),
            ),
          )
          .toList(),
    );
  }
}
