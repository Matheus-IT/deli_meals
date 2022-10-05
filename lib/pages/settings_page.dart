import 'package:deli_meals/components/settings_switch_tile.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    setState(() => _glutenFree = newValue);
                  },
                  currentValue: _glutenFree,
                ),
                SettingsSwitchTile(
                  title: 'Lactose-Free',
                  subtitle: 'Only include lactose free meals',
                  handleUpdateValue: (newValue) {
                    setState(() => _lactoseFree = newValue);
                  },
                  currentValue: _lactoseFree,
                ),
                SettingsSwitchTile(
                  title: 'Vegetarian-Free',
                  subtitle: 'Only include vegetarian free meals',
                  handleUpdateValue: (newValue) {
                    setState(() => _vegetarian = newValue);
                  },
                  currentValue: _vegetarian,
                ),
                SettingsSwitchTile(
                  title: 'Vegan-Free',
                  subtitle: 'Only include vegan free meals',
                  handleUpdateValue: (newValue) {
                    setState(() => _vegan = newValue);
                  },
                  currentValue: _vegan,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
