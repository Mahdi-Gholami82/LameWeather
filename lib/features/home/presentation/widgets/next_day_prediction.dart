import 'package:flutter/material.dart';

class NextDayPrediction extends StatelessWidget {
  const NextDayPrediction({
    super.key,
    required this.dayLabel,
    required this.humidity,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });

  final String dayLabel;
  final int humidity;
  final IconData icon;
  final double maxTemp;
  final double minTemp;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTextStyle(
      style: const TextStyle(fontWeight: FontWeight.w500),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 1, child: FittedBox(child: Text(dayLabel))),
          Flexible(
            flex: 5,
            child: FittedBox(
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    humidity.toString(),
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Icon(icon),
                  ),
                  Text(maxTemp.toString()),
                  Text(minTemp.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
