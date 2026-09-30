import 'package:flutter/material.dart';
import 'package:lame_weather/core/presentation/weather_icons.dart';

class NextHoursPrediction extends StatelessWidget {
  const NextHoursPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Flexible(
      child: FittedBox(
        child: Column(
          spacing: 5,
          children: [
            Text("11:00 AM"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(WeatherIcons.moon5, size: 30),
            ),
            Text("90°"),
            Container(
              height: 90,
              width: 10,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text("23"),
          ],
        ),
      ),
    );
  }
}
