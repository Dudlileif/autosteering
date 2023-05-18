import 'package:flutter/material.dart';

/// An extension for standarizing the text style used in the menu buttons.
extension MenuButtonWithChildreTextExtension on ThemeData {
  TextStyle? get menuButtonWithChildrenText =>
      textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500);
}
