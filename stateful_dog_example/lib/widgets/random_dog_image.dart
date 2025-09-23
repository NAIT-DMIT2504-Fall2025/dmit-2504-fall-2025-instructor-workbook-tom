import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String _dogImageUrl = '';

  Future<String> getRandomDogURL() async {
    var endpoint = Uri.parse(widget.endpoint);
    var response = await http.get(endpoint);
    return jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();

    // Get a random dog on load
    getRandomDogURL().then((url) {
      // Set the state to trigger a rerender
      setState(() {
        _dogImageUrl = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(_dogImageUrl, height: 250);
  }
}
