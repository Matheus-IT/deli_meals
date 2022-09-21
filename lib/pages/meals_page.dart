import 'package:deli_meals/models/category_model.dart';
import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  final CategoryModel category;

  const MealsPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
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
