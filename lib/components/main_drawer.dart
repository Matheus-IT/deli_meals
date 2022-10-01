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
            const SizedBox(height: 20),
            ListTile(
              tileColor: Colors.red[300],
              textColor: Colors.white,
              iconColor: Colors.white,
              title: const Text(
                'Meals',
                style: TextStyle(fontFamily: 'RobotoCondensed'),
              ),
              leading: const Icon(Icons.restaurant, size: 26),
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              horizontalTitleGap: 10,
              tileColor: Colors.red[300],
              textColor: Colors.white,
              iconColor: Colors.white,
              title: const Text(
                'Settings',
                style: TextStyle(fontFamily: 'RobotoCondensed'),
              ),
              leading: const Icon(Icons.settings, size: 26),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
