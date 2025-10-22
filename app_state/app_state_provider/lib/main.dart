import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_state_provider/models/user.dart';
import 'pages/home_page.dart';

void main() {
  // Wrap the main app in a provider which will provide access
  // to our User State object to all consumers in the widget tree

  runApp(
    ChangeNotifierProvider(
      create: (context) => User('Gary', 'Gygax'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: HomePage())),
    );
  }
}
