class WeatherApiConfig {
  WeatherApiConfig({
    required this.host,
    required this.version,
    required this.key,
  });
  final String host;
  final String version;
  final String key;

  Uri uri(String path, {Map<String, String>? queryParameters}) =>
      Uri.https(host, "/$version$path", queryParameters);
}
