import 'package:lame_weather/features/home/data/models/daily_forcast_model.dart';
import 'package:lame_weather/features/home/data/models/hourly_forecast_model.dart';
import 'package:lame_weather/features/home/data/models/current_weather_model.dart';

class WeatherModel {
  WeatherModel({
    required this.currentWeather,
    required this.dailyForcasts,
    required this.hourlyForecasts,
    required this.locationName,
  });
  CurrentWeatherModel currentWeather;
  List<HourlyForecastModel> hourlyForecasts;
  List<DailyForcastModel> dailyForcasts;
  String locationName;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var forecast =
        json["forecast"]["forecastday"] as List<Map<String, dynamic>>;
    return WeatherModel(
      currentWeather: CurrentWeatherModel.fromJson(json["current"]),
      dailyForcasts: forecast
          .map((e) => DailyForcastModel.fromJson(e["day"]))
          .toList(),
      hourlyForecasts: forecast
          .map((e) => HourlyForecastModel.fromJson(e["hour"]))
          .toList(),
      locationName: json["location"]["name"],
    );
  }
}
