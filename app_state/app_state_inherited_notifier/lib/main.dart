import 'package:app_state_inherited_notifier/widgets/user_notifier.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

import 'package:app_state_inherited_notifier/models/user.dart';

void main() {
  runApp(const MainApp());
}

User user = User('Tom', 'Maurer');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap material app with a user Notifier to allow access to the user from any child
    // widget anywhere down the tree
    return UserNotifier(
      user: user,
      child: const MaterialApp(
        home: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
