import 'package:lame_weather/features/home/data/mappers/weather_condition_mapper.dart';
import 'package:lame_weather/features/home/data/repositories/weather_repository.dart';
import 'package:lame_weather/features/home/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/home/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/home/domain/entities/weather.dart';
import 'package:lame_weather/features/home/domain/entities/weather_condition.dart';

class GetWeather {
  WeatherRepository repository;
  GetWeather({required this.repository});
  Future<Weather> execute({required String location}) async {
    final weatherResponse = await repository.getWeather(location: location);
    final currentWeather = weatherResponse.currentWeather;
    final daily = weatherResponse.dailyForcasts;
    final hourly = weatherResponse.hourlyForecasts;
    return Weather(
      location: location,
      current: CurrentWeather(
        temperature: currentWeather.tempC,
        feelsLike: currentWeather.feelsLikeC,
        condition: WeatherCondition(
          text: currentWeather.conditionText,
          type: mapWeatherApiCode(currentWeather.conditionCode),
        ),
      ),
      dailyForecast: daily
          .map(
            (day) => DailyForecast(
              date: day.date,
              minTemperature: day.minTemperature,
              maxTemperature: day.maxTemperature,
              condition: WeatherCondition(
                text: day.conditionText,
                type: mapWeatherApiCode(day.conditionCode),
              ),
              humidity: day.humidity,
            ),
          )
          .toList(),
      hourlyForecast: hourly
          .map(
            (hour) => HourlyForecast(
              time: hour.dateTime,
              temperature: hour.temperature,
              condition: WeatherCondition(
                text: hour.conditionText,
                type: mapWeatherApiCode(hour.conditionCode),
              ),
            ),
          )
          .toList(),
    );
  }
}
