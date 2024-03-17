part of 'vehicle_top_down_painter.dart';

class _TractorTopDownPainter extends CustomPainter {
  _TractorTopDownPainter({
    required this.svgPicture,
    required this.colors,
    this.sourceWidth = 60,
    this.sourceHeight = 108,
    this.stretch = false,
    this.steeringAxleOffset,
    this.steeringAxleWidth,
  });

  final ui.Picture svgPicture;

  final ManufacturerColors colors;

  final bool stretch;

  final double? steeringAxleOffset;
  final double? steeringAxleWidth;

  final double sourceWidth;
  final double sourceHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = findScale(size);

    if (stretch) {
      canvas.scale(scale.x, scale.y);
    } else {
      canvas.scale(scale.min);
    }
    drawSteeringAxle(canvas);
    canvas.drawPicture(svgPicture);
  }

  ({double x, double y, double min}) findScale(Size size) {
    final scaleX = size.width / sourceWidth;
    final scaleY = size.height / sourceHeight;

    return (x: scaleX, y: scaleY, min: scaleX < scaleY ? scaleX : scaleY);
  }

  void drawSteeringAxle(
    Canvas canvas, {
    bool withStroke = true,
  }) {
    final rect = Rect.fromCenter(
      center:
          Offset(sourceWidth / 2, (steeringAxleOffset ?? 0.15) * sourceHeight),
      width: (steeringAxleWidth ?? 0.7) * sourceWidth,
      height: 6,
    );
    canvas.drawRect(
      rect,
      Paint()..color = colors.frame ?? Colors.grey.shade800,
    );
    if (withStroke) {
      canvas.drawRect(
        rect,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(_TractorTopDownPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TractorTopDownPainter oldDelegate) => false;
}
