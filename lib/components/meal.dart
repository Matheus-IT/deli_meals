import 'package:deli_meals/app_routes.dart';
import 'package:deli_meals/models/meal_model.dart';
import 'package:deli_meals/providers/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Meal extends StatelessWidget {
  final MealModel mealModel;

  const Meal({required this.mealModel, super.key});

  void handleMealTapped(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.mealDetailPage,
      arguments: mealModel,
    )
        .then((mealModel) {
      debugPrint('Coming from mealDetailPage');
      if (mealModel != null) {
        final provider = Provider.of<MealProvider>(context, listen: false);
        provider.removeMeal(mealModel as MealModel);
        _showSnackbar(context, msg: 'You deleted ${mealModel.title}');
      }
    });
  }

  void _showSnackbar(BuildContext context, {required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
    ));
  }

  String get complexityText {
    const readableComplexity = {
      Complexity.Simple: 'Simple',
      Complexity.Challenging: 'Challenging',
      Complexity.Hard: 'Hard',
    };
    return readableComplexity[mealModel.complexity] ?? 'Unknown Complexity';
  }

  String get affordabilityText {
    const readableAffordability = {
      Affordability.Affordable: 'Affordable',
      Affordability.Pricey: 'Pricey',
      Affordability.Luxurious: 'Expensive',
    };
    return readableAffordability[mealModel.affordability] ??
        'Unknown Affordability';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleMealTapped(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealModel.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      mealModel.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${mealModel.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
