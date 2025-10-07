import 'package:flutter/material.dart';
import 'package:local_storage_example/widgets/random_dog_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: RandomDogImage())),
    );
  }
}
