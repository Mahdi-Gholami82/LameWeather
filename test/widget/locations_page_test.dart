import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/location/domain/use_cases/get_location_suggestions.dart';
import 'package:lame_weather/features/location/page.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_bloc.dart';
import 'package:lame_weather/main.dart';

import 'package:http/http.dart';
import 'package:lame_weather/core/api/api_config.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/features/weather/data/repositories/weather_repository.dart';
import 'package:lame_weather/features/weather/data/sources/weather_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<GetLocationSuggestionsUseCase>(),
  MockSpec<PreferencesRepository>(),
  MockSpec<LocationBloc>(),
])
import 'locations_page_test.mocks.dart';

Future<void> configureDependencies() async {
  getIt.registerSingleton<WeatherApiConfig>(
    WeatherApiConfig(host: "test.com", version: "v1", key: "test"),
  );
  getIt.registerLazySingleton<PreferencesRepository>(
    () => MockPreferencesRepository(),
  );
  getIt.registerSingleton<Client>(
    Client(),
    dispose: (client) => client.close(),
  );
  getIt.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(getIt<Client>()),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(dataSource: getIt<WeatherDataSource>()),
  );
  getIt.registerLazySingleton<GetLocationSuggestionsUseCase>(
    () => MockGetLocationSuggestionsUseCase(),
  );
  getIt.registerSingleton<List<BlocProvider>>([
    BlocProvider<LocationSuggestionsBloc>(
      create: (_) =>
          LocationSuggestionsBloc(getIt<GetLocationSuggestionsUseCase>()),
    ),
    BlocProvider<LocationBloc>(create: (_) => MockLocationBloc()),
  ]);
}

void main() {
  configureDependencies();
  testWidgets("test number of ", (WidgetTester tester) async {
    when(
      getIt<PreferencesRepository>().getSavedLocations(),
    ).thenAnswer((_) => []);
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: getIt<List<BlocProvider>>(),
          child: Locations(),
        ),
      ),
    );
    int numberOfSuggestions = 4;
    var query = "sample";
    when(
      getIt<GetLocationSuggestionsUseCase>().execute(query: query),
    ).thenAnswer(
      (_) async => List.generate(
        numberOfSuggestions,
        (index) => Location(
          name: "Sample $index",
          point: Point(latitude: index.toDouble(), longitude: index.toDouble()),
        ),
      ),
    );

    final Finder searchBar = find.byType(SearchBar);
    expect(searchBar, findsOneWidget);
    await tester.tap(searchBar);
    await tester.pumpAndSettle();
    final searchField = find.byType(TextField);
    expect(searchField, findsNWidgets(2));
    await tester.enterText(searchField.last, "sample");
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNWidgets(numberOfSuggestions));
  });
}
