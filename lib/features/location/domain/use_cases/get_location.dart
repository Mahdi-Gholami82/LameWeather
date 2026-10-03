import 'package:lame_weather/features/location/data/repositories/location_repository.dart';
import 'package:lame_weather/core/domain/entities/location.dart';

class GetCurrentLocationUseCase {
  final LocationRepository repository;

  GetCurrentLocationUseCase(this.repository);

  Future<Point> execute() {
    return repository.getCurrentLocation();
  }
}
