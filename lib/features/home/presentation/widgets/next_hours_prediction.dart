import 'package:flutter/material.dart';

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: height,
                    width: 10,
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: height * percentage / 100,
                    width: 10,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Text(percentage.toString()),
      ],
    );
  }
}
