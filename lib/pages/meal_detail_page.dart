import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(title: Text(mealModel.title)),
      body: Center(child: Text(mealModel.id)),
    );
  }
}
