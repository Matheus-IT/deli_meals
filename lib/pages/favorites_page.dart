import 'package:deli_meals/components/meal.dart';
import 'package:deli_meals/providers/meal_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealProvider>(context, listen: false);
    final favoriteMeals =
        mealsProvider.meals.where((meal) => meal.isFavorite).toList();

    return Center(
      child: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) => Meal(mealModel: favoriteMeals[index]),
      ),
    );
  }
}
