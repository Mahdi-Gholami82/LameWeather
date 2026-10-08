import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:lame_weather/core/api/api_config.dart';
import 'package:lame_weather/core/data/models/location.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/data/sources/preferances_source.dart';
import 'package:lame_weather/features/location/data/repositories/location_repository.dart';
import 'package:lame_weather/features/location/data/sources/location_data_source.dart';
import 'package:lame_weather/features/weather/data/models/weather_model.dart';
import 'package:lame_weather/features/weather/data/repositories/weather_repository.dart';
import 'package:lame_weather/features/weather/data/sources/weather_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/join_path.dart';
@GenerateNiceMocks([MockSpec<Client>()])
import 'api_test.mocks.dart';

final getIt = GetIt.instance;
final mockClient = MockClient();

Future<void> configureDependencies() async {
  getIt.registerSingleton<WeatherApiConfig>(
    WeatherApiConfig(host: "mock.com", version: "v1", key: "mock"),
  );
  getIt.registerLazySingleton(() => PreferencesDataSource(getIt()));
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(getIt()),
  );
  getIt.registerSingleton<Client>(
    mockClient,
    dispose: (client) => client.close(),
  );
  getIt.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(dataSource: getIt<WeatherDataSource>()),
  );
  getIt.registerLazySingleton<LocationDataSource>(
    () => LocationDataSourceImpl(),
  );
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationDataSource>()),
  );
}

void main() {
  configureDependencies();
  final apiConfig = getIt<WeatherApiConfig>();
  var dataSource = getIt<WeatherDataSource>();

  Future<String> getFixture(String name) =>
      File(joinPaths(["test", "api", "fixtures", name])).readAsString();

  test("get weather", () async {
    when(
      mockClient.get(
        apiConfig.uri(
          "/forecast.json",
          queryParameters: {
            "key": apiConfig.key,
            "q": "non-existing",
            "days": "4",
            "aqi": "no",
            "alerts": "no",
          },
        ),
      ),
    ).thenAnswer((_) async {
      return Response('{"error":"not found"}', 404);
    });

    await expectLater(
      dataSource.getWeather(location: "non-existing"),
      throwsException,
      reason: "Exception expected",
    );

    when(
      mockClient.get(
        apiConfig.uri(
          "/forecast.json",
          queryParameters: {
            "key": apiConfig.key,
            "q": "existing",
            "days": "4",
            "aqi": "no",
            "alerts": "no",
          },
        ),
      ),
    ).thenAnswer((_) async {
      return Response(
        await getFixture("weather_forecast_valid_response.json"),
        200,
      );
    });

    await expectLater(
      dataSource.getWeather(location: "existing"),
      completion(isA<WeatherModel>()),
      reason: "WeatherModel expected",
    );
  });

  test("get location suggestions", () async {
    when(
      mockClient.get(
        apiConfig.uri(
          "/search.json",
          queryParameters: {"key": apiConfig.key, "q": "not-ok"},
        ),
      ),
    ).thenAnswer((_) async => Response('{"error":"not found"}', 404));

    await expectLater(
      dataSource.getLocationSuggestions(search: "not-ok"),
      throwsException,
      reason: "Exception expected",
    );

    when(
      mockClient.get(
        apiConfig.uri(
          "/search.json",
          queryParameters: {"key": apiConfig.key, "q": "ok"},
        ),
      ),
    ).thenAnswer(
      (_) async => Response(
        await getFixture("weather_location_search_valid_response.json"),
        200,
      ),
    );

    await expectLater(
      dataSource.getLocationSuggestions(search: "ok"),
      completion(allOf(isA<List<LocationModel>>(), hasLength(5))),
      reason: "WeatherModel expected",
    );
  });
}
