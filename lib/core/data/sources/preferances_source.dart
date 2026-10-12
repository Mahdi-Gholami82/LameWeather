import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PreferencesDataSource {
  List<String> getLocations();
  Future<bool> saveLocations(List<String> locations);
  String? getThemeMode();
  Future<void> saveTheme(String newTheme);
}

class PreferencesDataSourceImplImpl extends PreferencesDataSource {
  final SharedPreferences prefs;

  PreferencesDataSourceImplImpl(this.prefs);

  @override
  List<String> getLocations() {
    return prefs.getStringList("locations") ?? [];
  }

  @override
  Future<bool> saveLocations(List<String> locations) {
    return prefs.setStringList("locations", locations);
  }

  @override
  String? getThemeMode() => prefs.getString("themeMode");
  @override
  Future<void> saveTheme(String newTheme) =>
      prefs.setString("themeMode", newTheme);
}
