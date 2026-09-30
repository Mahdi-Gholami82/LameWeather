import 'package:lame_weather/features/home/domain/entities/weather_condition.dart';

WeatherConditionType mapWeatherApiCode(int code) {
  return switch (code) {
    1000 => WeatherConditionType.clear,
    1003 => WeatherConditionType.partlyCloudy,
    1006 => WeatherConditionType.cloudy,
    1009 => WeatherConditionType.overcast,

    1063 ||
    1180 ||
    1183 ||
    1186 ||
    1189 ||
    1192 ||
    1195 => WeatherConditionType.rain,

    1066 ||
    1210 ||
    1213 ||
    1216 ||
    1219 ||
    1222 ||
    1225 => WeatherConditionType.snow,

    1087 => WeatherConditionType.thunderstorm,

    _ => WeatherConditionType.unknown,
  };
}
