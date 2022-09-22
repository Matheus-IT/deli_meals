import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../models/category_model.dart';
import '../pages/meals_page.dart';

class Category extends StatelessWidget {
  final CategoryModel categoryModel;

  const Category({required this.categoryModel, super.key});

  void handleCategorySelected(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      AppRoutes.mealsPage,
      arguments: categoryModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleCategorySelected(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [categoryModel.color.withOpacity(0.7), categoryModel.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
