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
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten-Free'),
                  subtitle: const Text('Only include gluten free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  value: _glutenFree,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
