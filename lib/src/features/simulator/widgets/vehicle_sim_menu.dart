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
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for options related to the
/// simulated vehicle.
class VehicleSimMenu extends StatelessWidget {
  /// A menu button with attached submenu for options related to the
  /// simulated vehicle.
  const VehicleSimMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.agriculture,
      text: 'Vehicle',
      menuChildren: [
        Consumer(
          child: Text(
            'Auto center steering',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(simCoreVehicleAutoCenterSteeringProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreVehicleAutoCenterSteeringProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Auto slow down',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(simCoreVehicleAutoSlowDownProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreVehicleAutoSlowDownProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
      ],
    );
  }
}
