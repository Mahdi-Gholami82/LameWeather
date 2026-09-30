import 'package:lame_weather/features/home/domain/entities/weather_condition.dart';

class HourlyForecast {
  const HourlyForecast({
    required this.time,
    required this.temperature,
    required this.condition,
  });

  final DateTime time;
  final double temperature;
  final WeatherCondition condition;
}
