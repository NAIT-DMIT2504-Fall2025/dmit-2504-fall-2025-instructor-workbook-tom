import 'package:camera_app/pages/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Camera package will automatically handle permissions for you
  List<CameraDescription> cameras = await availableCameras();

  runApp(MainApp(camera: cameras[0]));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.camera});

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CameraPage(cameraDescription: camera));
  }
}
