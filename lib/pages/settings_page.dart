import 'package:deli_meals/components/main_drawer.dart';
import 'package:deli_meals/components/settings_switch_tile.dart';
import 'package:deli_meals/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context, listen: false);
    final settings = provider.settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your settings'),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 24),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SettingsSwitchTile(
                  title: 'Gluten-Free',
                  subtitle: 'Only include gluten free meals',
                  handleUpdateValue: (newValue) {
                    setState(() {
                      provider.updateSettings({'gluten': newValue});
                    });
                  },
                  currentValue: settings.gluten,
                ),
                SettingsSwitchTile(
                  title: 'Lactose-Free',
                  subtitle: 'Only include lactose free meals',
                  handleUpdateValue: (newValue) {
                    setState(() {
                      provider.updateSettings({'lactoseFree': newValue});
                    });
                  },
                  currentValue: settings.lactoseFree,
                ),
                SettingsSwitchTile(
                  title: 'Vegetarian-Free',
                  subtitle: 'Only include vegetarian free meals',
                  handleUpdateValue: (newValue) {
                    setState(() {
                      provider.updateSettings({'vegetarian': newValue});
                    });
                  },
                  currentValue: settings.vegetarian,
                ),
                SettingsSwitchTile(
                  title: 'Vegan-Free',
                  subtitle: 'Only include vegan free meals',
                  handleUpdateValue: (newValue) {
                    setState(() {
                      provider.updateSettings({'vegan': newValue});
                    });
                  },
                  currentValue: settings.vegan,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
