import 'package:geolocator/geolocator.dart';
import 'package:lame_weather/features/location/data/exceptions/location_exceptions.dart';

abstract interface class LocationDataSource {
  Future<Position> getCurrentLocation();
}

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<Position> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw LocationServiceDisabledException();
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionPermanentlyDeniedException();
    }

    return Geolocator.getCurrentPosition();
  }
}
