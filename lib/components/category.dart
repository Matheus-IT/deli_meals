import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../models/category_model.dart';

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
          color: Theme.of(context).canvasColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          border: Border.all(
            color: Colors.red[300]!,
            width: 3.0,
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
