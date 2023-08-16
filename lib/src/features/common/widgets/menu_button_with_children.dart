import 'dart:math';

import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

/// A standardized menu button useful for keeping consistent styling of
/// menus.
class MenuButtonWithChildren extends StatelessWidget {
  /// A standardized menu button useful for keeping consistent styling of
  /// menus.
  ///
  /// The [text] will be show on the button.
  /// Specify the [menuChildren] widgets that will show on the expanded menu.
  /// If the button should have an icon, specify the [icon], which can be
  /// rotated with [iconRotation] degrees.

  const MenuButtonWithChildren({
    required this.text,
    this.menuChildren = const [],
    this.icon,
    this.iconRotation,
    this.iconOverrideWidget,
    super.key,
  });

  /// The children widgets of this menu.
  final List<Widget> menuChildren;

  /// The icon to show besides the text.
  final IconData? icon;

  /// The angle of rotation the icon should be rotated, defaults to no rotation.
  ///
  /// Expected to be in degrees.
  final double? iconRotation;

  /// A widget for overriding the default leading padded [Icon] widget.
  final Widget? iconOverrideWidget;

  /// The text to show on the button.
  final String text;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: Theme.of(context).menuButtonWithChildrenText,
    );

    return SubmenuButton(
      menuChildren: menuChildren,
      child: icon != null || iconOverrideWidget != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: iconRotation != null
                      ? Transform.rotate(
                          angle: iconRotation! / 180 * pi,
                          child: iconOverrideWidget ?? Icon(icon),
                        )
                      : iconOverrideWidget ?? Icon(icon),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: textWidget,
                )
              ],
            )
          : textWidget,
    );
  }
}
