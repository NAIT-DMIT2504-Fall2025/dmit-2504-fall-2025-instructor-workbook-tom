import 'package:flutter/material.dart';
import 'package:local_sql/models/dog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Dog> dogs = [
    Dog(id: 0, name: 'Quinn', age: 6),
    Dog(id: 1, name: 'Shinki', age: 2),
    Dog(id: 87, name: 'Crosby', age: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile();
            },
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemCount: dogs.length,
          ),
        ),
      ),
    );
  }
}
