import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  var photosDir = '';
  List<String> photos = [];

  @override
  initState() {
    super.initState();
    getApplicationCacheDirectory().then((dir) {
      setState(() {
        photosDir = dir.path;

        dir.listSync().toList().forEach((photoFile) {
          if (photoFile.path.endsWith("jpg")) photos.add(photoFile.path);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return ListTile(
            leading: Image.file(File(photos[idx]), height: 50, width: 50),
            title: Text(photos[idx]),
          );
        },
        itemCount: photos.length,
      ),
    );
  }
}
