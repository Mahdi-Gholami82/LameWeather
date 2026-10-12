import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lame_weather/core/data/repositories/preferances_repository.dart';
import 'package:lame_weather/core/presentation/bloc/theme_bloc.dart';
import 'package:lame_weather/features/settings/presentation/widgets/setting_tile.dart';

class SettingsPage extends StatefulWidget {
  static const String route = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            SettingTile(
              leading: const Icon(Icons.format_paint),
              title: Text("Theme Mode", overflow: TextOverflow.ellipsis),
              trailing: FittedBox(
                child: SegmentedButton(
                  onSelectionChanged: (newThemeModeSet) {
                    var newThemeMode = newThemeModeSet.first;
                    themeCubit.update(newThemeMode);
                    GetIt.instance<PreferencesRepository>().saveThemeMode(
                      newThemeMode,
                    );
                  },
                  showSelectedIcon: false,
                  style: SegmentedButton.styleFrom(
                    selectedBackgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHigh,
                  ),
                  segments: ThemeMode.values
                      .map(
                        (e) => ButtonSegment(
                          value: e,
                          icon: Icon(switch (e) {
                            ThemeMode.system => Icons.contrast,
                            ThemeMode.light => Icons.light_mode,
                            ThemeMode.dark => Icons.dark_mode,
                          }),
                          tooltip: e.name,
                        ),
                      )
                      .toList(),
                  selected: {themeCubit.state},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
