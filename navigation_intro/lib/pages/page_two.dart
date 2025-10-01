import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page Two'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('You Left Page Two');
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
