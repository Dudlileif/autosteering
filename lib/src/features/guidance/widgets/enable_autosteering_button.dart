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

import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A button for enabling/disabling auto steering.
class EnableAutosteeringButton extends StatelessWidget {
  /// A button for enabling/disabling auto steering.

  const EnableAutosteeringButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(activeAutosteeringStateProvider);

        return FloatingActionButton(
          onPressed: () => ref
              .read(simInputProvider.notifier)
              .send((enableAutoSteer: state == AutosteeringState.disabled)),
          backgroundColor: switch (state) {
            AutosteeringState.disabled => Colors.grey.shade700,
            AutosteeringState.standby => Colors.blue,
            AutosteeringState.enabled => Colors.green,
          },
          foregroundColor: Colors.white,
          tooltip: switch (state != AutosteeringState.disabled) {
            false => 'Enable auto steering',
            true => 'Disable auto steering'
          },
          child: Stack(
            children: [
              const Align(
                heightFactor: 1.1,
                child: Icon(
                  Symbols.search_hands_free,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  switch (state) {
                    AutosteeringState.disabled => 'OFF',
                    AutosteeringState.standby => 'STBY',
                    AutosteeringState.enabled => 'AUTO',
                  },
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Noto Sans Mono',
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
