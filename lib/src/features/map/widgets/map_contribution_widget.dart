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

import 'package:autosteering/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A small widget to show attributions to the map contributors.
class MapContributionWidget extends ConsumerWidget {
  /// A small widget to show attributions to the map contributors.
  const MapContributionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = <Widget>[
      if (ref.watch(showOSMLayerProvider))
        const Padding(
          padding: EdgeInsets.all(2),
          child: OSMContribution(),
        ),
      if (ref.watch(enabledCountryLayersProvider).isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(2),
          child: ref.watch(currentCountryProvider)?.mapContribution(context),
        ),
      if (ref.watch(enabledSentinelLayersProvider).isNotEmpty)
        const Padding(
          padding: EdgeInsets.all(2),
          child: SentinelContribution(),
        ),
    ];
    if (items.length > 1) {
      for (var i = 1; i < items.length; i += 2) {
        items.insert(i, const VerticalDivider());
      }
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: items,
        ),
      ),
    );
  }
}
