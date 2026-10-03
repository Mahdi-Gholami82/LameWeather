import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_selection_state.dart';

sealed class LocationEvent {}

class GetLocationSelectionEvent extends LocationEvent {
  GetLocationSelectionEvent();
}

class SetLocationEvent extends LocationEvent {
  SetLocationEvent(this.locationPoint);
  Point locationPoint;
}

class LocationBloc extends Bloc<LocationEvent, LocationSelectionState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;
  LocationBloc(this.getCurrentLocationUseCase)
    : super(LocationSelectionInitial()) {
    on<GetLocationSelectionEvent>((event, emit) async {
      try {
        emit(LocationSelectionLoading());
        var result = await getCurrentLocationUseCase.execute();
        emit(LocationSelectionLoaded(result));
      } on Exception catch (e) {
        emit(LocationPointError(e.toString()));
      }
    });
    on<SetLocationEvent>((event, emit) {
      emit(LocationSelectionLoaded(event.locationPoint));
    });
  }
}
