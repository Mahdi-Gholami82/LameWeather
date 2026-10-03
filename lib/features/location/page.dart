import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lame_weather/core/domain/entities/location.dart';
import 'package:lame_weather/features/home/presentation/bloc/weather_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_point_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_selection_state.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_bloc.dart';
import 'package:lame_weather/features/location/presentation/bloc/location_suggestions_state.dart';

class LocationSelectorPage extends StatefulWidget {
  const LocationSelectorPage({super.key});
  static const String route = "/locations";

  @override
  State<LocationSelectorPage> createState() => _LocationSelectorPageState();
}

class _LocationSelectorPageState extends State<LocationSelectorPage> {
  var searchController = SearchController();

  void _triggerSuggestionRebuild() {
    const String zeroWidthSpace = '\u200B';
    final previousText = searchController.text;
    searchController.text = "$zeroWidthSpace$previousText";
    searchController.text = previousText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: BlocBuilder<LocationBloc, LocationSelectionState>(
              builder: (context, final locationPointState) {
                List<Location> suggestions = [];

                return BlocBuilder<
                  LocationSuggestionsBloc,
                  LocationSuggestionsState
                >(
                  builder: (context, final locationSuggestionsState) {
                    if (locationSuggestionsState
                        case LocationSelectionLoaded locationPointLoaded) {
                    } else if (locationSuggestionsState
                        case LocationSuggestionsLoaded loaded) {
                      suggestions = loaded.locationSuggestions;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _triggerSuggestionRebuild();
                      });
                    }
                    if (locationSuggestionsState
                        case LocationSuggestionsError error) {}
                    return SearchAnchor(
                      searchController: searchController,
                      viewOnChanged: (value) {
                        final query = value.trim();
                        var locationSuggestionsBloc =
                            BlocProvider.of<LocationSuggestionsBloc>(context);
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
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_outlined),
                          ),
                          trailing: [
                            IconButton(
                              onPressed: () {
                                context.read<LocationBloc>().add(
                                  GetLocationSelectionEvent(),
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
                                  BlocProvider.of<WeatherBloc>(context).add(
                                    GetWeatherFromPointEvent(
                                      location: location,
                                    ),
                                  );
                                  Navigator.of(context).pop();
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
        ],
      ),
    );
  }
}
