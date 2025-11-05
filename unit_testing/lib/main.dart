import 'package:flutter/material.dart';
import 'package:unit_testing/models/user.dart';
import 'package:unit_testing/widgets/user_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserWidget(
            user: User(email: 'OhHi@mark.ca', name: 'Mark'),
          ),
        ),
      ),
    );
  }
}
