import 'package:flutter/material.dart';
import 'package:navigation_intro/pages/page_one.dart';
import 'package:navigation_intro/pages/page_two.dart';
import 'package:navigation_intro/routes.dart' as routes;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: routes.homeRoute,
      routes: {
        routes.homeRoute: (context) => PageOne(),
        routes.pageTwoRoute: (context) => PageTwo(),
      },
    );
  }
}
