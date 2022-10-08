import 'package:deli_meals/models/settings_model.dart';
import 'package:flutter/widgets.dart';

class SettingsProvider extends ChangeNotifier {
  final _settings = SettingsModel(
    gluten: false,
    vegetarian: false,
    vegan: false,
    lactoseFree: false,
  );

  SettingsModel get settings => SettingsModel(
        gluten: _settings.gluten,
        vegetarian: _settings.vegetarian,
        vegan: _settings.vegan,
        lactoseFree: _settings.lactoseFree,
      );

  void updateSettings(Map<String, bool> settingsData) {
    final elements = [
      {
        'key': 'gluten',
        'action': () => _settings.gluten = settingsData['gluten']!,
      },
      {
        'key': 'vegetarian',
        'action': () => _settings.vegetarian = settingsData['vegetarian']!,
      },
      {
        'key': 'vegan',
        'action': () => _settings.vegan = settingsData['vegan']!,
      },
      {
        'key': 'lactoseFree',
        'action': () => _settings.lactoseFree = settingsData['lactoseFree']!,
      },
    ];

    for (final e in elements) {
      if (settingsData.containsKey(e['key'])) {
        final func = e['action'] as Function;
        func();
      }
    }

    notifyListeners();
  }
}
