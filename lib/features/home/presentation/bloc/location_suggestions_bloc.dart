import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/features/home/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/home/presentation/bloc/location_suggestions_state.dart';
import 'package:stream_transform/stream_transform.dart';

sealed class LocationSuggestionsEvent {}

class GetLocationSuggestions extends LocationSuggestionsEvent {
  GetLocationSuggestions({required this.query});
  String query;
}

class LocationSuggestionsBloc
    extends Bloc<LocationSuggestionsEvent, LocationSuggestionsState> {
  final GetLocationSuggestionsUseCase getLocationSuggestionsUseCase;
  LocationSuggestionsBloc(this.getLocationSuggestionsUseCase)
    : super(LocationSuggestionsInitial()) {
    on<GetLocationSuggestions>(
      (event, emit) async {
        try {
          emit(LocationSuggestionsLoading());
          var result = await getLocationSuggestionsUseCase.execute(
            query: event.query,
          );
          emit(LocationSuggestionsLoaded(result));
        } on Exception catch (e) {
          emit(LocationSuggestionsError(e.toString()));
        }
      },
      transformer: (events, mapper) =>
          events.debounce(const Duration(milliseconds: 300)),
    );
  }
}
