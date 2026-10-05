enum WeatherConditionType {
  clear,
  partlyCloudy,
  cloudy,
  overcast,
  mist,
  fog,
  haze,
  smoke,
  smog,
  dust,
  sandstorm,
  drizzle,
  freezingDrizzle,
  rain,
  freezingRain,
  rainShowers,
  snow,
  freezingSnow,
  snowShowers,
  sleet,
  sleetShowers,
  icePellets,
  icePelletShowers,
  thunderstorm,
  rainThunderstorm,
  snowThunderstorm,
  blowingSnow,
  blizzard,
  unknown,
}

class WeatherCondition {
  WeatherCondition({required this.text, required this.type});
  final String text;
  final WeatherConditionType type;
}
