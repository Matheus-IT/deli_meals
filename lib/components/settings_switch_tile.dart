import 'package:flutter/material.dart';

class SettingsSwitchTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final void Function(bool) handleUpdateValue;
  final bool currentValue;

  const SettingsSwitchTile({
    required this.title,
    required this.subtitle,
    required this.handleUpdateValue,
    required this.currentValue,
    super.key,
  });

  @override
  State<SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      onChanged: widget.handleUpdateValue,
      value: widget.currentValue,
    );
  }
}
