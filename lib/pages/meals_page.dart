import 'package:deli_meals/models/category_model.dart';
import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: const Center(
        child: Text('The recipes of the category...'),
      ),
    );
  }
}