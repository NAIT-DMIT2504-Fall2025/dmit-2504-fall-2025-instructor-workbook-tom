// This will represent the /settings/home route

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option1');
              },
              child: Text('Go To Option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option2');
              },
              child: Text('Go To Option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option3');
              },
              child: Text('Go To Option 3'),
            ),
          ],
        ),
      ),
    );
  }
}
