import 'package:lame_weather/features/home/data/models/overall_weather.dart';
import 'package:lame_weather/features/home/data/sources/weather_data_source.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather({required String location});
  Future<List<String>> getLoctionSuggestions({required String search});
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource dataSource;
  WeatherRepositoryImpl({required this.dataSource});

  @override
  Future<WeatherModel> getWeather({required String location}) =>
      dataSource.getWeather(location: location);

  @override
  Future<List<String>> getLoctionSuggestions({required String search}) =>
      dataSource.getLoctionSuggestions(search: search);
}
