import 'package:flutter/material.dart';

class VerticalGradiantBar extends StatelessWidget {
  const VerticalGradiantBar({
    super.key,
    required this.background,
    required this.foreground,
    required this.width,
    required this.radius,
    required this.foregroundFill,
    this.fillOffset = 0.1,
  });

  final Color foreground;
  final Color background;
  final double width;
  final Radius radius;
  final double foregroundFill;
  final double fillOffset;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromWidth(width),
      painter: VerticalGradiantBarPainter(
        background: background,
        foreground: foreground,
        width: width,
        radius: radius,
        foregroundFill: foregroundFill,
        fillOffset: fillOffset,
      ),
    );
  }
}

class VerticalGradiantBarPainter extends CustomPainter {
  VerticalGradiantBarPainter({
    required this.background,
    required this.foreground,
    required this.width,
    required this.radius,
    required this.foregroundFill,
    required this.fillOffset,
  });
  final Color foreground;
  final Color background;
  final double width;
  final Radius radius;
  final double foregroundFill;
  final double fillOffset;
  @override
  void paint(Canvas canvas, Size size) {
    assert(0 <= foregroundFill && foregroundFill <= 1.0);
    double realStop = 1 - foregroundFill + fillOffset / 2 + 0.08;
    realStop = realStop.clamp(0, 1.0);
    double fillBegin = realStop - fillOffset;
    double fillEnd = realStop + fillOffset;
    var center = size.width / 2;
    var halfWidth = width / 2;
    var rect = RRect.fromRectAndRadius(
      Rect.fromLTRB(center - halfWidth, size.height, center + halfWidth, 0),
      radius,
    );
    var paint = Paint()
      ..shader = LinearGradient(
        begin: AlignmentGeometry.bottomCenter,
        end: AlignmentGeometry.topCenter,
        stops: [fillBegin, fillEnd],
        colors: [background, foreground],
        transform: GradientRotation(0.6),
      ).createShader(rect.outerRect);

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
