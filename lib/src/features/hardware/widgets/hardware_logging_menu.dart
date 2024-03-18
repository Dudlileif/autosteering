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
