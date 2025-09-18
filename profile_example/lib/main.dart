import 'package:flutter/material.dart';
import 'package:profile_example/pages/profile_page.dart';
import 'package:profile_example/widgets/header.dart';
import 'package:profile_example/widgets/profile_image.dart';
import 'package:profile_example/widgets/profile_info.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
      fontFamily: 'ComicRelief',
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.lightGreen,
      ),
    );

    var darkTheme = lightTheme.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange,
        cardColor: Colors.black87,
        backgroundColor: Colors.black87,
      ),
    );

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: ProfilePage(),
    );
  }
}
