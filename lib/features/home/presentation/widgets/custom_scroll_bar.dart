import 'package:flutter/material.dart';

class CustomScrollBar extends StatefulWidget {
  const CustomScrollBar({
    super.key,
    required this.scrollController,
    this.width = 30,
    this.height = 10,
    this.color,
    this.radius = const Radius.circular(5),
  });
  final ScrollController scrollController;
  final Color? color;
  final Radius radius;
  final double height;
  final double width;
  @override
  State<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  double offset = 0;

  void update() {
    setState(() {
      ScrollController controller = widget.scrollController;
      ScrollPosition position = controller.position;
      double maxExtend = position.maxScrollExtent;
      double minExtend = position.minScrollExtent;
      offset = ((position.pixels - minExtend) / maxExtend).clamp(0.0, 1.0);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(update);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(update);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomScrollBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(update);
      widget.scrollController.addListener(update);

      if (widget.scrollController.hasClients) {
        update();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: CustomPaint(
        painter: CustomScrollBarPainter(
          scrollOffset: offset,
          color: widget.color ?? Theme.of(context).colorScheme.primaryContainer,
          radius: widget.radius,
          barHeight: widget.height,
          barWidth: widget.width,
        ),
      ),
    );
  }
}

class CustomScrollBarPainter extends CustomPainter {
  CustomScrollBarPainter({
    required this.scrollOffset,
    required this.color,
    required this.radius,
    required this.barHeight,
    required this.barWidth,
  });
  final double scrollOffset;
  final Color color;
  final Radius radius;
  final double barHeight;
  final double barWidth;

  @override
  void paint(Canvas canvas, Size size) {
    assert(0 <= scrollOffset && scrollOffset <= 1.0);
    final paint = Paint()..color = color;
    final double halfHeight = size.height / 2;
    final double halfBarHeight = barHeight / 2;
    final double halfBarWidth = barWidth / 2;
    final double centerX =
        halfBarWidth + (size.width - barWidth) * scrollOffset;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTRB(
        centerX - halfBarWidth,
        halfHeight - halfBarHeight,
        centerX + halfBarWidth,
        halfHeight + halfBarHeight,
      ),
      radius,
    );
    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
