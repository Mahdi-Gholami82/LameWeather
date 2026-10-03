import 'package:lame_weather/features/home/domain/entities/weather_condition.dart';

class HourlyForecast {
  const HourlyForecast({
    required this.date,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  final DateTime date;
  final double temperature;
  final WeatherCondition condition;
  final int humidity;
}
