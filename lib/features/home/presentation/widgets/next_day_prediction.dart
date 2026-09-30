import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lame_weather/core/presentation/weather_icons.dart';

class NextDayPrediction extends StatelessWidget {
  const NextDayPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTextStyle(
      style: TextStyle(fontWeight: FontWeight.w500),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 1, child: FittedBox(child: Text("Today"))),
          Flexible(
            flex: 4,
            child: FittedBox(
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    "23",
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(WeatherIcons.cloudy),
                  ),
                  Text("77°"),
                  Text("66°"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
