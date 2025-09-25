import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login Form'),
                TextField(decoration: InputDecoration(label: Text('Username'))),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(label: Text('Password')),
                ),
                TextButton(onPressed: () {}, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
