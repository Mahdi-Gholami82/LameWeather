import 'package:lame_weather/features/home/data/repositories/weather_repository.dart';

class GetLocationSuggestionsUseCase {
  WeatherRepository repository;
  GetLocationSuggestionsUseCase({required this.repository});
  Future<List<String>> execute({required String query}) {
    return repository.getLoctionSuggestions(search: query);
  }
}
