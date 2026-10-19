import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/presentation/theme/text_styles.dart';
import 'package:lame_weather/features/home/presentation/widgets/drawer.dart';
import 'package:lame_weather/features/settings/page.dart';
import 'package:lame_weather/features/weather/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/weather/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/weather/domain/entities/weather.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_state.dart';
import 'package:lame_weather/features/home/presentation/weather_icons_mapper.dart';
import 'package:lame_weather/features/home/presentation/widgets/custom_scroll_bar.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_day_prediction.dart';
import 'package:lame_weather/features/home/presentation/widgets/next_hours_prediction.dart';
import 'package:lame_weather/features/home/utils/is_day_time.dart';
import 'package:lame_weather/features/home/utils/week_day_formatter.dart';
import 'package:lame_weather/features/location/page.dart';
import 'package:shimmer_builder/shimmer_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer? _getWeatherCompleter;
  Future<void> getWeather(Location location) async {
    _getWeatherCompleter = Completer();
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(GetWeatherFromPointEvent(point: location.point));
  }

  void pushToLocations(BuildContext context) {
    Navigator.of(context).pushNamed(LocationsPage.route);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<Location> savedLocations = GetIt.instance<PreferencesRepository>()
          .getSavedLocations();
      if (savedLocations.isEmpty) {
        pushToLocations(context);
      } else {
        getWeather(savedLocations.first);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (BuildContext context, WeatherState weatherState) {
        switch (weatherState) {
          case WeatherError error:
            {
              pushToLocations(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Failed to fetch weather",
                    style: TextStyle(color: theme.colorScheme.onErrorContainer),
                  ),
                  backgroundColor: theme.colorScheme.errorContainer,
                ),
              );
            }
          case WeatherLoaded loaded:
            {
              var prefs = GetIt.instance<PreferencesRepository>();
              Location location = loaded.weather.location;
              List<Location> savedLocations = prefs.getSavedLocations();
              savedLocations.remove(location);
              prefs.saveLocations(savedLocations..insert(0, location));
              if (!(_getWeatherCompleter?.isCompleted ?? true)) {
                _getWeatherCompleter?.complete(null);
              }
            }
        }
      },
      builder: (context, weatherState) {
        Weather? weather = weatherState is WeatherLoaded
            ? weatherState.weather
            : null;
        bool loading = weatherState is! WeatherLoaded;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text("Lame Weather"),
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  if (weatherState case WeatherLoaded loaded) {
                    getWeather(loaded.weather.location);
                    await _getWeatherCompleter?.future;
                  }
                },
                child: Shimmer(
                  enable: loading,
                  duration: Duration(seconds: 2),
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
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
                                  flex: 2,
                                  child: FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 20,
                                      children: [
                                        ShimmerBuilder(
                                          childBuilder: (_) => Text(
                                            "${weather!.current.temperature}°",
                                            style: AppTextStyles.temperature,
                                          ),
                                          sampleBuilder: (_) => Text(
                                            "68°",
                                            style: AppTextStyles.temperature
                                                .copyWith(
                                                  color: colorScheme.surface,
                                                ),
                                          ),
                                        ),
                                        ShimmerBuilder(
                                          childBuilder: (_) => Text(
                                            weather!.current.condition.text,
                                            style:
                                                AppTextStyles.weatherCondition,
                                          ),
                                          sampleBuilder: (_) => Text(
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
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                pushToLocations(context);
                                              },
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                      child: ShimmerBuilder(
                                                        childBuilder: (_) =>
                                                            Text(
                                                              weather!
                                                                  .location
                                                                  .name,
                                                            ),
                                                        sampleBuilder: (_) =>
                                                            Text(
                                                              "***********",
                                                              style: TextStyle(
                                                                color:
                                                                    colorScheme
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
                                            ),
                                            ShimmerBuilder(
                                              childBuilder: (_) => Text(
                                                "Feels like ${weather!.current.feelsLike}°",
                                                style: AppTextStyles.secondary,
                                              ),
                                              sampleBuilder: (_) => Text(
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
                                  flex: 3,
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ShimmerBuilder(
                                        childBuilder: (_) => Icon(
                                          getWeatherIconFromCondition(
                                            weather!.current.condition.type,
                                            isDay: isDaytime(
                                              weather.current.date,
                                            ),
                                          ),
                                          size: 130,
                                        ),
                                        sampleBuilder: (_) => Container(
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
                        sliver: SliverToBoxAdapter(
                          child: ShimmerBuilder(
                            sampleBuilder: (_) =>
                                SizedBox(width: double.infinity, height: 300),
                            childBuilder: (_) {
                              var dailyPredictionListController =
                                  ScrollController();
                              return Container(
                                height: 350,
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  right: 15,
                                  left: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        controller:
                                            dailyPredictionListController,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            weather!.hourlyForecast.length,
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
                                                isDay: isDaytime(
                                                  currentForecast.date,
                                                ),
                                              ),
                                              time: currentForecast.date,
                                              temperature:
                                                  currentForecast.temperature,
                                              percentage:
                                                  currentForecast.humidity,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      child: CustomScrollBar(
                                        scrollController:
                                            dailyPredictionListController,
                                        color:
                                            colorScheme.surfaceContainerHighest,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
                            padding: EdgeInsets.all(loading ? 0 : 25),
                            sliver: ShimmerBuilder(
                              wrapWithSliverToBoxAdapter: true,
                              sampleBuilder: (_) => const SizedBox(
                                height: 150,
                                width: double.infinity,
                              ),
                              childBuilder: (_) => SliverList.builder(
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
