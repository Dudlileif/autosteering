import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorThemeSelector extends ConsumerWidget {
  const ColorThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<FlexScheme>(
      onSelected: (FlexScheme scheme) =>
          ref.read(colorSchemeProvider.notifier).update(scheme),
      initialValue: ref.read(colorSchemeProvider),
      itemBuilder: (BuildContext context) =>
          CuratedSchemes.curatedSchemes(Theme.of(context).brightness)
              .map(
                (scheme) => PopupMenuItem<FlexScheme>(
                  value: scheme,
                  child: ListTile(
                    leading: Icon(
                      Icons.lens,
                      color: Theme.of(context).brightness == Brightness.light
                          ? FlexColor.schemes[scheme]?.light.primary
                          : FlexColor.schemes[scheme]?.dark.primary,
                      size: 35,
                    ),
                    title: Text(FlexColor.schemes[scheme]?.name ?? 'Scheme'),
                  ),
                ),
              )
              .toList(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.lens,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Theme.of(context).appBarTheme.backgroundColor,
              size: 40,
            ),
            Icon(
              Icons.color_lens,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
