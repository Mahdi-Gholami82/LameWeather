import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:lame_weather/features/home/data/models/overall_weather.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather({required String location});
  Future<List<String>> getLoctionSuggestions({required String search});
}

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl()
    : _apiKey =
          dotenv.env["WEATHER_API_KEY"] ??
          (throw Exception("WEATHER_API_KEY is not configured"));

  final client = Client();
  final String host = "api.weatherapi.com";
  final String version = "v1";
  final String _apiKey;

  Uri _fromPath(String path) => Uri.https(host, "/$version$path");

  @override
  Future<WeatherModel> getWeather({required String location}) async {
    final response = await client.get(
      _fromPath(
        "/forecast.json?key=$_apiKey&q=$location&days=4&aqi=no&alerts=no",
      ),
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200 && json is Map<String, dynamic>) {
      return WeatherModel.fromJson(json);
    } else {
      throw Exception(
        "Failed to load users: \nStatus: ${response.statusCode} Body: ${response.body}",
      );
    }
  }

  @override
  Future<List<String>> getLoctionSuggestions({required String search}) async {
    final response = await client.get(
      _fromPath("/search.json?key=$_apiKey&q=$search"),
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (json case List<Map<String, dynamic>> loctions) {
        return loctions.map((e) => e["name"] as String).toList();
      }
    }
    throw Exception(
      "Failed to load users: \nStatus: ${response.statusCode} Body: ${response.body}",
    );
  }
}
