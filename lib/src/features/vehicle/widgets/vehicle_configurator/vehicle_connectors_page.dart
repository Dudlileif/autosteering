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

import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the vehicle's connectors.
class VehicleConnectorsPage extends ConsumerWidget {
  /// A page for configuring the vehicle's connectors.
  const VehicleConnectorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(
          strings.hitches(0),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ...vehicle.connectors.map((connector) => const Column()),
    ];

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: children
              .map(
                (widget) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(width: 400, child: widget),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
