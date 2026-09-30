import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/core/presentation/shimmer.dart';
import 'package:lame_weather/core/presentation/theme/text_styles.dart';
import 'package:lame_weather/core/presentation/weather_icons.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_cubit.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_day_prediction.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_hours_prediction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    bool loading = false;
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(backgroundColor: theme.colorScheme.primary),
          body: SafeArea(
            child: RefreshIndicator(
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 0;
              },
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2));
              },
              child: BlocProvider(
                create: (BuildContext context) => WeatherCubit(),
                child: EnableShimmerInherited(
                  enableShimmer: loading,
                  child: CustomScrollView(
                    scrollBehavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsetsGeometry.all(50),
                        sliver: SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: FittedBox(
                                    child: DefaultShimmer(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 20,
                                        children: [
                                          ShimmerText(
                                            "68°",
                                            style: AppTextStyles.temperature,
                                          ),
                                          ShimmerText(
                                            "Clear",
                                            style:
                                                AppTextStyles.weatherCondition,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                      child: ShimmerText(
                                                        "Babol  ",
                                                      ),
                                                    ),
                                                    if (!loading)
                                                      WidgetSpan(
                                                        alignment:
                                                            PlaceholderAlignment
                                                                .middle,
                                                        child: Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 18,
                                                          color: colorScheme
                                                              .onSurfaceVariant,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles.location,
                                              ),
                                              ShimmerText(
                                                "Feels like 55°",
                                                style: AppTextStyles.secondary,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: FittedBox(
                                    child: loading
                                        ? DefaultShimmer(
                                            child: Container(
                                              width: 200,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                color: colorScheme.surface,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        : Icon(WeatherIcons.cloud, size: 170),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(padding: EdgeInsetsGeometry.all(20)),
                      SliverPadding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Center(
                            child: DefaultShimmer(
                              child: Container(
                                width: 400,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "Partly cloudy with lorem epsium",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Divider(),
                                    Row(
                                      spacing: 10,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        NextHoursPrediction(),
                                        NextHoursPrediction(),
                                        NextHoursPrediction(),
                                        NextHoursPrediction(),
                                        NextHoursPrediction(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Center(
                            child: DefaultShimmer(
                              child: Container(
                                width: 400,
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    NextDayPrediction(),
                                    NextDayPrediction(),
                                    NextDayPrediction(),
                                    NextDayPrediction(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
