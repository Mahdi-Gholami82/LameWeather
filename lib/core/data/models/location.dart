import 'package:lame_weather/core/domain/entities/location.dart';

class LocationModel {
  LocationModel({required this.name, required this.lat, required this.lon});
  String name;
  double lat;
  double lon;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      LocationModel(name: json["name"], lat: json["lat"], lon: json["lon"]);

  Location toEntity() => Location(
    name: name,
    point: Point(latitude: lat, longitude: lon),
  );
}
