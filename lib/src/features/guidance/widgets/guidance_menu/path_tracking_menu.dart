import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_recorder_menu.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path tracking
/// feature.
class PathTrackingMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the path tracking
  ///  feature.
  const PathTrackingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathTracking = ref.watch(configuredPathTrackingProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path tracking',
      icon: Icons.route,
      menuChildren: [
        const PathRecorderMenu(),
        Consumer(
          child: Text(
            'Enable',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(enablePathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(enablePathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(showPathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(showPathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        ListTile(
          title: Text(
            'Loop',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final loopMode = ref.watch(pathTrackingLoopProvider);

              return ToggleButtons(
                isSelected: PathTrackingLoopMode.values
                    .map((mode) => mode == loopMode)
                    .toList(),
                onPressed: (index) => ref
                    .read(pathTrackingLoopProvider.notifier)
                    .update(PathTrackingLoopMode.values[index]),
                children: PathTrackingLoopMode.values
                    .map(
                      (mode) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(mode.name.capitalize),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final distance = ref.watch(pathInterpolationDistanceProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Interpolation distance: $distance m',
                    style: textStyle,
                  ),
                  Slider(
                    value: distance,
                    onChanged: ref
                        .read(pathInterpolationDistanceProvider.notifier)
                        .update,
                    max: 20,
                    min: 1,
                    divisions: 19,
                  ),
                ],
              );
            },
          ),
        ),
        if (pathTracking != null)
          Consumer(
            child: Text(
              'Save tracking',
              style: textStyle,
            ),
            builder: (context, ref, child) => ListTile(
              title: child,
              leading: const Icon(Icons.save),
              onTap: () {
                if (pathTracking.name != null) {
                  ref.watch(
                    savePathTrackingProvider(
                      pathTracking,
                      downloadIfWeb: true,
                    ),
                  );
                } else {
                  unawaited(
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        var name = '';
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return SimpleDialog(
                              title: const Text('Name the path tracking'),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.label_outline),
                                      labelText: 'Name',
                                    ),
                                    initialValue: name,
                                    onChanged: (value) =>
                                        setState(() => name = value),
                                    onFieldSubmitted: (value) =>
                                        setState(() => name = value),
                                    keyboardType: TextInputType.text,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) => value != null &&
                                            value.isNotEmpty &&
                                            !value.startsWith(' ')
                                        ? null
                                        : '''No name entered! Please enter a name so that the tracking can be saved!''',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 8,
                                  ),
                                  child: Consumer(
                                    child: const Text('Save tracking'),
                                    builder: (context, ref, child) =>
                                        FilledButton(
                                      onPressed: () {
                                        Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () {
                                          ref.read(
                                            savePathTrackingProvider(
                                              pathTracking
                                                ..name = name.isNotEmpty
                                                    ? name
                                                    : null,
                                            ),
                                          );
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: child,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}
