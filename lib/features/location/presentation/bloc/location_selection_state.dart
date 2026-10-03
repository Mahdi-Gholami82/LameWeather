import 'package:lame_weather/core/domain/entities/location.dart';

abstract class LocationSelectionState {}

class LocationSelectionInitial extends LocationSelectionState {}

class LocationSelectionLoading extends LocationSelectionState {}

class LocationSelectionLoaded extends LocationSelectionState {
  final Point locationPoint;
  LocationSelectionLoaded(this.locationPoint);
}

class LocationPointError extends LocationSelectionState {
  final String message;
  LocationPointError(this.message);
}
