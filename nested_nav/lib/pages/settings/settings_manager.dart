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
  final _navigatorKey = GlobalKey<NavigatorState>();

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
      appBar: AppBar(
        title: Text('App Settings'),
        leading: IconButton(
          onPressed: () {
            // Check if the sibling navigator has any pages on the stack
            // If not pop the parent stack
            if (_navigatorKey.currentState!.canPop()) {
              _navigatorKey.currentState!.pop();
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: _customOnGenerateRoute,
        initialRoute: widget.initialRoute,
      ),
    );
  }
}
