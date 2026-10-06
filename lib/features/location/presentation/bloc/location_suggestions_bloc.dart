import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_state.dart';
import 'package:stream_transform/stream_transform.dart';

sealed class LocationSuggestionsEvent {}

class GetLocationSuggestions extends LocationSuggestionsEvent {
  GetLocationSuggestions({required this.query});
  final String query;
}

class SetEmptySuggestion extends LocationSuggestionsEvent {}

class LocationSuggestionsBloc
    extends Bloc<LocationSuggestionsEvent, LocationSuggestionsState> {
  final GetLocationSuggestionsUseCase getLocationSuggestionsUseCase;
  LocationSuggestionsBloc(this.getLocationSuggestionsUseCase)
    : super(LocationSuggestionsInitial()) {
    on<GetLocationSuggestions>(
      (event, emit) async {
        try {
          var query = event.query.trim();
          emit(LocationSuggestionsLoading());
          var result = await getLocationSuggestionsUseCase.execute(
            query: query,
          );

          emit(LocationSuggestionsLoaded(result));
        } on Exception catch (e) {
          emit(LocationSuggestionsError(e.toString()));
        }
      },
      transformer: (events, mapper) =>
          events.debounce(const Duration(milliseconds: 300)).switchMap(mapper),
    );
    on<SetEmptySuggestion>((event, emit) {
      emit(LocationSuggestionsLoaded([]));
    });
  }
}
