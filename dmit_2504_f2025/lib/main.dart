import 'package:dmit_2504_f2025/app_state.dart';
import 'package:dmit_2504_f2025/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = ApplicationState();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (context) {
        return HomePage();
      },
    };

    return MaterialApp(routes: routes);
  }
}
