import 'package:flutter/material.dart';

class CustomHorizontalScrollBar extends StatefulWidget {
  const CustomHorizontalScrollBar({
    super.key,
    required this.scrollController,
    this.width = 30,
    this.height = 10,
    this.color,
    this.radius,
  });
  final ScrollController scrollController;
  final Color? color;
  final BorderRadius? radius;
  final double height;
  final double width;
  @override
  State<CustomHorizontalScrollBar> createState() =>
      _CustomHorizontalScrollBarState();
}

class _CustomHorizontalScrollBarState extends State<CustomHorizontalScrollBar> {
  double offset = 0;
  double dragStartOffset = 0;
  double dragStartMouseX = 0;

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
  void didUpdateWidget(covariant CustomHorizontalScrollBar oldWidget) {
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
    return LayoutBuilder(
      builder: (context, constaints) {
        double width = constaints.maxWidth;
        return SizedBox(
          width: double.infinity,
          child: Align(
            alignment: AlignmentGeometry.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start:
                    offset * (width - widget.width).clamp(0.0, double.infinity),
              ),
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  dragStartMouseX = details.globalPosition.dx;
                  dragStartOffset = offset;
                },
                onHorizontalDragUpdate: (details) {
                  final maxMouseOffset = context.size!.width - widget.width;

                  if (maxMouseOffset <= 0) return;

                  final delta = details.globalPosition.dx - dragStartMouseX;

                  final newOffset = (dragStartOffset + delta / maxMouseOffset)
                      .clamp(0.0, 1.0);

                  var scrollPosition = widget.scrollController.position;
                  widget.scrollController.jumpTo(
                    scrollPosition.minScrollExtent +
                        newOffset *
                            (scrollPosition.maxScrollExtent -
                                scrollPosition.minScrollExtent),
                  );
                },
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color:
                        widget.color ??
                        Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: widget.radius ?? BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
