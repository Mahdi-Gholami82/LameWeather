import 'package:lame_weather/core/utils/raw_string_equal.dart';

class Point {
  final double latitude;
  final double longitude;

  const Point({required this.latitude, required this.longitude});

  @override
  bool operator ==(Object other) {
    if (other case Point otherPoint) {
      return latitude == otherPoint.latitude &&
          longitude == otherPoint.longitude;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude);
}

class Location {
  Location({required this.name, required this.point});
  Point point;
  String name;

  @override
  bool operator ==(Object other) {
    if (other case Location otherLocation) {
      return name.isRawEqual(otherLocation.name) ||
          point == otherLocation.point;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(name, point);

  @override
  String toString() => name;
}
