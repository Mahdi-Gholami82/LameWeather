import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_state.dart';
import 'package:stream_transform/stream_transform.dart';

sealed class LocationEvent {}

class GetLocationPointEvent extends LocationEvent {
  GetLocationPointEvent();
}

class SetLocationEvent extends LocationEvent {
  SetLocationEvent(this.locationPoint);
  Point locationPoint;
}

class LocationBloc extends Bloc<LocationEvent, LocationPointState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;
  LocationBloc(this.getCurrentLocationUseCase) : super(LocationPointInitial()) {
    on<GetLocationPointEvent>(
      (event, emit) async {
        try {
          emit(LocationPointLoading());
          var result = await getCurrentLocationUseCase.execute();
          emit(LocationPointLoaded(result));
        } on Exception catch (e) {
          emit(LocationPointError(e.toString()));
        }
      },
      transformer: (events, mapper) =>
          events.debounce(const Duration(milliseconds: 300)).switchMap(mapper),
    );
    on<SetLocationEvent>((event, emit) {
      emit(LocationPointLoaded(event.locationPoint));
    });
  }
}
