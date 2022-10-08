import 'package:deli_meals/components/meal.dart';
import 'package:deli_meals/models/category_model.dart';
import 'package:deli_meals/providers/meal_provider.dart';
import 'package:deli_meals/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    final mealsProvider = Provider.of<MealProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    final categoryMeals = mealsProvider.categoryMeals(category.id);

    // use settings filters if they are on
    final meals = categoryMeals.where((meal) {
      final settings = settingsProvider.settings;

      if ((settings.gluten && !meal.isGlutenFree) ||
          (settings.lactoseFree && !meal.isLactoseFree) ||
          (settings.vegan && !meal.isVegan) ||
          (settings.vegetarian && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => Meal(mealModel: meals[index]),
        ),
      ),
    );
  }
}
