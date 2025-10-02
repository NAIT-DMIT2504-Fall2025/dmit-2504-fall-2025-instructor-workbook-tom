import 'package:flutter/material.dart';

class SettingsManager extends StatefulWidget {
  const SettingsManager({super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  Route _customOnGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case '/home':
        // TODO: Assign page to the settings home page
        page = Text('home');
        break;
      case '/option1':
        // TODO: Assign page to the option 1 page
        page = Text('o 1');
        break;
      case '/option2':
        // TODO: Assign page to the option 2 page
        page = Text('o 2');
        break;
      case '/option3':
        page = Text('o 3');
        // TODO: Assign page to the option 3 page
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
        initialRoute: '/home',
      ),
    );
  }
}
