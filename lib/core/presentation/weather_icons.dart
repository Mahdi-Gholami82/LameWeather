import 'package:flutter/widgets.dart';

abstract final class WeatherIcons {
  static const String fontFamily = 'weathericons';

  static const IconData daySunny = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData dayCloudy = IconData(0xf002, fontFamily: fontFamily);
  static const IconData dayCloudyGusts = IconData(
    0xf000,
    fontFamily: fontFamily,
  );
  static const IconData dayCloudyWindy = IconData(
    0xf001,
    fontFamily: fontFamily,
  );
  static const IconData dayFog = IconData(0xf003, fontFamily: fontFamily);
  static const IconData dayHail = IconData(0xf004, fontFamily: fontFamily);
  static const IconData dayHaze = IconData(0xf0b6, fontFamily: fontFamily);
  static const IconData dayLightning = IconData(0xf005, fontFamily: fontFamily);
  static const IconData dayRain = IconData(0xf008, fontFamily: fontFamily);
  static const IconData dayRainMix = IconData(0xf006, fontFamily: fontFamily);
  static const IconData dayRainWind = IconData(0xf007, fontFamily: fontFamily);
  static const IconData dayShowers = IconData(0xf009, fontFamily: fontFamily);
  static const IconData daySleet = IconData(0xf0b2, fontFamily: fontFamily);
  static const IconData daySleetStorm = IconData(
    0xf068,
    fontFamily: fontFamily,
  );
  static const IconData daySnow = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData daySnowThunderstorm = IconData(
    0xf06b,
    fontFamily: fontFamily,
  );
  static const IconData daySnowWind = IconData(0xf065, fontFamily: fontFamily);
  static const IconData daySprinkle = IconData(0xf00b, fontFamily: fontFamily);
  static const IconData dayStormShowers = IconData(
    0xf00e,
    fontFamily: fontFamily,
  );
  static const IconData daySunnyOvercast = IconData(
    0xf00c,
    fontFamily: fontFamily,
  );
  static const IconData dayThunderstorm = IconData(
    0xf010,
    fontFamily: fontFamily,
  );
  static const IconData dayWindy = IconData(0xf085, fontFamily: fontFamily);
  static const IconData solarEclipse = IconData(0xf06e, fontFamily: fontFamily);
  static const IconData hot = IconData(0xf072, fontFamily: fontFamily);
  static const IconData dayCloudyHigh = IconData(
    0xf07d,
    fontFamily: fontFamily,
  );
  static const IconData dayLightWind = IconData(0xf0c4, fontFamily: fontFamily);
  static const IconData nightClear = IconData(0xf02e, fontFamily: fontFamily);
  static const IconData nightAltCloudy = IconData(
    0xf086,
    fontFamily: fontFamily,
  );
  static const IconData nightAltCloudyGusts = IconData(
    0xf022,
    fontFamily: fontFamily,
  );
  static const IconData nightAltCloudyWindy = IconData(
    0xf023,
    fontFamily: fontFamily,
  );
  static const IconData nightAltHail = IconData(0xf024, fontFamily: fontFamily);
  static const IconData nightAltLightning = IconData(
    0xf025,
    fontFamily: fontFamily,
  );
  static const IconData nightAltRain = IconData(0xf028, fontFamily: fontFamily);
  static const IconData nightAltRainMix = IconData(
    0xf026,
    fontFamily: fontFamily,
  );
  static const IconData nightAltRainWind = IconData(
    0xf027,
    fontFamily: fontFamily,
  );
  static const IconData nightAltShowers = IconData(
    0xf029,
    fontFamily: fontFamily,
  );
  static const IconData nightAltSleet = IconData(
    0xf0b4,
    fontFamily: fontFamily,
  );
  static const IconData nightAltSleetStorm = IconData(
    0xf06a,
    fontFamily: fontFamily,
  );
  static const IconData nightAltSnow = IconData(0xf02a, fontFamily: fontFamily);
  static const IconData nightAltSnowThunderstorm = IconData(
    0xf06d,
    fontFamily: fontFamily,
  );
  static const IconData nightAltSnowWind = IconData(
    0xf067,
    fontFamily: fontFamily,
  );
  static const IconData nightAltSprinkle = IconData(
    0xf02b,
    fontFamily: fontFamily,
  );
  static const IconData nightAltStormShowers = IconData(
    0xf02c,
    fontFamily: fontFamily,
  );
  static const IconData nightAltThunderstorm = IconData(
    0xf02d,
    fontFamily: fontFamily,
  );
  static const IconData nightCloudy = IconData(0xf031, fontFamily: fontFamily);
  static const IconData nightCloudyGusts = IconData(
    0xf02f,
    fontFamily: fontFamily,
  );
  static const IconData nightCloudyWindy = IconData(
    0xf030,
    fontFamily: fontFamily,
  );
  static const IconData nightFog = IconData(0xf04a, fontFamily: fontFamily);
  static const IconData nightHail = IconData(0xf032, fontFamily: fontFamily);
  static const IconData nightLightning = IconData(
    0xf033,
    fontFamily: fontFamily,
  );
  static const IconData nightPartlyCloudy = IconData(
    0xf083,
    fontFamily: fontFamily,
  );
  static const IconData nightRain = IconData(0xf036, fontFamily: fontFamily);
  static const IconData nightRainMix = IconData(0xf034, fontFamily: fontFamily);
  static const IconData nightRainWind = IconData(
    0xf035,
    fontFamily: fontFamily,
  );
  static const IconData nightShowers = IconData(0xf037, fontFamily: fontFamily);
  static const IconData nightSleet = IconData(0xf0b3, fontFamily: fontFamily);
  static const IconData nightSleetStorm = IconData(
    0xf069,
    fontFamily: fontFamily,
  );
  static const IconData nightSnow = IconData(0xf038, fontFamily: fontFamily);
  static const IconData nightSnowThunderstorm = IconData(
    0xf06c,
    fontFamily: fontFamily,
  );
  static const IconData nightSnowWind = IconData(
    0xf066,
    fontFamily: fontFamily,
  );
  static const IconData nightSprinkle = IconData(
    0xf039,
    fontFamily: fontFamily,
  );
  static const IconData nightStormShowers = IconData(
    0xf03a,
    fontFamily: fontFamily,
  );
  static const IconData nightThunderstorm = IconData(
    0xf03b,
    fontFamily: fontFamily,
  );
  static const IconData lunarEclipse = IconData(0xf070, fontFamily: fontFamily);
  static const IconData stars = IconData(0xf077, fontFamily: fontFamily);
  static const IconData stormShowers = IconData(0xf01d, fontFamily: fontFamily);
  static const IconData thunderstorm = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData nightAltCloudyHigh = IconData(
    0xf07e,
    fontFamily: fontFamily,
  );
  static const IconData nightCloudyHigh = IconData(
    0xf080,
    fontFamily: fontFamily,
  );
  static const IconData nightAltPartlyCloudy = IconData(
    0xf081,
    fontFamily: fontFamily,
  );
  static const IconData cloud = IconData(0xf041, fontFamily: fontFamily);
  static const IconData cloudy = IconData(0xf013, fontFamily: fontFamily);
  static const IconData cloudyGusts = IconData(0xf011, fontFamily: fontFamily);
  static const IconData cloudyWindy = IconData(0xf012, fontFamily: fontFamily);
  static const IconData fog = IconData(0xf014, fontFamily: fontFamily);
  static const IconData hail = IconData(0xf015, fontFamily: fontFamily);
  static const IconData rain = IconData(0xf019, fontFamily: fontFamily);
  static const IconData rainMix = IconData(0xf017, fontFamily: fontFamily);
  static const IconData rainWind = IconData(0xf018, fontFamily: fontFamily);
  static const IconData showers = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData sleet = IconData(0xf0b5, fontFamily: fontFamily);
  static const IconData snow = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData sprinkle = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData snowWind = IconData(0xf064, fontFamily: fontFamily);
  static const IconData smog = IconData(0xf074, fontFamily: fontFamily);
  static const IconData smoke = IconData(0xf062, fontFamily: fontFamily);
  static const IconData lightning = IconData(0xf016, fontFamily: fontFamily);
  static const IconData raindrops = IconData(0xf04e, fontFamily: fontFamily);
  static const IconData raindrop = IconData(0xf078, fontFamily: fontFamily);
  static const IconData dust = IconData(0xf063, fontFamily: fontFamily);
  static const IconData snowflakeCold = IconData(
    0xf076,
    fontFamily: fontFamily,
  );
  static const IconData windy = IconData(0xf021, fontFamily: fontFamily);
  static const IconData strongWind = IconData(0xf050, fontFamily: fontFamily);
  static const IconData sandstorm = IconData(0xf082, fontFamily: fontFamily);
  static const IconData earthquake = IconData(0xf0c6, fontFamily: fontFamily);
  static const IconData fire = IconData(0xf0c7, fontFamily: fontFamily);
  static const IconData flood = IconData(0xf07c, fontFamily: fontFamily);
  static const IconData meteor = IconData(0xf071, fontFamily: fontFamily);
  static const IconData tsunami = IconData(0xf0c5, fontFamily: fontFamily);
  static const IconData volcano = IconData(0xf0c8, fontFamily: fontFamily);
  static const IconData hurricane = IconData(0xf073, fontFamily: fontFamily);
  static const IconData tornado = IconData(0xf056, fontFamily: fontFamily);
  static const IconData smallCraftAdvisory = IconData(
    0xf0cc,
    fontFamily: fontFamily,
  );
  static const IconData galeWarning = IconData(0xf0cd, fontFamily: fontFamily);
  static const IconData stormWarning = IconData(0xf0ce, fontFamily: fontFamily);
  static const IconData hurricaneWarning = IconData(
    0xf0cf,
    fontFamily: fontFamily,
  );
  static const IconData windDirection = IconData(
    0xf0b1,
    fontFamily: fontFamily,
  );
  static const IconData alien = IconData(0xf075, fontFamily: fontFamily);
  static const IconData celsius = IconData(0xf03c, fontFamily: fontFamily);
  static const IconData fahrenheit = IconData(0xf045, fontFamily: fontFamily);
  static const IconData degrees = IconData(0xf042, fontFamily: fontFamily);
  static const IconData thermometer = IconData(0xf055, fontFamily: fontFamily);
  static const IconData thermometerExterior = IconData(
    0xf053,
    fontFamily: fontFamily,
  );
  static const IconData thermometerInternal = IconData(
    0xf054,
    fontFamily: fontFamily,
  );
  static const IconData cloudDown = IconData(0xf03d, fontFamily: fontFamily);
  static const IconData cloudUp = IconData(0xf040, fontFamily: fontFamily);
  static const IconData cloudRefresh = IconData(0xf03e, fontFamily: fontFamily);
  static const IconData horizon = IconData(0xf047, fontFamily: fontFamily);
  static const IconData horizonAlt = IconData(0xf046, fontFamily: fontFamily);
  static const IconData sunrise = IconData(0xf051, fontFamily: fontFamily);
  static const IconData sunset = IconData(0xf052, fontFamily: fontFamily);
  static const IconData moonrise = IconData(0xf0c9, fontFamily: fontFamily);
  static const IconData moonset = IconData(0xf0ca, fontFamily: fontFamily);
  static const IconData refresh = IconData(0xf04c, fontFamily: fontFamily);
  static const IconData refreshAlt = IconData(0xf04b, fontFamily: fontFamily);
  static const IconData umbrella = IconData(0xf084, fontFamily: fontFamily);
  static const IconData barometer = IconData(0xf079, fontFamily: fontFamily);
  static const IconData humidity = IconData(0xf07a, fontFamily: fontFamily);
  static const IconData na = IconData(0xf07b, fontFamily: fontFamily);
  static const IconData train = IconData(0xf0cb, fontFamily: fontFamily);
  static const IconData moonNew = IconData(0xf095, fontFamily: fontFamily);
  static const IconData moonWaxingCrescent1 = IconData(
    0xf096,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingCrescent2 = IconData(
    0xf097,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingCrescent3 = IconData(
    0xf098,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingCrescent4 = IconData(
    0xf099,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingCrescent5 = IconData(
    0xf09a,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingCrescent6 = IconData(
    0xf09b,
    fontFamily: fontFamily,
  );
  static const IconData moonFirstQuarter = IconData(
    0xf09c,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous1 = IconData(
    0xf09d,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous2 = IconData(
    0xf09e,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous3 = IconData(
    0xf09f,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous4 = IconData(
    0xf0a0,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous5 = IconData(
    0xf0a1,
    fontFamily: fontFamily,
  );
  static const IconData moonWaxingGibbous6 = IconData(
    0xf0a2,
    fontFamily: fontFamily,
  );
  static const IconData moonFull = IconData(0xf0a3, fontFamily: fontFamily);
  static const IconData moonWaningGibbous1 = IconData(
    0xf0a4,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningGibbous2 = IconData(
    0xf0a5,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningGibbous3 = IconData(
    0xf0a6,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningGibbous4 = IconData(
    0xf0a7,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningGibbous5 = IconData(
    0xf0a8,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningGibbous6 = IconData(
    0xf0a9,
    fontFamily: fontFamily,
  );
  static const IconData moonThirdQuarter = IconData(
    0xf0aa,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent1 = IconData(
    0xf0ab,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent2 = IconData(
    0xf0ac,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent3 = IconData(
    0xf0ad,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent4 = IconData(
    0xf0ae,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent5 = IconData(
    0xf0af,
    fontFamily: fontFamily,
  );
  static const IconData moonWaningCrescent6 = IconData(
    0xf0b0,
    fontFamily: fontFamily,
  );
  static const IconData moonAltNew = IconData(0xf0eb, fontFamily: fontFamily);
  static const IconData moonAltWaxingCrescent1 = IconData(
    0xf0d0,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingCrescent2 = IconData(
    0xf0d1,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingCrescent3 = IconData(
    0xf0d2,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingCrescent4 = IconData(
    0xf0d3,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingCrescent5 = IconData(
    0xf0d4,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingCrescent6 = IconData(
    0xf0d5,
    fontFamily: fontFamily,
  );
  static const IconData moonAltFirstQuarter = IconData(
    0xf0d6,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous1 = IconData(
    0xf0d7,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous2 = IconData(
    0xf0d8,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous3 = IconData(
    0xf0d9,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous4 = IconData(
    0xf0da,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous5 = IconData(
    0xf0db,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaxingGibbous6 = IconData(
    0xf0dc,
    fontFamily: fontFamily,
  );
  static const IconData moonAltFull = IconData(0xf0dd, fontFamily: fontFamily);
  static const IconData moonAltWaningGibbous1 = IconData(
    0xf0de,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningGibbous2 = IconData(
    0xf0df,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningGibbous3 = IconData(
    0xf0e0,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningGibbous4 = IconData(
    0xf0e1,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningGibbous5 = IconData(
    0xf0e2,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningGibbous6 = IconData(
    0xf0e3,
    fontFamily: fontFamily,
  );
  static const IconData moonAltThirdQuarter = IconData(
    0xf0e4,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent1 = IconData(
    0xf0e5,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent2 = IconData(
    0xf0e6,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent3 = IconData(
    0xf0e7,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent4 = IconData(
    0xf0e8,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent5 = IconData(
    0xf0e9,
    fontFamily: fontFamily,
  );
  static const IconData moonAltWaningCrescent6 = IconData(
    0xf0ea,
    fontFamily: fontFamily,
  );
  static const IconData moon0 = IconData(0xf095, fontFamily: fontFamily);
  static const IconData moon1 = IconData(0xf096, fontFamily: fontFamily);
  static const IconData moon2 = IconData(0xf097, fontFamily: fontFamily);
  static const IconData moon3 = IconData(0xf098, fontFamily: fontFamily);
  static const IconData moon4 = IconData(0xf099, fontFamily: fontFamily);
  static const IconData moon5 = IconData(0xf09a, fontFamily: fontFamily);
  static const IconData moon6 = IconData(0xf09b, fontFamily: fontFamily);
  static const IconData moon7 = IconData(0xf09c, fontFamily: fontFamily);
  static const IconData moon8 = IconData(0xf09d, fontFamily: fontFamily);
  static const IconData moon9 = IconData(0xf09e, fontFamily: fontFamily);
  static const IconData moon10 = IconData(0xf09f, fontFamily: fontFamily);
  static const IconData moon11 = IconData(0xf0a0, fontFamily: fontFamily);
  static const IconData moon12 = IconData(0xf0a1, fontFamily: fontFamily);
  static const IconData moon13 = IconData(0xf0a2, fontFamily: fontFamily);
  static const IconData moon14 = IconData(0xf0a3, fontFamily: fontFamily);
  static const IconData moon15 = IconData(0xf0a4, fontFamily: fontFamily);
  static const IconData moon16 = IconData(0xf0a5, fontFamily: fontFamily);
  static const IconData moon17 = IconData(0xf0a6, fontFamily: fontFamily);
  static const IconData moon18 = IconData(0xf0a7, fontFamily: fontFamily);
  static const IconData moon19 = IconData(0xf0a8, fontFamily: fontFamily);
  static const IconData moon20 = IconData(0xf0a9, fontFamily: fontFamily);
  static const IconData moon21 = IconData(0xf0aa, fontFamily: fontFamily);
  static const IconData moon22 = IconData(0xf0ab, fontFamily: fontFamily);
  static const IconData moon23 = IconData(0xf0ac, fontFamily: fontFamily);
  static const IconData moon24 = IconData(0xf0ad, fontFamily: fontFamily);
  static const IconData moon25 = IconData(0xf0ae, fontFamily: fontFamily);
  static const IconData moon26 = IconData(0xf0af, fontFamily: fontFamily);
  static const IconData moon27 = IconData(0xf0b0, fontFamily: fontFamily);
  static const IconData time1 = IconData(0xf08a, fontFamily: fontFamily);
  static const IconData time2 = IconData(0xf08b, fontFamily: fontFamily);
  static const IconData time3 = IconData(0xf08c, fontFamily: fontFamily);
  static const IconData time4 = IconData(0xf08d, fontFamily: fontFamily);
  static const IconData time5 = IconData(0xf08e, fontFamily: fontFamily);
  static const IconData time6 = IconData(0xf08f, fontFamily: fontFamily);
  static const IconData time7 = IconData(0xf090, fontFamily: fontFamily);
  static const IconData time8 = IconData(0xf091, fontFamily: fontFamily);
  static const IconData time9 = IconData(0xf092, fontFamily: fontFamily);
  static const IconData time10 = IconData(0xf093, fontFamily: fontFamily);
  static const IconData time11 = IconData(0xf094, fontFamily: fontFamily);
  static const IconData time12 = IconData(0xf089, fontFamily: fontFamily);
  static const IconData directionUp = IconData(0xf058, fontFamily: fontFamily);
  static const IconData directionUpRight = IconData(
    0xf057,
    fontFamily: fontFamily,
  );
  static const IconData directionRight = IconData(
    0xf04d,
    fontFamily: fontFamily,
  );
  static const IconData directionDownRight = IconData(
    0xf088,
    fontFamily: fontFamily,
  );
  static const IconData directionDown = IconData(
    0xf044,
    fontFamily: fontFamily,
  );
  static const IconData directionDownLeft = IconData(
    0xf043,
    fontFamily: fontFamily,
  );
  static const IconData directionLeft = IconData(
    0xf048,
    fontFamily: fontFamily,
  );
  static const IconData directionUpLeft = IconData(
    0xf087,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort0 = IconData(
    0xf0b7,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort1 = IconData(
    0xf0b8,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort2 = IconData(
    0xf0b9,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort3 = IconData(
    0xf0ba,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort4 = IconData(
    0xf0bb,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort5 = IconData(
    0xf0bc,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort6 = IconData(
    0xf0bd,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort7 = IconData(
    0xf0be,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort8 = IconData(
    0xf0bf,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort9 = IconData(
    0xf0c0,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort10 = IconData(
    0xf0c1,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort11 = IconData(
    0xf0c2,
    fontFamily: fontFamily,
  );
  static const IconData windBeaufort12 = IconData(
    0xf0c3,
    fontFamily: fontFamily,
  );
  static const IconData yahoo0 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData yahoo1 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo2 = IconData(0xf073, fontFamily: fontFamily);
  static const IconData yahoo3 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData yahoo4 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData yahoo5 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData yahoo6 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData yahoo7 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData yahoo8 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData yahoo9 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData yahoo10 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData yahoo11 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData yahoo12 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData yahoo13 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData yahoo14 = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData yahoo15 = IconData(0xf064, fontFamily: fontFamily);
  static const IconData yahoo16 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData yahoo17 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData yahoo18 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData yahoo19 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData yahoo20 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData yahoo21 = IconData(0xf021, fontFamily: fontFamily);
  static const IconData yahoo22 = IconData(0xf062, fontFamily: fontFamily);
  static const IconData yahoo23 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData yahoo24 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData yahoo25 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData yahoo26 = IconData(0xf013, fontFamily: fontFamily);
  static const IconData yahoo27 = IconData(0xf031, fontFamily: fontFamily);
  static const IconData yahoo28 = IconData(0xf002, fontFamily: fontFamily);
  static const IconData yahoo29 = IconData(0xf031, fontFamily: fontFamily);
  static const IconData yahoo30 = IconData(0xf002, fontFamily: fontFamily);
  static const IconData yahoo31 = IconData(0xf02e, fontFamily: fontFamily);
  static const IconData yahoo32 = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData yahoo33 = IconData(0xf083, fontFamily: fontFamily);
  static const IconData yahoo34 = IconData(0xf00c, fontFamily: fontFamily);
  static const IconData yahoo35 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData yahoo36 = IconData(0xf072, fontFamily: fontFamily);
  static const IconData yahoo37 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo38 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo39 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo40 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData yahoo41 = IconData(0xf064, fontFamily: fontFamily);
  static const IconData yahoo42 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData yahoo43 = IconData(0xf064, fontFamily: fontFamily);
  static const IconData yahoo44 = IconData(0xf00c, fontFamily: fontFamily);
  static const IconData yahoo45 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo46 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData yahoo47 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData yahoo3200 = IconData(0xf077, fontFamily: fontFamily);
  static const IconData forecastIoClearDay = IconData(
    0xf00d,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoClearNight = IconData(
    0xf02e,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoRain = IconData(
    0xf019,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoSnow = IconData(
    0xf01b,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoSleet = IconData(
    0xf0b5,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoWind = IconData(
    0xf050,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoFog = IconData(
    0xf014,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoCloudy = IconData(
    0xf013,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoPartlyCloudyDay = IconData(
    0xf002,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoPartlyCloudyNight = IconData(
    0xf031,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoHail = IconData(
    0xf015,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoThunderstorm = IconData(
    0xf01e,
    fontFamily: fontFamily,
  );
  static const IconData forecastIoTornado = IconData(
    0xf056,
    fontFamily: fontFamily,
  );
  static const IconData wmo468000 = IconData(0xf055, fontFamily: fontFamily);
  static const IconData wmo468001 = IconData(0xf013, fontFamily: fontFamily);
  static const IconData wmo468002 = IconData(0xf055, fontFamily: fontFamily);
  static const IconData wmo468003 = IconData(0xf013, fontFamily: fontFamily);
  static const IconData wmo468004 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468005 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468010 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468011 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468012 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData wmo468018 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData wmo468020 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468021 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468022 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468023 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468024 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468025 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468026 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wmo468027 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData wmo468028 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData wmo468029 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData wmo468030 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468031 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468032 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468033 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468034 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468035 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData wmo468040 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468041 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468042 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468043 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468044 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468045 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468046 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468047 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468048 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468050 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468051 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468052 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468053 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468054 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468055 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468056 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468057 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468058 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468060 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468061 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468062 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468063 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468064 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468065 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468066 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468067 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468068 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468070 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468071 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468072 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468073 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468074 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468075 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468076 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468077 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wmo468078 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData wmo468080 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468081 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData wmo468082 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468083 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wmo468084 = IconData(0xf01d, fontFamily: fontFamily);
  static const IconData wmo468085 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468086 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468087 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData wmo468089 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData wmo468090 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData wmo468091 = IconData(0xf01d, fontFamily: fontFamily);
  static const IconData wmo468092 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wmo468093 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wmo468094 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData wmo468095 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wmo468096 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wmo468099 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owm200 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm201 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm202 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm210 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData owm211 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData owm212 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData owm221 = IconData(0xf016, fontFamily: fontFamily);
  static const IconData owm230 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm231 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm232 = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData owm300 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData owm301 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData owm302 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm310 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm311 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm312 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm313 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData owm314 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm321 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData owm500 = IconData(0xf01c, fontFamily: fontFamily);
  static const IconData owm501 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm502 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm503 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm504 = IconData(0xf019, fontFamily: fontFamily);
  static const IconData owm511 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm520 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData owm521 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData owm522 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData owm531 = IconData(0xf01d, fontFamily: fontFamily);
  static const IconData owm600 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData owm601 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData owm602 = IconData(0xf0b5, fontFamily: fontFamily);
  static const IconData owm611 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm612 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm615 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm616 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm620 = IconData(0xf017, fontFamily: fontFamily);
  static const IconData owm621 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData owm622 = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData owm701 = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData owm711 = IconData(0xf062, fontFamily: fontFamily);
  static const IconData owm721 = IconData(0xf0b6, fontFamily: fontFamily);
  static const IconData owm731 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owm741 = IconData(0xf014, fontFamily: fontFamily);
  static const IconData owm761 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owm762 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owm771 = IconData(0xf011, fontFamily: fontFamily);
  static const IconData owm781 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owm800 = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData owm801 = IconData(0xf011, fontFamily: fontFamily);
  static const IconData owm802 = IconData(0xf011, fontFamily: fontFamily);
  static const IconData owm803 = IconData(0xf012, fontFamily: fontFamily);
  static const IconData owm804 = IconData(0xf013, fontFamily: fontFamily);
  static const IconData owm900 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owm901 = IconData(0xf01d, fontFamily: fontFamily);
  static const IconData owm902 = IconData(0xf073, fontFamily: fontFamily);
  static const IconData owm903 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData owm904 = IconData(0xf072, fontFamily: fontFamily);
  static const IconData owm905 = IconData(0xf021, fontFamily: fontFamily);
  static const IconData owm906 = IconData(0xf015, fontFamily: fontFamily);
  static const IconData owm957 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData owmDay200 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay201 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay202 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay210 = IconData(0xf005, fontFamily: fontFamily);
  static const IconData owmDay211 = IconData(0xf005, fontFamily: fontFamily);
  static const IconData owmDay212 = IconData(0xf005, fontFamily: fontFamily);
  static const IconData owmDay221 = IconData(0xf005, fontFamily: fontFamily);
  static const IconData owmDay230 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay231 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay232 = IconData(0xf010, fontFamily: fontFamily);
  static const IconData owmDay300 = IconData(0xf00b, fontFamily: fontFamily);
  static const IconData owmDay301 = IconData(0xf00b, fontFamily: fontFamily);
  static const IconData owmDay302 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay310 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay311 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay312 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay313 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay314 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay321 = IconData(0xf00b, fontFamily: fontFamily);
  static const IconData owmDay500 = IconData(0xf00b, fontFamily: fontFamily);
  static const IconData owmDay501 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay502 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay503 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay504 = IconData(0xf008, fontFamily: fontFamily);
  static const IconData owmDay511 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay520 = IconData(0xf009, fontFamily: fontFamily);
  static const IconData owmDay521 = IconData(0xf009, fontFamily: fontFamily);
  static const IconData owmDay522 = IconData(0xf009, fontFamily: fontFamily);
  static const IconData owmDay531 = IconData(0xf00e, fontFamily: fontFamily);
  static const IconData owmDay600 = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData owmDay601 = IconData(0xf0b2, fontFamily: fontFamily);
  static const IconData owmDay602 = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData owmDay611 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay612 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay615 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay616 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay620 = IconData(0xf006, fontFamily: fontFamily);
  static const IconData owmDay621 = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData owmDay622 = IconData(0xf00a, fontFamily: fontFamily);
  static const IconData owmDay701 = IconData(0xf009, fontFamily: fontFamily);
  static const IconData owmDay711 = IconData(0xf062, fontFamily: fontFamily);
  static const IconData owmDay721 = IconData(0xf0b6, fontFamily: fontFamily);
  static const IconData owmDay731 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmDay741 = IconData(0xf003, fontFamily: fontFamily);
  static const IconData owmDay761 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmDay762 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmDay781 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owmDay800 = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData owmDay801 = IconData(0xf000, fontFamily: fontFamily);
  static const IconData owmDay802 = IconData(0xf000, fontFamily: fontFamily);
  static const IconData owmDay803 = IconData(0xf000, fontFamily: fontFamily);
  static const IconData owmDay804 = IconData(0xf00c, fontFamily: fontFamily);
  static const IconData owmDay900 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owmDay902 = IconData(0xf073, fontFamily: fontFamily);
  static const IconData owmDay903 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData owmDay904 = IconData(0xf072, fontFamily: fontFamily);
  static const IconData owmDay906 = IconData(0xf004, fontFamily: fontFamily);
  static const IconData owmDay957 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData owmNight200 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight201 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight202 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight210 = IconData(0xf025, fontFamily: fontFamily);
  static const IconData owmNight211 = IconData(0xf025, fontFamily: fontFamily);
  static const IconData owmNight212 = IconData(0xf025, fontFamily: fontFamily);
  static const IconData owmNight221 = IconData(0xf025, fontFamily: fontFamily);
  static const IconData owmNight230 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight231 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight232 = IconData(0xf02d, fontFamily: fontFamily);
  static const IconData owmNight300 = IconData(0xf02b, fontFamily: fontFamily);
  static const IconData owmNight301 = IconData(0xf02b, fontFamily: fontFamily);
  static const IconData owmNight302 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight310 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight311 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight312 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight313 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight314 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight321 = IconData(0xf02b, fontFamily: fontFamily);
  static const IconData owmNight500 = IconData(0xf02b, fontFamily: fontFamily);
  static const IconData owmNight501 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight502 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight503 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight504 = IconData(0xf028, fontFamily: fontFamily);
  static const IconData owmNight511 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight520 = IconData(0xf029, fontFamily: fontFamily);
  static const IconData owmNight521 = IconData(0xf029, fontFamily: fontFamily);
  static const IconData owmNight522 = IconData(0xf029, fontFamily: fontFamily);
  static const IconData owmNight531 = IconData(0xf02c, fontFamily: fontFamily);
  static const IconData owmNight600 = IconData(0xf02a, fontFamily: fontFamily);
  static const IconData owmNight601 = IconData(0xf0b4, fontFamily: fontFamily);
  static const IconData owmNight602 = IconData(0xf02a, fontFamily: fontFamily);
  static const IconData owmNight611 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight612 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight615 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight616 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight620 = IconData(0xf026, fontFamily: fontFamily);
  static const IconData owmNight621 = IconData(0xf02a, fontFamily: fontFamily);
  static const IconData owmNight622 = IconData(0xf02a, fontFamily: fontFamily);
  static const IconData owmNight701 = IconData(0xf029, fontFamily: fontFamily);
  static const IconData owmNight711 = IconData(0xf062, fontFamily: fontFamily);
  static const IconData owmNight721 = IconData(0xf0b6, fontFamily: fontFamily);
  static const IconData owmNight731 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmNight741 = IconData(0xf04a, fontFamily: fontFamily);
  static const IconData owmNight761 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmNight762 = IconData(0xf063, fontFamily: fontFamily);
  static const IconData owmNight781 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owmNight800 = IconData(0xf02e, fontFamily: fontFamily);
  static const IconData owmNight801 = IconData(0xf022, fontFamily: fontFamily);
  static const IconData owmNight802 = IconData(0xf022, fontFamily: fontFamily);
  static const IconData owmNight803 = IconData(0xf022, fontFamily: fontFamily);
  static const IconData owmNight804 = IconData(0xf086, fontFamily: fontFamily);
  static const IconData owmNight900 = IconData(0xf056, fontFamily: fontFamily);
  static const IconData owmNight902 = IconData(0xf073, fontFamily: fontFamily);
  static const IconData owmNight903 = IconData(0xf076, fontFamily: fontFamily);
  static const IconData owmNight904 = IconData(0xf072, fontFamily: fontFamily);
  static const IconData owmNight906 = IconData(0xf024, fontFamily: fontFamily);
  static const IconData owmNight957 = IconData(0xf050, fontFamily: fontFamily);
  static const IconData wuChanceflurries = IconData(
    0xf064,
    fontFamily: fontFamily,
  );
  static const IconData wuChancerain = IconData(0xf019, fontFamily: fontFamily);
  static const IconData wuChancesleat = IconData(
    0xf0b5,
    fontFamily: fontFamily,
  );
  static const IconData wuChancesnow = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wuChancetstorms = IconData(
    0xf01e,
    fontFamily: fontFamily,
  );
  static const IconData wuClear = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData wuCloudy = IconData(0xf002, fontFamily: fontFamily);
  static const IconData wuFlurries = IconData(0xf064, fontFamily: fontFamily);
  static const IconData wuHazy = IconData(0xf0b6, fontFamily: fontFamily);
  static const IconData wuMostlycloudy = IconData(
    0xf002,
    fontFamily: fontFamily,
  );
  static const IconData wuMostlysunny = IconData(
    0xf00d,
    fontFamily: fontFamily,
  );
  static const IconData wuPartlycloudy = IconData(
    0xf002,
    fontFamily: fontFamily,
  );
  static const IconData wuPartlysunny = IconData(
    0xf00d,
    fontFamily: fontFamily,
  );
  static const IconData wuRain = IconData(0xf01a, fontFamily: fontFamily);
  static const IconData wuSleat = IconData(0xf0b5, fontFamily: fontFamily);
  static const IconData wuSnow = IconData(0xf01b, fontFamily: fontFamily);
  static const IconData wuSunny = IconData(0xf00d, fontFamily: fontFamily);
  static const IconData wuTstorms = IconData(0xf01e, fontFamily: fontFamily);
  static const IconData wuUnknown = IconData(0xf00d, fontFamily: fontFamily);
}
