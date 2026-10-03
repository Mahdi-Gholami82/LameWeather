import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:lame_weather/core/data/models/location.dart';
import 'package:lame_weather/features/home/data/models/overall_weather.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather({required String location});
  Future<List<LocationModel>> getLocationSuggestions({required String search});
  Future<WeatherModel> getWeatherFromPoint({
    required double latitude,
    required double longitude,
  });
}

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl(this.client)
    : _apiKey =
          dotenv.env["WEATHER_API_KEY"] ??
          (throw Exception("WEATHER_API_KEY is not configured"));

  final Client client;
  final String host = "api.weatherapi.com";
  final String version = "v1";
  final String _apiKey;

  Uri _fromPath(String path, {Map<String, String>? queryParameters}) {
    return Uri.https(host, "/$version$path", queryParameters);
  }

  Future<WeatherModel> _getForecast({required String query}) async {
    final response = await client.get(
      _fromPath(
        "/forecast.json",
        queryParameters: {
          "key": _apiKey,
          "q": query,
          "days": "4",
          "aqi": "no",
          "alerts": "no",
        },
      ),
    );

    final json = jsonDecode(response.body);

    if (response.statusCode == 200 && json is Map<String, dynamic>) {
      return WeatherModel.fromJson(json);
    }

    throw Exception(
      "Failed to load weather:"
      "\nStatus: ${response.statusCode}"
      "\nBody: ${response.body}",
    );
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
      _fromPath("/search.json", queryParameters: {"key": _apiKey, "q": search}),
    );
    final json = jsonDecode(response.body) as List<dynamic>;
    if (response.statusCode == 200) {
      return json.map((e) => LocationModel.fromJson(e)).toList();
    }
    throw Exception(
      "Failed to load weather: \nStatus: ${response.statusCode} Body: ${response.body}",
    );
  }
}
