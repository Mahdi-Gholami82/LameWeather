import 'package:lame_weather/features/home/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/home/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/home/domain/entities/weather_condition.dart';

class CurrentWeather {
  const CurrentWeather({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
  });

  final double temperature;
  final double feelsLike;
  final WeatherCondition condition;
}

class Weather {
  const Weather({
    required this.location,
    required this.current,
    required this.dailyForecast,
    required this.hourlyForecast,
  });

  final String location;
  final CurrentWeather current;
  final List<DailyForecast> dailyForecast;
  final List<HourlyForecast> hourlyForecast;
}
