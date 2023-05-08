import 'package:flutter/material.dart';

class MenuButtonWithChildren extends StatelessWidget {
  const MenuButtonWithChildren({
    required this.text,
    required this.menuChildren,
    this.icon,
    super.key,
  });
  final List<Widget> menuChildren;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w500),
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
