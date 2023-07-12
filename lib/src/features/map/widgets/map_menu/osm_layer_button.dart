import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button for toggling the OpenStreetMap layer.
class OSMLayerButton extends StatelessWidget {
  /// A menu button for toggling the OpenStreetMap layer.
  const OSMLayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: Text(
        'OpenStreetMap',
        softWrap: false,
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      builder: (context, ref, child) {
        return CheckboxListTile(
          value: ref.watch(showOSMLayerProvider),
          onChanged: (value) => value != null
              ? ref.read(showOSMLayerProvider.notifier).update(value: value)
              : null,
          secondary: child,
        );
      },
    );
  }
}
