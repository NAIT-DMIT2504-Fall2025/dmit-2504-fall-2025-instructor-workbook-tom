import 'package:animations/pages/animations_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transforms')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Plain rotation transform
            Transform.rotate(
              angle: -180 * math.pi / 180,
              child: Text('Rotate Only'),
            ),
            SizedBox(height: 110),
            Transform.translate(
              offset: Offset(0, -200),
              child: Transform.scale(
                scale: 3,
                child: Transform.rotate(
                  angle: 65 * math.pi / 180,
                  child: Text('Nested transforms'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AnimationsPage()));
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
