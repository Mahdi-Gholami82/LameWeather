import 'package:flutter/material.dart';
import 'package:lame_weather/core/presentation/weather_icons.dart';
import 'package:lame_weather/features/weather/domain/entities/weather_condition.dart';

IconData getWeatherIconFromCondition(
  WeatherConditionType condition, {
  required bool isDay,
}) {
  if (isDay) {
    return switch (condition) {
      WeatherConditionType.clear => WeatherIcons.daySunny,

      WeatherConditionType.partlyCloudy => WeatherIcons.dayCloudy,

      WeatherConditionType.cloudy => WeatherIcons.cloudy,

      WeatherConditionType.overcast => WeatherIcons.cloudy,

      WeatherConditionType.mist => WeatherIcons.dayFog,

      WeatherConditionType.fog => WeatherIcons.dayFog,

      WeatherConditionType.haze => WeatherIcons.dayHaze,

      WeatherConditionType.smoke => WeatherIcons.smoke,

      WeatherConditionType.smog => WeatherIcons.smog,

      WeatherConditionType.dust => WeatherIcons.dust,

      WeatherConditionType.sandstorm => WeatherIcons.sandstorm,

      WeatherConditionType.drizzle => WeatherIcons.daySprinkle,

      WeatherConditionType.freezingDrizzle => WeatherIcons.daySleet,

      WeatherConditionType.rain => WeatherIcons.dayRain,

      WeatherConditionType.freezingRain => WeatherIcons.dayRainMix,

      WeatherConditionType.rainShowers => WeatherIcons.dayShowers,

      WeatherConditionType.snow => WeatherIcons.daySnow,

      WeatherConditionType.freezingSnow => WeatherIcons.daySnow,

      WeatherConditionType.snowShowers => WeatherIcons.daySnow,

      WeatherConditionType.sleet => WeatherIcons.daySleet,

      WeatherConditionType.sleetShowers => WeatherIcons.daySleet,

      WeatherConditionType.icePellets => WeatherIcons.dayHail,

      WeatherConditionType.icePelletShowers => WeatherIcons.dayHail,

      WeatherConditionType.thunderstorm => WeatherIcons.dayThunderstorm,

      WeatherConditionType.rainThunderstorm => WeatherIcons.dayStormShowers,

      WeatherConditionType.snowThunderstorm => WeatherIcons.daySnowThunderstorm,

      WeatherConditionType.blowingSnow => WeatherIcons.daySnowWind,

      WeatherConditionType.blizzard => WeatherIcons.daySnowWind,

      WeatherConditionType.unknown => WeatherIcons.na,
    };
  }

  return switch (condition) {
    WeatherConditionType.clear => WeatherIcons.nightClear,

    WeatherConditionType.partlyCloudy => WeatherIcons.nightAltPartlyCloudy,

    WeatherConditionType.cloudy => WeatherIcons.nightCloudy,

    WeatherConditionType.overcast => WeatherIcons.nightCloudy,

    WeatherConditionType.mist => WeatherIcons.nightFog,

    WeatherConditionType.fog => WeatherIcons.nightFog,

    WeatherConditionType.haze => WeatherIcons.dayHaze,

    WeatherConditionType.smoke => WeatherIcons.smoke,

    WeatherConditionType.smog => WeatherIcons.smog,

    WeatherConditionType.dust => WeatherIcons.dust,

    WeatherConditionType.sandstorm => WeatherIcons.sandstorm,

    WeatherConditionType.drizzle => WeatherIcons.nightAltSprinkle,

    WeatherConditionType.freezingDrizzle => WeatherIcons.nightAltSleet,

    WeatherConditionType.rain => WeatherIcons.nightAltRain,

    WeatherConditionType.freezingRain => WeatherIcons.nightAltRainMix,

    WeatherConditionType.rainShowers => WeatherIcons.nightAltShowers,

    WeatherConditionType.snow => WeatherIcons.nightAltSnow,

    WeatherConditionType.freezingSnow => WeatherIcons.nightAltSnow,

    WeatherConditionType.snowShowers => WeatherIcons.nightAltSnow,

    WeatherConditionType.sleet => WeatherIcons.nightAltSleet,

    WeatherConditionType.sleetShowers => WeatherIcons.nightAltSleet,

    WeatherConditionType.icePellets => WeatherIcons.nightAltHail,

    WeatherConditionType.icePelletShowers => WeatherIcons.nightAltHail,

    WeatherConditionType.thunderstorm => WeatherIcons.nightAltThunderstorm,

    WeatherConditionType.rainThunderstorm => WeatherIcons.nightAltStormShowers,

    WeatherConditionType.snowThunderstorm =>
      WeatherIcons.nightAltSnowThunderstorm,

    WeatherConditionType.blowingSnow => WeatherIcons.nightAltSnowWind,

    WeatherConditionType.blizzard => WeatherIcons.nightAltSnowWind,

    WeatherConditionType.unknown => WeatherIcons.na,
  };
}
