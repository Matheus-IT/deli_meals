import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../dummy_data.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = dummyCategories;

  List<CategoryModel> get categories => [..._categories];
}
