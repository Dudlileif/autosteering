import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/a_plus_line_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_curve_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_line_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_tracking_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/virtual_led_bar_menu.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends ConsumerWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Guidance',
      icon: Icons.navigation,
      menuChildren: [
        ListTile(
          title: Text(
            'Tracking mode',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final pursuitMode = ref.watch(
                mainVehicleProvider
                    .select((vehicle) => vehicle.pathTrackingMode),
              );
              return ToggleButtons(
                onPressed: (index) {
                  final oldValue = ref.read(
                    mainVehicleProvider
                        .select((value) => value.pathTrackingMode),
                  );

                  ref
                      .read(simInputProvider.notifier)
                      .send(PathTrackingMode.values[index]);

                  // Wait a short while before saving the hopefully
                  // updated vehicle.
                  Future.delayed(const Duration(milliseconds: 250), () {
                    final vehicle = ref.read(mainVehicleProvider);
                    ref.read(saveVehicleProvider(vehicle));
                    Logger.instance.i(
                      '''Updated vehicle path tracking mode: $oldValue -> ${vehicle.pathTrackingMode}''',
                    );
                  });
                },
                isSelected: PathTrackingMode.values
                    .map((mode) => mode == pursuitMode)
                    .toList(),
                children: PathTrackingMode.values
                    .map(
                      (mode) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          mode.name.capitalize
                              .replaceAll('Pursuit', ' Pursuit'),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        if (ref.watch(displayABTrackingProvider) != null ||
            ref.watch(displayPathTrackingProvider) != null)
          MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () {
              ref.read(simInputProvider.notifier).send((abTracking: null));
              ref.read(simInputProvider.notifier).send((pathTracking: null));
            },
            closeOnActivate: false,
            child: Text(
              'Close active',
              style: textStyle,
            ),
          ),
        if (ref.watch(displayABTrackingProvider) == null &&
            ref.watch(displayPathTrackingProvider) == null) ...[
          if (Device.isNative) const _LoadPathTrackingMenu(),
          if (Device.isNative) const _LoadABTrackingMenu(),
          const _ImportMenu(),
        ],
        if (ref.watch(displayABTrackingProvider) != null ||
            ref.watch(displayPathTrackingProvider) != null)
          const _ExportButton(),
        const PathTrackingMenu(),
        const APlusLineMenu(),
        const ABLineMenu(),
        const ABCurveMenu(),
        const VirtualLedBarMenu(),
      ],
    );
  }
}

/// A menu for loading a [PathTracking] from saved fields.
class _LoadPathTrackingMenu extends ConsumerWidget {
  /// A menu for loading a [PathTracking] from saved fields.
  const _LoadPathTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathTrackings = ref.watch(savedPathTrackingsProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => <PathTracking>[],
              loading: () => <PathTracking>[],
            )
        // ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed))
        ;

    if (pathTrackings.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load path recording',
      icon: Icons.history,
      menuChildren: pathTrackings
          .map(
            (pathTracking) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                  ref
                      .read(showPathTrackingProvider.notifier)
                      .update(value: true);
                  ref
                      .read(configuredPathTrackingProvider.notifier)
                      .update(pathTracking);
                  ref
                      .read(enablePathTrackingProvider.notifier)
                      .update(value: true);
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text(
                                'Delete ${pathTracking.name ?? ''}?',
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) =>
                                          SimpleDialogOption(
                                        onPressed: () async {
                                          await ref
                                              .watch(
                                                deletePathTrackingProvider(
                                                  pathTracking,
                                                ).future,
                                              )
                                              .then(
                                                (value) => Navigator.of(context)
                                                    .pop(true),
                                              );
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
                title: Text(pathTracking.name ?? 'No name', style: textStyle),
              ),
            ),
          )
          .toList(),
    );
  }
}

/// A menu for loading a [PathTracking] from saved fields.
class _LoadABTrackingMenu extends ConsumerWidget {
  /// A menu for loading a [PathTracking] from saved fields.
  const _LoadABTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abTrackings = ref.watch(savedABTrackingsProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => <ABTracking>[],
              loading: () => <ABTracking>[],
            )
        // ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed))
        ;

    if (abTrackings.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load AB tracking',
      icon: Icons.history,
      menuChildren: abTrackings
          .map(
            (abTracking) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                  ref.read(showABTrackingProvider.notifier).update(value: true);
                  ref
                      .read(configuredABTrackingProvider.notifier)
                      .update(abTracking);
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text('Delete ${abTracking.name ?? ''}?'),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) =>
                                          SimpleDialogOption(
                                        onPressed: () async {
                                          await ref
                                              .watch(
                                                deleteABTrackingProvider(
                                                  abTracking,
                                                ).future,
                                              )
                                              .then(
                                                (value) => Navigator.of(context)
                                                    .pop(true),
                                              );
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
                title: Text(abTracking.name ?? 'No name', style: textStyle),
                subtitle: Text(
                  switch (abTracking.runtimeType) {
                    APlusLine => 'A+ line',
                    ABLine => 'AB line',
                    ABCurve => 'AB curve',
                    _ => 'Unknown',
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ImportMenu extends ConsumerWidget {
  const _ImportMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.file_open,
      text: 'Import',
      menuChildren: [
        MenuItemButton(
          onPressed: () async => await ref.watch(importABTrackingProvider),
          closeOnActivate: false,
          child: Text('AB-tracking', style: textStyle),
        ),
        MenuItemButton(
          onPressed: () async => await ref.watch(importPathTrackingProvider),
          closeOnActivate: false,
          child: Text('Path tracking', style: textStyle),
        ),
      ],
    );
  }
}

class _ExportButton extends ConsumerWidget {
  const _ExportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final abTracking = ref.watch(displayABTrackingProvider);
    final pathTracking = ref.watch(displayPathTrackingProvider);

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.save_alt),
      ),
      onPressed: abTracking != null
          ? () async => await ref.watch(
                exportABTrackingProvider(abTracking).future,
              )
          : pathTracking != null
              ? () async => await ref
                  .watch(exportPathTrackingProvider(pathTracking).future)
              : null,
      child: Text('Export', style: textStyle),
    );
  }
}
