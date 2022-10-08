import 'package:deli_meals/pages/meal_detail_page.dart';
import 'package:deli_meals/pages/settings_page.dart';
import 'package:deli_meals/pages/tabs_page.dart';
import 'package:deli_meals/providers/meal_provider.dart';
import 'package:deli_meals/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/category_provider.dart';
import 'pages/meals_page.dart';
import 'pages/home_page.dart';
import 'app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider<MealProvider>(
          create: (_) => MealProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.red,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                ),
              ),
        ),
        routes: {
          AppRoutes.homePage: (ctx) => const TabsPage(),
          AppRoutes.mealsPage: (ctx) => const MealsPage(),
          AppRoutes.mealDetailPage: (ctx) => const MealDetailPage(),
          AppRoutes.settingsPage: (ctx) => const SettingsPage(),
        },
        onGenerateRoute: (settings) {
          // In case of going to a route that is not listed
          debugPrint(settings.arguments.toString());
          return MaterialPageRoute(builder: (ctx) => const HomePage());
        },
        onUnknownRoute: (settings) {
          // If not listed routes and not generated routes use this as a last resource
          return MaterialPageRoute(builder: (ctx) => const HomePage());
        },
      ),
    );
  }
}
