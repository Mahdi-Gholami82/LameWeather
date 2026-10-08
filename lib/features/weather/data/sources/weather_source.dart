import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:lame_weather/core/api/api_config.dart';
import 'package:lame_weather/core/data/models/location.dart';
import 'package:lame_weather/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather({required String location});
  Future<List<LocationModel>> getLocationSuggestions({required String search});
  Future<WeatherModel> getWeatherFromPoint({
    required double latitude,
    required double longitude,
  });
}

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl(this.client);

  final Client client;
  final apiConfig = GetIt.instance<WeatherApiConfig>();

  Future<WeatherModel> _getForecast({required String query}) async {
    final response = await client.get(
      apiConfig.uri(
        "/forecast.json",
        queryParameters: {
          "key": apiConfig.key,
          "q": query,
          "days": "4",
          "aqi": "no",
          "alerts": "no",
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception(
        "Failed to load weather: \nStatus: ${response.statusCode} Body: ${response.body}",
      );
    }

    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }

  @override
  Future<WeatherModel> getWeather({required String location}) =>
      _getForecast(query: location);

  @override
  Future<WeatherModel> getWeatherFromPoint({
    required double latitude,
    required double longitude,
  }) => _getForecast(query: "$latitude,$longitude");

  @override
  Future<List<LocationModel>> getLocationSuggestions({
    required String search,
  }) async {
    final response = await client.get(
      apiConfig.uri(
        "/search.json",
        queryParameters: {"key": apiConfig.key, "q": search},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception(
        "Failed to load weather: \nStatus: ${response.statusCode} Body: ${response.body}",
      );
    }
    final json = jsonDecode(response.body) as List<dynamic>;
    return json.map((e) => LocationModel.fromJson(e)).toList();
  }
}
