abstract class LocationSuggestionsState {}

class LocationSuggestionsInitial extends LocationSuggestionsState {}

class LocationSuggestionsLoading extends LocationSuggestionsState {}

class LocationSuggestionsLoaded extends LocationSuggestionsState {
  final List<String> locationSuggestions;
  LocationSuggestionsLoaded(this.locationSuggestions);
}

class LocationSuggestionsError extends LocationSuggestionsState {
  final String message;
  LocationSuggestionsError(this.message);
}
