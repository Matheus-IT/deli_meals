import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/models/meal_model.dart';
import 'package:flutter/widgets.dart';

class MealProvider extends ChangeNotifier {
  final List<MealModel> _meals = dummyMeals;

  List<MealModel> get meals => [..._meals];

  List<MealModel> categoryMeals(String categoryId) {
    return meals.where((m) => m.categoryIds.contains(categoryId)).toList();
  }

  void removeMeal(MealModel mealModel) {
    _meals.remove(mealModel);
    notifyListeners();
  }
}
