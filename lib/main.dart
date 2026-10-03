import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/data/repositories/weather_repository.dart';
import 'package:lame_weather/core/data/sources/preferances_source.dart';
import 'package:lame_weather/core/data/sources/weather_source.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_weather.dart';
import 'package:lame_weather/features/home/page.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_bloc.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';
import 'package:lame_weather/features/location/data/repositories/location_repository.dart';
import 'package:lame_weather/features/location/data/sources/location_data_source.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location.dart';
import 'package:lame_weather/features/location/page.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton(() => PreferencesDataSource(getIt()));
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(getIt()),
  );

  getIt.registerSingleton<Client>(
    Client(),
    dispose: (client) => client.close(),
  );
  getIt.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(getIt<Client>()),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(dataSource: getIt<WeatherDataSource>()),
  );
  getIt.registerLazySingleton<LocationDataSource>(() => LocationDataSource());
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationDataSource>()),
  );
}

Future<void> main() async {
  await dotenv.load();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WeatherBloc(
            getWeatherUseCase: GetWeatherUseCase(
              repository: getIt<WeatherRepository>(),
            ),
            getWeatherFromPointUseCase: GetWeatherFromPointUseCase(
              repository: getIt<WeatherRepository>(),
            ),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) {
            return LocationSuggestionsBloc(
              GetLocationSuggestionsUseCase(
                repository: getIt<WeatherRepository>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) => LocationBloc(
            GetCurrentLocationUseCase(getIt<LocationRepository>()),
          ),
        ),
      ],
      child: MaterialApp(
        title: "Lame Weather",
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
        ),
        routes: {
          LocationSelectorPage.route: (context) => LocationSelectorPage(),
        },
        home: HomePage(),
      ),
    );
  }
}
