import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

/// A standardized menu button useful for keeping consistent styling of
/// menus.
class MenuButtonWithChildren extends StatelessWidget {
  const MenuButtonWithChildren({
    required this.text,
    required this.menuChildren,
    this.icon,
    super.key,
  });

  /// The children widgets of this menu.
  final List<Widget> menuChildren;

  /// The icon to show besides the text.
  final IconData? icon;

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
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(icon),
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
