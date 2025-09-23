import 'package:flutter/material.dart';
import 'package:stateful_dog_example/widgets/random_dog_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: Scaffold(body: Center(child: RandomDogImage())),
    );
  }
}
