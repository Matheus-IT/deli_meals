import 'package:deli_meals/app_routes.dart';
import 'package:deli_meals/components/drawer_tile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Dalimeals',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            DrawerTile(
              title: 'Meals',
              icon: Icons.restaurant,
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
              },
            ),
            const SizedBox(height: 8),
            DrawerTile(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.settingsPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
