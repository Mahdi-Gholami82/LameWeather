import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDataSource {
  final SharedPreferences prefs;

  PreferencesDataSource(this.prefs);

  List<String> getLocations() {
    return prefs.getStringList("locations") ?? [];
  }

  Future<bool> saveLocations(List<String> locations) {
    return prefs.setStringList("locations", locations);
  }
}
