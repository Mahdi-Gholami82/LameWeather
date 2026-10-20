import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  final Widget title;

  const SettingsTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 15, horizontal: 20),
      child: DefaultTextStyle(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        child: title,
      ),
    );
  }
}
