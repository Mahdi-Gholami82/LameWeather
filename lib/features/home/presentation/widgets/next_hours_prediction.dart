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
    var maxbarSize = 90;
    var barSize = (maxbarSize / 100) * percentage;
    return Column(
      spacing: 5,
      children: [
        Text(formatTime(time)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 30),
        ),
        Text("$temperature°"),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(top: maxbarSize - barSize),
            child: Container(
              height: barSize,
              width: 10,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Text(percentage.toString()),
      ],
    );
  }
}
