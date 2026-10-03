import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/presentation/widgets/shimmer.dart';
import 'package:lame_weather/core/presentation/theme/text_styles.dart';
import 'package:lame_weather/features/home/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/home/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/home/domain/entities/weather.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_state.dart';
import 'package:lame_weather/features/home/presentation/weather_icons_mapper.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_day_prediction.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_hours_prediction.dart';
import 'package:lame_weather/features/home/utils/is_day_time.dart';
import 'package:lame_weather/features/home/utils/week_day_formatter.dart';
import 'package:lame_weather/features/location/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> getWeather(Location location) async {
      BlocProvider.of<WeatherBloc>(
        context,
      ).add(GetWeatherFromPointEvent(location: location));
    }

    var scrollController = ScrollController();

    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (BuildContext context, WeatherState weatherState) {
        switch (weatherState) {
          case WeatherError error:
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Failed to fetch weather : ${error.message}",
                    style: TextStyle(color: theme.colorScheme.onErrorContainer),
                  ),
                  backgroundColor: theme.colorScheme.errorContainer,
                ),
              );
            }
        }
      },
      buildWhen: (previous, current) => current is WeatherLoaded,
      builder: (context, weatherState) {
        switch (weatherState) {
          case WeatherInitial _ || WeatherError _:
            {
              List<Location> savedLocations =
                  GetIt.instance<PreferencesRepository>().getSavedLocations();
              if (savedLocations.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  var navigator = Navigator.of(context);
                  navigator.pushNamed(LocationSelectorPage.route);
                });
              } else {
                getWeather(savedLocations.first);
              }
            }
          case WeatherLoaded _:
          case WeatherLoading _:
        }
        Weather? weather = weatherState is WeatherLoaded
            ? weatherState.weather
            : null;
        bool loading = weather == null;
        return Scaffold(
          appBar: AppBar(backgroundColor: theme.colorScheme.primary),
          body: SafeArea(
            child: RefreshIndicator(
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 0;
              },
              onRefresh: () async {},
              child: EnableShimmerInherited(
                enableShimmer: loading,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 20,
                                      children: [
                                        ShimmerText(
                                          childBuilder: () => Text(
                                            "${weather!.current.temperature}°",
                                            style: AppTextStyles.temperature,
                                          ),
                                          sampleBuilder: () => Text(
                                            "68°",
                                            style: AppTextStyles.temperature
                                                .copyWith(
                                                  color: colorScheme.surface,
                                                ),
                                          ),
                                        ),
                                        ShimmerText(
                                          childBuilder: () => Text(
                                            weather!.current.condition.text,
                                            style:
                                                AppTextStyles.weatherCondition,
                                          ),
                                          sampleBuilder: () => Text(
                                            "Clear",
                                            style: AppTextStyles
                                                .weatherCondition
                                                .copyWith(
                                                  color: colorScheme.surface,
                                                ),
                                          ),
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
                                                      childBuilder: () => Text(
                                                        weather!.location.name,
                                                      ),
                                                      sampleBuilder: () => Text(
                                                        "***********",
                                                        style: TextStyle(
                                                          color: colorScheme
                                                              .surface,
                                                        ),
                                                      ),
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
                                              childBuilder: () => Text(
                                                "Feels like ${weather!.current.feelsLike}°",
                                                style: AppTextStyles.secondary,
                                              ),
                                              sampleBuilder: () => Text(
                                                "Feels like 55°",
                                                style: AppTextStyles.secondary
                                                    .copyWith(
                                                      color:
                                                          colorScheme.surface,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: DefaultShimmer(
                                        childBuilder: () => Icon(
                                          getWeatherIconFromCondition(
                                            weather!.current.condition.type,
                                            isDay: isDaytime(
                                              weather.current.date,
                                            ),
                                          ),
                                          size: 130,
                                        ),
                                        sampleBuilder: () => Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: colorScheme.surface,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
                      SliverPadding(padding: EdgeInsetsGeometry.all(20)),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        sliver: DecoratedSliver(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          sliver: SliverToBoxAdapter(
                            child: SizedBox(
                              height: 400,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 15,
                                ),
                                itemCount: weather!.hourlyForecast.length,
                                itemBuilder: (context, index) {
                                  final HourlyForecast currentForecast =
                                      weather.hourlyForecast[index];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: NextHoursPrediction(
                                      icon: getWeatherIconFromCondition(
                                        currentForecast.condition.type,
                                        isDay: isDaytime(currentForecast.date),
                                      ),
                                      time: currentForecast.date,
                                      temperature: currentForecast.temperature,
                                      percentage: currentForecast.humidity,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        sliver: DecoratedSliver(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          sliver: SliverPadding(
                            padding: const EdgeInsets.all(25),
                            sliver: DefaultShimmer(
                              isSliver: true,
                              sampleBuilder: () => const ShimmerContainer(
                                height: 400,
                                width: 300,
                              ),
                              childBuilder: () => SliverList.builder(
                                itemCount: weather!.dailyForecast.length,
                                itemBuilder: (context, index) {
                                  final DailyForecast currentForecast =
                                      weather.dailyForecast[index];

                                  return NextDayPrediction(
                                    dayLabel: weekDayFormatter(
                                      currentForecast.date,
                                    ),
                                    humidity: currentForecast.humidity,
                                    icon: getWeatherIconFromCondition(
                                      currentForecast.condition.type,
                                      isDay: isDaytime(currentForecast.date),
                                    ),
                                    maxTemp: currentForecast.maxTemperature,
                                    minTemp: currentForecast.minTemperature,
                                  );
                                },
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
