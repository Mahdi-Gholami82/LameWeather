import 'package:geolocator/geolocator.dart';

class LocationDataSource {
  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition();
  }
}
