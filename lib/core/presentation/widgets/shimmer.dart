import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final Widget Function() childBuilder;
  final Widget Function()? sampleBuilder;
  final bool? enableShimmer;
  final bool isSliver;
  const DefaultShimmer({
    super.key,
    this.enableShimmer,
    required this.childBuilder,
    this.sampleBuilder,
    this.isSliver = false,
  });
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

    Widget getShimmer() => Shimmer.fromColors(
      enabled: true,
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: (sampleBuilder ?? childBuilder)(),
    );
    return enabled
        ? isSliver
              ? SliverToBoxAdapter(child: getShimmer())
              : getShimmer()
        : childBuilder();
  }
}

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  const ShimmerContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
  );
}

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    this.enableShimmer,
    this.borderRadius,
    required this.childBuilder,
    required this.sampleBuilder,
  });

  final bool? enableShimmer;
  final BorderRadiusGeometry? borderRadius;
  final Widget Function() childBuilder;
  final Widget Function() sampleBuilder;

  @override
  Widget build(BuildContext context) {
    bool enabled =
        enableShimmer ??
        EnableShimmerInherited.maybeOf(context)?.enableShimmer ??
        false;
    var colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        enabled ? sampleBuilder() : childBuilder(),
        if (enabled)
          Positioned.fill(
            child: DefaultShimmer(
              childBuilder: () => Container(
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
