import 'package:flutter/material.dart';

class SettingsManager extends StatefulWidget {
  const SettingsManager({super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("This is the settings manager"));
  }
}
