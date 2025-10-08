import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String _dogImageUrl = '';
  int _likes = 0;
  int _dislikes = 0;

  Future<String> getRandomDogURL() async {
    var endpoint = Uri.parse(widget.endpoint);
    var response = await http.get(endpoint);
    return jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      final likes = prefs.getInt('likes');
      final dislikes = prefs.getInt('dislikes');

      setState(() {
        _likes = likes ?? 0;
        _dislikes = dislikes ?? 0;
      });
    });

    // Check if there is a local image, if so display that else get new dog
    getTemporaryDirectory().then((dir) {
      final file = File('${dir.path}/last_seen_dog.jpg');
      print(file.path);

      if (file.existsSync()) {
        setState(() {
          _dogImageUrl = file.path;
        });
      } else {
        // Get a random dog on load
        _refreshDog();
      }
    });
  }

  void _incrementCounter(bool isLikes) {
    setState(() {
      if (isLikes) {
        _likes++;
      } else {
        _dislikes++;
      }
      _updateCounterPreferences(isLikes);
    });
    _refreshDog();
  }

  void _updateCounterPreferences(bool isLikes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(isLikes ? 'likes' : 'dislikes', isLikes ? _likes : _dislikes);
  }

  void _refreshDog() {
    setState(() {
      _dogImageUrl = '';
    });
    getRandomDogURL().then((url) {
      if (mounted) {
        setState(() {
          _dogImageUrl = url;
        });
      }
    });
  }

  void _saveImage(String url) async {
    // Get the temp directory
    final dir = await getTemporaryDirectory();

    // Create the file path
    final filePath = '${dir.path}/last_seen_dog.jpg';

    // Get the image from the internet
    final response = await http.get(Uri.parse(url));

    // Write the image to the file path
    final file = File(filePath);
    file.writeAsBytesSync(response.bodyBytes);
  }

  Widget _buildImage() {
    Widget childWidget;

    // Display the local image if the url is for a local image
    if (_dogImageUrl.startsWith('http')) {
      // Network image url
      childWidget = Image.network(_dogImageUrl);

      // Update the local cache with the dog image from the network
      _saveImage(_dogImageUrl);
    } else {
      // Local image url
      childWidget = Image.file(File(_dogImageUrl));
    }

    return _dogImageUrl.isEmpty
        ? CircularProgressIndicator()
        : GestureDetector(
            onDoubleTap: () {
              _incrementCounter(true);
            },
            onLongPress: () {
              _incrementCounter(false);
            },
            child: childWidget,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Likes: $_likes', style: TextStyle(fontSize: 24)),
            Text('Dislikes: $_dislikes', style: TextStyle(fontSize: 24)),
          ],
        ),
        ElevatedButton(
          onPressed: _refreshDog,
          child: Text('Get me a new dog please'),
        ),
      ],
    );
  }
}
