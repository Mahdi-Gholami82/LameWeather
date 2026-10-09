import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:lame_weather/core/api/api_config.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/features/weather/data/repositories/weather_repository.dart';
import 'package:lame_weather/core/data/sources/preferances_source.dart';
import 'package:lame_weather/features/weather/data/sources/weather_source.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/weather/domain/use_cases/get_weather.dart';
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

List<BlocProvider> get mainBlocProviders => [
  BlocProvider<WeatherBloc>(
    create: (_) => WeatherBloc(
      getWeatherUseCase: getIt<GetWeatherUseCase>(),
      getWeatherFromPointUseCase: getIt<GetWeatherFromPointUseCase>(),
    ),
  ),
  BlocProvider<LocationSuggestionsBloc>(
    create: (_) =>
        LocationSuggestionsBloc(getIt<GetLocationSuggestionsUseCase>()),
  ),
  BlocProvider<LocationBloc>(
    create: (_) => LocationBloc(getIt<GetCurrentLocationUseCase>()),
  ),
];

Future<void> configureDependencies() async {
  getIt.registerSingleton<WeatherApiConfig>(
    WeatherApiConfig(
      host: "api.weatherapi.com",
      version: "v1",
      key:
          dotenv.env["WEATHER_API_KEY"] ??
          (throw Exception("WEATHER_API_KEY is not configured")),
    ),
  );

  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton(() => PreferencesDataSource(getIt()));
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(getIt()),
  );
  // if (kDebugMode) {
  //   await prefs.clear();
  // }
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
  getIt.registerLazySingleton<LocationDataSource>(
    () => LocationDataSourceImpl(),
  );
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationDataSource>()),
  );
  getIt.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(repository: getIt<WeatherRepository>()),
  );

  getIt.registerLazySingleton<GetWeatherFromPointUseCase>(
    () => GetWeatherFromPointUseCase(repository: getIt<WeatherRepository>()),
  );

  getIt.registerLazySingleton<GetLocationSuggestionsUseCase>(
    () => GetLocationSuggestionsUseCase(repository: getIt<WeatherRepository>()),
  );

  getIt.registerLazySingleton<GetCurrentLocationUseCase>(
    () => GetCurrentLocationUseCase(getIt<LocationRepository>()),
  );
  getIt.registerSingleton<List<BlocProvider>>(mainBlocProviders);
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
      providers: getIt<List<BlocProvider>>(),
      child: MaterialApp(
        title: "Lame Weather",
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
        ),
        routes: {Locations.route: (context) => Locations()},
        home: HomePage(),
      ),
    );
  }
}
