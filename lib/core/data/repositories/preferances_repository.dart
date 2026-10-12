import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lame_weather/core/data/sources/preferances_source.dart';
import 'package:lame_weather/core/domain/entities/location.dart';

abstract class PreferencesRepository {
  List<Location> getSavedLocations();
  Future<void> saveLocations(List<Location> locations);

  ThemeMode getThemeMode();
  Future<void> saveThemeMode(ThemeMode themeMode);
}

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesDataSourceImplImpl dataSource;

  PreferencesRepositoryImpl(this.dataSource);

  @override
  List<Location> getSavedLocations() {
    return dataSource.getLocations().map((e) {
      final json = jsonDecode(e);
      return Location(
        name: json["name"],
        point: Point(latitude: json["lat"], longitude: json["lon"]),
      );
    }).toList();
  }

  @override
  Future<void> saveLocations(List<Location> locations) async {
    await dataSource.saveLocations(
      locations
          .map(
            (e) => jsonEncode({
              "name": e.name,
              "lat": e.point.latitude,
              "lon": e.point.longitude,
            }),
          )
          .toList(),
    );
  }

  @override
  ThemeMode getThemeMode() {
    String? modeString = dataSource.getThemeMode();
    return ThemeMode.values.firstWhere(
      (e) => modeString == e.name,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) =>
      dataSource.saveTheme(themeMode.name);
}
