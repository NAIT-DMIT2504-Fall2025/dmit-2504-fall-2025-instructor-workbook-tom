import 'package:flutter/material.dart';
import 'package:navigation_intro/routes.dart' as routes;

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page One'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routes.pageTwoRoute);
              },
              child: Text('Route to Page Two'),
            ),
          ],
        ),
      ),
    );
  }
}
