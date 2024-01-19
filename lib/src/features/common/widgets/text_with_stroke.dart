import 'package:flutter/material.dart';

/// A small [Stack] widget consisting of two [Text] widgets, where one draws the
/// stroke and the other the fill.
class TextWithStroke extends StatelessWidget {
  /// A small [Stack] widget consisting of two [Text] widgets, where one draws
  /// the stroke and the other the fill.
  ///
  /// [text] is the text to be displayed.
  ///
  /// [style] is the optional style of the text.
  ///
  /// [strokeColor] is the color of the stroke.
  ///
  /// [strokeWidth] is the width of the stroke in logical pixels. Defaults
  /// to 0.0 which gives hairthin lines, see [Paint.strokeWidth].
  const TextWithStroke(
    this.text, {
    this.style,
    this.strokeColor = Colors.black,
    this.strokeWidth = 0.0,
    super.key,
  });

  /// The text to be displayed by the widget.
  final String text;

  /// The style of the text.
  final TextStyle? style;

  /// The color of the stroke, defaults to black.
  final Color strokeColor;

  /// The width of the stroke in logical pixels, defaults 0.0 which gives
  /// hairthin lines, see [Paint.strokeWidth].
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroked text
        Text(
          text,
          style: style?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..color = strokeColor
              ..strokeWidth = strokeWidth,
          ),
        ),
        // Filled text
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
