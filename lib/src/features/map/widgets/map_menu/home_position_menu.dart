import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for showing and updating the default home position.
class HomePositionMenu extends StatelessWidget {
  /// A menu for showing and updating the default home position.
  const HomePositionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      icon: Icons.home,
      text: 'Home',
      menuChildren: [
        Center(
          child: Consumer(
            builder: (context, ref, child) {
              final position = ref.watch(homePositionProvider);

              return SelectableText(
                '''
Lat: ${position.latitude.toStringAsFixed(6)}
Lon: ${position.longitude.toStringAsFixed(6)}''',
                style: textStyle,
              );
            },
          ),
        ),
        Consumer(
          child: Text(
            'Set to screen center',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            onTap: () {
              ref.read(homePositionProvider.notifier).update(
                    ref.watch(
                      mainMapControllerProvider
                          .select((value) => value.camera.center),
                    ),
                  );
              ref.read(currentCountryProvider.notifier).update();
            },
          ),
        ),
      ],
    );
  }
}
