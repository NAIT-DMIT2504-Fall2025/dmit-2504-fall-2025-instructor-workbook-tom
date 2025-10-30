import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Position? _position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if locations are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services disabled on device');
    }

    // If they are enabled look for existing permissions
    permission = await Geolocator.checkPermission();

    // If no existing permissions ask for permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      // If they deny again throw an error or something
      if (permission == LocationPermission.denied) {
        // Here's where you have your business logic of if the user explicitly doesn't give permissions
        return Future.error("Location service permissions denied");
      }
    }

    // If permission not granted permanently handle it some way
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // Once we have permissions get the location and return it
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
