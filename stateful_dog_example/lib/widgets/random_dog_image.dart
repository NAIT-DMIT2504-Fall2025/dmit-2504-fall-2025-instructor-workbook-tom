import 'package:flutter/material.dart';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String _dogImageUrl =
      'https://images.dog.ceo/breeds/mudhol-indian/Indian-Mudhol.jpg';

  @override
  Widget build(BuildContext context) {
    return Image.network(_dogImageUrl, height: 250);
  }
}
