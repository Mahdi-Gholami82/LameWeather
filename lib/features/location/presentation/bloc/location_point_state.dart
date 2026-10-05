import 'package:lame_weather/core/domain/entities/location.dart';

abstract class LocationPointState {}

class LocationPointInitial extends LocationPointState {}

class LocationPointLoading extends LocationPointState {}

class LocationPointLoaded extends LocationPointState {
  final Point point;
  LocationPointLoaded(this.point);
}

class LocationPointError extends LocationPointState {
  final String message;
  LocationPointError(this.message);
}
