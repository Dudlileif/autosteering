import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button for toggling the OpenStreetMap layer.
class OSMLayerButton extends ConsumerWidget {
  const OSMLayerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: ref.watch(showOSMLayerProvider),
      onChanged: (value) => value != null
          ? ref.read(showOSMLayerProvider.notifier).update(value: value)
          : null,
      secondary: Text(
        'OpenStreetMap',
        softWrap: false,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
