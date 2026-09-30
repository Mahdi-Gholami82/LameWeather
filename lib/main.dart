import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:lame_weather/features/home/data/repositories/weather_repository.dart';
import 'package:lame_weather/features/home/data/sources/weather_data_source.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_weather.dart';
import 'package:lame_weather/features/home/page.dart';
import 'package:lame_weather/features/home/presentation/bloc/location_suggestions_bloc.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<Client>(Client());
  getIt.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(getIt<Client>()),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(dataSource: getIt<WeatherDataSource>()),
  );
}

Future<void> main() async {
  await dotenv.load();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lame Weather",
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WeatherBloc(
              GetWeatherUseCase(repository: getIt<WeatherRepository>()),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => LocationSuggestionsBloc(
              GetLocationSuggestionsUseCase(
                repository: getIt<WeatherRepository>(),
              ),
            ),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
