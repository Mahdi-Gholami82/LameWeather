import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/weather/data/mappers/weather_condition_mapper.dart';
import 'package:lame_weather/features/weather/data/models/weather_model.dart';
import 'package:lame_weather/features/weather/data/sources/weather_source.dart';
import 'package:lame_weather/features/weather/domain/entities/daily_forcast.dart';
import 'package:lame_weather/features/weather/domain/entities/hourly_forecast.dart';
import 'package:lame_weather/features/weather/domain/entities/weather.dart';
import 'package:lame_weather/features/weather/domain/entities/weather_condition.dart';

Weather _fromWeatherModel(WeatherModel weatherModel) {
  final currentWeather = weatherModel.currentWeather;
  final daily = weatherModel.dailyForcasts;
  final hourly = weatherModel.hourlyForecasts;
  final location = weatherModel.location;
  return Weather(
    location: Location(
      name: location.name,
      point: Point(latitude: location.lat, longitude: location.lon),
    ),
    current: CurrentWeather(
      temperature: currentWeather.tempC,
      feelsLike: currentWeather.feelsLikeC,
      condition: WeatherCondition(
        text: currentWeather.conditionText,
        type: mapWeatherApiCode(currentWeather.conditionCode),
      ),
      date: currentWeather.date,
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
            date: hour.dateTime,
            temperature: hour.temperature,
            condition: WeatherCondition(
              text: hour.conditionText,
              type: mapWeatherApiCode(hour.conditionCode),
            ),
            humidity: hour.humidity,
          ),
        )
        .toList(),
  );
}

abstract class WeatherRepository {
  Future<Weather> getWeather({required String location});
  Future<Weather> getWeatherFromPoint({required Point point});
  Future<List<Location>> getLoctionSuggestions({required String search});
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource dataSource;
  WeatherRepositoryImpl({required this.dataSource});

  @override
  Future<Weather> getWeather({required String location}) async =>
      _fromWeatherModel(await dataSource.getWeather(location: location));

  @override
  Future<List<Location>> getLoctionSuggestions({
    required String search,
  }) async => (await dataSource.getLocationSuggestions(
    search: search,
  )).map((e) => e.toEntity()).toList();

  @override
  Future<Weather> getWeatherFromPoint({required Point point}) async =>
      _fromWeatherModel(
        await dataSource.getWeatherFromPoint(
          latitude: point.latitude,
          longitude: point.longitude,
        ),
      );
}
