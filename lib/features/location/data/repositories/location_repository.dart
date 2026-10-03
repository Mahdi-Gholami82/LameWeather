import 'package:lame_weather/features/location/data/sources/location_data_source.dart';
import 'package:lame_weather/core/domain/entities/location.dart';

abstract interface class LocationRepository {
  Future<Point> getCurrentLocation();
}

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<Point> getCurrentLocation() async {
    final position = await dataSource.getCurrentPosition();

    return Point(latitude: position.latitude, longitude: position.longitude);
  }
}
