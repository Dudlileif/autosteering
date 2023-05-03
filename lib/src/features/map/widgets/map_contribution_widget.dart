import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapContributionWidget extends ConsumerWidget {
  const MapContributionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = <Widget>[
      if (ref.watch(showOSMLayerProvider))
        const Padding(
          padding: EdgeInsets.all(2),
          child: OSMContribution(),
        ),
      if (ref.watch(selectedCountryLayersProvider).isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(2),
          child: ref.watch(currentCountryProvider)?.mapContribution(context),
        ),
      if (ref.watch(selectedSentinelLayersProvider).isNotEmpty)
        const Padding(
          padding: EdgeInsets.all(2),
          child: SentinelContribution(),
        )
    ];
    if (items.length > 1) {
      for (var i = 1; i < items.length; i += 2) {
        items.insert(i, const VerticalDivider());
      }
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
