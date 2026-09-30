import 'package:lame_weather/features/home/data/repositories/weather_repository.dart';

class GetLocationSuggestions {
  WeatherRepository repository;
  GetLocationSuggestions({required this.repository});
  Future<List<String>> execute({required String search}) {
    return repository.getLoctionSuggestions(search: search);
  }
}
