import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_weather.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_state.dart';

sealed class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  GetWeatherEvent({required this.location});
  String location;
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      try {
        emit(WeatherLoading());
        var result = await getWeatherUseCase.execute(location: event.location);
        emit(WeatherLoaded(result));
      } on Exception catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
