import 'dart:convert';

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
import 'package:file_picker/file_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends StatelessWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Guidance',
      icon: Icons.navigation,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            if (ref.watch(displayABTrackingProvider) != null ||
                ref.watch(displayPathTrackingProvider) != null) {
              return MenuItemButton(
                leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.clear),
                ),
                onPressed: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                },
                closeOnActivate: false,
                child: Text(
                  'Close active',
                  style: textStyle,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
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
                          mode.name.capitalize,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        if (Device.isNative) const _LoadPathTrackingMenu(),
        if (Device.isNative) const _LoadABTrackingMenu(),
        const _ImportGuidanceButton(),
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
            (pathTracking) => MenuItemButton(
              closeOnActivate: false,
              onPressed: () {
                ref.read(simInputProvider.notifier).send((abTracking: null));
                ref.read(simInputProvider.notifier).send((pathTracking: null));
                ref
                    .read(debugPathTrackingProvider.notifier)
                    .update(value: true);
                ref
                    .read(configuredPathTrackingProvider.notifier)
                    .update(pathTracking);
                ref
                    .read(enablePathTrackingProvider.notifier)
                    .update(value: true);
              },
              child: Text(pathTracking.name ?? 'No name', style: textStyle),
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
            (abTracking) => MenuItemButton(
              closeOnActivate: false,
              onPressed: () {
                ref.read(simInputProvider.notifier).send((abTracking: null));
                ref.read(simInputProvider.notifier).send((pathTracking: null));
                ref
                    .read(aBTrackingDebugShowProvider.notifier)
                    .update(value: true);
                ref
                    .read(configuredABTrackingProvider.notifier)
                    .update(abTracking);
              },
              child: Column(
                children: [
                  Text(abTracking.name ?? 'No name', style: textStyle),
                  Text('${abTracking.runtimeType}', style: textStyle),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ImportGuidanceButton extends ConsumerWidget {
  const _ImportGuidanceButton();

  void decodeJson(Map<String, dynamic> json, WidgetRef ref) {
    final mode = json['mode'] as String?;
    final type = json['type'] as String?;
    if (mode != null) {
      if (mode.toLowerCase().contains('stanley') ||
          mode.toLowerCase().contains('pursuit')) {
        ref.read(simInputProvider.notifier).send((abTracking: null));
        ref.read(simInputProvider.notifier).send((pathTracking: null));
        ref.read(debugPathTrackingProvider.notifier).update(value: true);
        ref.read(configuredPathTrackingProvider.notifier).update(
              PathTracking.fromJson(
                Map<String, dynamic>.from(json),
              ),
            );
        ref.read(enablePathTrackingProvider.notifier).update(value: true);
      } else if (type != null) {
        if (type.toLowerCase().contains('ab') ||
            type.toLowerCase().contains('a+')) {
          ref.read(simInputProvider.notifier).send((abTracking: null));
          ref.read(simInputProvider.notifier).send((pathTracking: null));
          ref.read(aBTrackingDebugShowProvider.notifier).update(value: true);
          ref.read(configuredABTrackingProvider.notifier).update(
                ABTracking.fromJson(
                  Map<String, dynamic>.from(json),
                ),
              );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return ListTile(
      leading: const Icon(Icons.file_open),
      title: Text(
        'Import guidance',
        style: textStyle,
      ),
      onTap: () async {
        final result = await FilePicker.platform.pickFiles(
          initialDirectory: Device.isNative
              ? [
                  ref.watch(fileDirectoryProvider).requireValue.path,
                  '/guidance',
                ].join()
              : null,
          dialogTitle: 'Open guidance json file',
          allowedExtensions: ['json'],
          type: FileType.custom,
        );
        if (result != null) {
          if (Device.isWeb) {
            final data = result.files.first.bytes;
            if (data != null) {
              final json = jsonDecode(String.fromCharCodes(data));

              if (json is Map) {
                decodeJson(Map<String, dynamic>.from(json), ref);
              }
            }
          } else {
            final path = result.paths.first;
            if (path != null) {
              final json = jsonDecode(File(path).readAsStringSync());
              if (json is Map) {
                decodeJson(Map<String, dynamic>.from(json), ref);
              }
            }
          }
        }
      },
    );
  }
}
