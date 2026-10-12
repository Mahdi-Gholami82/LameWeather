import 'package:flutter/material.dart';
import 'package:lame_weather/features/location/page.dart';
import 'package:lame_weather/features/settings/page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var navigator = Navigator.of(context);
    var children = [
      Container(height: 100, color: colorScheme.primary),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
        onTap: () => navigator.pushNamed(SettingsPage.route),
      ),
      ListTile(
        leading: Icon(Icons.location_on),
        title: Text("Locations"),
        onTap: () => navigator.pushNamed(LocationsPage.route),
      ),
      ListTile(
        leading: Icon(Icons.close),
        title: Text("Close"),
        onTap: () => navigator.pop(),
      ),
    ];
    return Drawer(
      shape: LinearBorder(),
      child: ListView.separated(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10),
      ),
    );
  }
}
