import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/weather/data/repositories/weather_repository.dart';
import 'package:lame_weather/features/weather/domain/entities/weather.dart';

class GetWeatherUseCase {
  WeatherRepository repository;
  GetWeatherUseCase({required this.repository});
  Future<Weather> execute({required String locationName}) =>
      repository.getWeather(location: locationName);
}

class GetWeatherFromPointUseCase {
  WeatherRepository repository;
  GetWeatherFromPointUseCase({required this.repository});
  Future<Weather> execute({required Point locationPoint}) =>
      repository.getWeatherFromPoint(point: locationPoint);
}
