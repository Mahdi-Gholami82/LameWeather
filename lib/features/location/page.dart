import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_state.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_state.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_state.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});
  static const String route = "/locations";

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  var searchController = SearchController();

  void _triggerSuggestionRebuild() {
    const String zeroWidthSpace = '\u200B';
    final previousText = searchController.text;
    searchController.text = "$zeroWidthSpace$previousText";
    searchController.text = previousText;
  }

  void _loadPointAndPop(BuildContext context, {required Point point}) {
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(GetWeatherFromPointEvent(point: point));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Location> locations = GetIt.instance<PreferencesRepository>()
        .getSavedLocations();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverFloatingHeader(
                child: BlocConsumer<LocationBloc, LocationPointState>(
                  listener: (context, locationPointState) {
                    switch (locationPointState) {
                      case LocationPointLoaded loaded:
                        {
                          _loadPointAndPop(context, point: loaded.point);
                        }
                      case LocationPointError error:
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message)),
                          );
                        }
                    }
                  },
                  builder: (context, final locationPointState) {
                    List<Location> suggestions = [];
                    return BlocConsumer<
                      LocationSuggestionsBloc,
                      LocationSuggestionsState
                    >(
                      listener: (context, state) {
                        switch (state) {
                          case LocationSuggestionsLoaded loaded:
                            {
                              suggestions = loaded.locationSuggestions;
                              _triggerSuggestionRebuild();
                            }
                          case LocationSuggestionsError error:
                            {
                              debugPrint(
                                "LocationSuggestionsError : ${error.message}",
                              );
                            }
                          default:
                            break;
                        }
                      },
                      builder: (context, final locationSuggestionsState) {
                        return SearchAnchor(
                          searchController: searchController,
                          viewOnChanged: (value) {
                            final query = value.trim();
                            var locationSuggestionsBloc =
                                BlocProvider.of<LocationSuggestionsBloc>(
                                  context,
                                );
                            if (query.isNotEmpty) {
                              locationSuggestionsBloc.add(
                                GetLocationSuggestions(query: query),
                              );
                            } else {
                              locationSuggestionsBloc.add(SetEmptySuggestion());
                            }
                          },
                          builder: (context, controller) {
                            return SearchBar(
                              controller: controller,
                              onTap: () => controller.openView(),
                              hintText: "Search locations...",
                              leading: IconButton(
                                onPressed: () {
                                  if (BlocProvider.of<WeatherBloc>(
                                        context,
                                      ).state
                                      is WeatherLoaded) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                icon: Icon(Icons.arrow_back_outlined),
                              ),
                              trailing: [
                                IconButton(
                                  onPressed: () {
                                    context.read<LocationBloc>().add(
                                      GetLocationPointEvent(),
                                    );
                                  },
                                  icon: const Icon(Icons.location_on),
                                ),
                              ],
                            );
                          },
                          suggestionsBuilder: (context, controller) {
                            return suggestions
                                .map(
                                  (location) => ListTile(
                                    title: Text(
                                      location.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () {
                                      controller.closeView(location.name);
                                      _loadPointAndPop(
                                        context,
                                        point: location.point,
                                      );
                                    },
                                  ),
                                )
                                .toList();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var location = locations[index];
                var point = location.point;
                String pointString = "${point.latitude}, ${point.longitude}";
                return Dismissible(
                  key: ValueKey(location.name + pointString),
                  child: ListTile(
                    leading: Icon(Icons.location_city_rounded),
                    title: Text(location.name),
                    subtitle: Text(pointString),
                    onTap: () {
                      _loadPointAndPop(context, point: point);
                    },
                  ),
                );
              }, childCount: locations.length),
            ),
          ],
        ),
      ),
    );
  }
}
