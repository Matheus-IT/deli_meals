import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const DrawerTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.red[300],
      textColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontFamily: 'RobotoCondensed'),
      ),
      leading: Icon(icon, size: 26),
      onTap: onTap,
    );
  }
}
