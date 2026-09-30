import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final Widget child;
  final bool? enableShimmer;
  const DefaultShimmer({super.key, this.enableShimmer, required this.child});
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    bool enabled =
        enableShimmer ??
        EnableShimmerInherited.maybeOf(context)?.enableShimmer ??
        false;
    final baseColor = colorScheme.brightness == Brightness.light
        ? Colors.grey.shade300
        : Colors.grey.shade800;
    final highlightColor = colorScheme.brightness == Brightness.light
        ? Colors.grey.shade100
        : Colors.grey.shade600;

    return enabled
        ? Shimmer.fromColors(
            enabled: true,
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: child,
          )
        : child;
  }
}

class ShimmerText extends StatelessWidget {
  const ShimmerText(
    this.text, {
    super.key,
    this.style,
    this.enableShimmer,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.borderRadius,
  });

  final String text;
  final TextStyle? style;
  final bool? enableShimmer;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    bool enabled =
        enableShimmer ??
        EnableShimmerInherited.maybeOf(context)?.enableShimmer ??
        false;
    final textWidget = Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
    var colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Opacity(opacity: enabled ? 0 : 1, child: textWidget),
        if (enabled)
          Positioned.fill(
            child: DefaultShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius:
                      borderRadius ?? BorderRadiusGeometry.circular(10),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class EnableShimmerInherited extends InheritedWidget {
  const EnableShimmerInherited({
    super.key,
    this.enableShimmer = false,
    required super.child,
  });
  final bool enableShimmer;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static EnableShimmerInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EnableShimmerInherited>();
  }

  static EnableShimmerInherited of(BuildContext context) {
    final EnableShimmerInherited? result = maybeOf(context);
    assert(result != null, 'No EnableShimmerInherited found in context');
    return result!;
  }
}
