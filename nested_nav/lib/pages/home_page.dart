import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is the home page"),
      // A button to route to the settings page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/settings/');
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
