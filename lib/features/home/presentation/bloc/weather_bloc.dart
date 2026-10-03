import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_weather.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_state.dart';

sealed class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  GetWeatherEvent({required this.location});
  Location location;
}

class GetWeatherFromPointEvent extends WeatherEvent {
  GetWeatherFromPointEvent({required this.location});
  Location location;
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetWeatherFromPointUseCase getWeatherFromPointUseCase;
  WeatherBloc({
    required this.getWeatherUseCase,
    required this.getWeatherFromPointUseCase,
  }) : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      try {
        emit(WeatherLoading(location: event.location));
        var result = await getWeatherUseCase.execute(
          locationName: event.location.name,
        );
        emit(WeatherLoaded(result));
      } on Exception catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    on<GetWeatherFromPointEvent>((event, emit) async {
      try {
        emit(WeatherLoading(location: event.location));
        var result = await getWeatherFromPointUseCase.execute(
          locationPoint: event.location.point,
        );
        emit(WeatherLoaded(result));
      } on Exception catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
