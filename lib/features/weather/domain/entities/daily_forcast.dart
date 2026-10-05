import 'package:lame_weather/features/weather/domain/entities/weather_condition.dart';

class DailyForecast {
  const DailyForecast({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.condition,
    required this.humidity,
  });
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final WeatherCondition condition;
  final int humidity;
}
