import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/home/domain/entities/weather.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
  WeatherLoading({required this.location});
  final Location location;
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
