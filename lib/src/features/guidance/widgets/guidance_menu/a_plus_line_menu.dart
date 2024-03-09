import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_common_menu.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A menu button with attached submenu for working with the [APlusLine]
/// guidance feature.
class APlusLineMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the [APlusLine]
  /// guidance feature.
  const APlusLineMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      .watch(activeABConfigProvider);

    final aPlusLine = ref.watch(aPlusLineDebugProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => null,
          loading: () => null,
        );

    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'A+ line',
      iconOverrideWidget: SizedBox.square(
        dimension: 24,
        child: SvgPicture.asset(
          'assets/icons/a_plus_line.svg',
          colorFilter: ColorFilter.mode(
            theme.iconTheme.color ?? Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            final bearing = ref.watch(aPlusLineBearingProvider);

            return ListTile(
              title: Text(
                '''Bearing: ${bearing != null ? '${bearing.toStringAsFixed(2)}°' : ''}''',
              ),
              onTap: () => showDialog<void>(
                context: context,
                builder: (context) => const _APlusLineBearingDialog(),
              ),
            );
          },
        ),
        Consumer(
          child: Text(
            'Set A',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            final pointIsSet = ref.watch(aBPointAProvider) != null;
            return MenuItemButton(
              leadingIcon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: pointIsSet
                    ? const Icon(Icons.gps_fixed)
                    : const Icon(Icons.gps_not_fixed),
              ),
              trailingIcon: pointIsSet
                  ? IconButton(
                      onPressed: () => ref.invalidate(aBPointAProvider),
                      icon: const Icon(Icons.clear),
                    )
                  : null,
              closeOnActivate: false,
              onPressed: () {
                ref.read(aBPointAProvider.notifier).update(
                      ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.wayPoint),
                      ),
                    );
                ref
                    .read(aBTrackingDebugShowProvider.notifier)
                    .update(value: true);
              },
              child: child,
            );
          },
        ),
        ABCommonMenu(
          abTracking: aPlusLine,
        ),
        Consumer(
          child: Text('Recalc bounded lines', style: textStyle),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            child: child,
            onPressed: () => ref.invalidate(aPlusLineDebugProvider),
          ),
        ),
      ],
    );
  }
}

class _APlusLineBearingDialog extends StatefulWidget {
  const _APlusLineBearingDialog();

  @override
  State<_APlusLineBearingDialog> createState() =>
      _APlusLineBearingDialogState();
}

class _APlusLineBearingDialogState extends State<_APlusLineBearingDialog> {
  double? bearing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                'A+ line bearing',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              final aPlusLine = ref.watch(aPlusLineDebugProvider);
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.navigation),
                  labelText: 'Bearing',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                initialValue: (aPlusLine.value?.initialBearing ??
                        ref.read(aBPointAProvider)?.bearing ??
                        ref.read(
                          mainVehicleProvider.select((value) => value.bearing),
                        ) ??
                        0)
                    .toStringAsFixed(2),
                onChanged: (value) {
                  final updated =
                      double.tryParse(value.replaceAll(',', '.')) ?? bearing;

                  ref.read(aPlusLineBearingProvider.notifier).update(updated);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Close',
                  style: textStyle,
                ),
              ),
              if (bearing != null)
                Consumer(
                  builder: (context, ref, child) => SimpleDialogOption(
                    onPressed: () {
                      ref
                          .read(aPlusLineBearingProvider.notifier)
                          .update(bearing);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.check),
                        ),
                        Text(
                          'Use $bearing',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
