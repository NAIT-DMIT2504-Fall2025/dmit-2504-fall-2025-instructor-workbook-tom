import 'package:flutter/material.dart';
import 'package:nested_nav/pages/home_page.dart';
import 'package:nested_nav/pages/settings/settings_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Builder function that takes in RouteSettings and must return a route widget
      onGenerateRoute: (RouteSettings settings) {
        Widget page;

        // Switch on the route name and select the page based off of that
        switch (settings.name) {
          case '/':
            page = HomePage();
            break;

          case '/settings/home':
            // Modify this
            page = SettingsManager();
            break;

          default:
            throw Exception('Unknown Route Used: ${settings.name}');
        }

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}
