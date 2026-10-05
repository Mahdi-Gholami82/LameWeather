import 'package:lame_weather/features/weather/data/repositories/weather_repository.dart';
import 'package:lame_weather/core/domain/entities/location.dart';

class GetLocationSuggestionsUseCase {
  WeatherRepository repository;
  GetLocationSuggestionsUseCase({required this.repository});
  Future<List<Location>> execute({required String query}) {
    return repository.getLoctionSuggestions(search: query);
  }
}
