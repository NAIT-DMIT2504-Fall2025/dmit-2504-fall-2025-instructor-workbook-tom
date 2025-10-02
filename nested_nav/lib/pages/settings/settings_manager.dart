import 'package:flutter/material.dart';
import 'package:nested_nav/pages/settings/option_1.dart';
import 'package:nested_nav/pages/settings/option_2.dart';
import 'package:nested_nav/pages/settings/option_3.dart';
import 'package:nested_nav/pages/settings_page.dart';

class SettingsManager extends StatefulWidget {
  final String initialRoute;

  const SettingsManager({super.key, required this.initialRoute});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  Route _customOnGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case '/home':
        page = SettingsPage();
        break;
      case '/option1':
        page = Option1();
        break;
      case '/option2':
        page = Option2();
        break;
      case '/option3':
        page = Option3();
        break;
      default:
        page = Text('default');
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: _customOnGenerateRoute,
        initialRoute: widget.initialRoute,
      ),
    );
  }
}
