import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/weather/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/weather/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/weather/domain/entities/weather_condition.dart';

class CurrentWeather {
  const CurrentWeather({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.date,
  });

  final double temperature;
  final double feelsLike;
  final WeatherCondition condition;
  final DateTime date;
}

class Weather {
  const Weather({
    required this.location,
    required this.current,
    required this.dailyForecast,
    required this.hourlyForecast,
  });

  final Location location;
  final CurrentWeather current;
  final List<DailyForecast> dailyForecast;
  final List<HourlyForecast> hourlyForecast;
}
