import 'package:deli_meals/components/listing_element.dart';
import 'package:flutter/material.dart';
import '../components/container_for_listing.dart';
import '../components/section_title.dart';
import '../models/meal_model.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({super.key});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(title: Text(mealModel.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => mealModel.toggleFavorite());
        },
        child: Icon(mealModel.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_outline_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SectionTitle(title: 'Ingredients'),
            ContainerForListing(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealModel.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListingElement(label: mealModel.ingredients[index]),
                ),
              ),
            ),
            const SectionTitle(title: 'Steps'),
            ContainerForListing(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealModel.steps.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    leading: CircleAvatar(child: Text('# ${index + 1}')),
                    title: Text(
                      mealModel.steps[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
