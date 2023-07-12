import 'package:flutter/material.dart';

/// An extension for standarizing the text style used in the menu buttons.
extension MenuButtonWithChildreTextExtension on ThemeData {
  /// A standardized text style for use with menu buttons.
  TextStyle? get menuButtonWithChildrenText =>
      textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500);
}
