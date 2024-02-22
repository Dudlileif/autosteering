import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/theme/utils/menu_button_text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for enabling logging of hardware communication.
class HardwareLoggingMenu extends StatelessWidget {
  /// A menu for enabling logging of hardware communication.
  const HardwareLoggingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Logging',
      iconOverrideWidget: Consumer(
        builder: (context, ref, child) => Icon(
          Icons.pending_actions,
          color: switch (ref.watch(hardwareAnyLoggingEnabledProvider)) {
            true => Colors.green,
            false => null,
          },
        ),
      ),
      menuChildren: [
        Consumer(
          child: Text('GNSS', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(hardwareLogGnssProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(hardwareLogGnssProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text('IMU', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(hardwareLogImuProvider),
            onChanged: (value) => value != null
                ? ref.read(hardwareLogImuProvider.notifier).update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text('WAS', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(hardwareLogWasProvider),
            onChanged: (value) => value != null
                ? ref.read(hardwareLogWasProvider.notifier).update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text('Combined', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(hardwareLogCombinedProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(hardwareLogCombinedProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
      ],
    );
  }
}
