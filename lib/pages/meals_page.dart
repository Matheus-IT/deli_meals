import 'package:deli_meals/models/category_model.dart';
import 'package:deli_meals/providers/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    final provider = Provider.of<MealProvider>(context, listen: false);
    final categoryMeals = provider.categoryMeals(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) => Text(categoryMeals[index].title),
        ),
      ),
    );
  }
}
