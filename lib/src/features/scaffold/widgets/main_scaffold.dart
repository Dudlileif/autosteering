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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main scaffold widget surrounding the main content of the application.
class MainScaffold extends StatelessWidget {
  /// The main scaffold widget surrounding the main content of the application.
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MenuBar(
          children: [
            const SettingsMenu(),
            const WorkSessionMenu(),
            const FieldMenu(),
            const GuidanceMenu(),
            const VehicleMenu(),
            const EquipmentMenu(),
            if (Device.isNative) const HardwareMenu(),
],
        ),
        actions: [
          // Grid size indicator
          Consumer(
            builder: (context, ref, child) {
              if (ref.watch(showGridLayerProvider)) {
                if (ref.watch(showGridSizeIndicatorProvider)) {
                  final size = ref.watch(mapGridSizeProvider);
                  if (size != null) {
                    final text = switch (size >= 1000) {
                      true => '${(size / 1000).round()} km',
                      false => '${size.round()} m'
                    };
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          text,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Icon(Icons.grid_3x3),
                      ],
                    );
                  }
                }
              }
              return const SizedBox.shrink();
            },
          ),
          if (Device.isNative)
            const Padding(
              padding: EdgeInsets.all(8),
              child: HardwareStatusIcon(size: 32),
            ),
          if (Device.isNative)
            const Focus(
              canRequestFocus: false,
              descendantsAreFocusable: false,
              descendantsAreTraversable: false,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: MotorStatusIcon(size: 32),
              ),
            ),
          if (Device.isNative)
            const Focus(
              canRequestFocus: false,
              descendantsAreFocusable: false,
              descendantsAreTraversable: false,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GnssQualityStatusIcon(size: 32),
              ),
            ),
        ],
      ),
      body: const MapAndGaugeStackView(),
    );
  }
}
