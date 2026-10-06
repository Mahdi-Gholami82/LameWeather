import 'package:flutter/material.dart';
import 'package:lame_weather/core/presentation/weather_icons.dart';
import 'package:lame_weather/features/home/presentation/widgets/vertical_gradiant_bar.dart';

class NextHoursPrediction extends StatelessWidget {
  const NextHoursPrediction({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
    required this.percentage,
  });

  final DateTime time;
  final IconData icon;
  final double temperature;
  final int percentage;

  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute;

    final period = hour >= 12 ? "PM" : "AM";
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    final displayMinute = minute.toString().padLeft(2, "0");

    return "$displayHour:$displayMinute $period";
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      spacing: 5,
      children: [
        Column(
          children: [
            Text(formatTime(time)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 30),
            ),
            Text("$temperature°"),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: VerticalGradiantBar(
            background: colorScheme.onPrimary,
            foreground: colorScheme.primary,
            width: 12,
            radius: Radius.circular(10),
            foregroundFill: percentage / 100,
            fillOffset: 0.2,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "$percentage "),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(Icons.water_drop, size: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
