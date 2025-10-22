import 'package:app_state_inherited_notifier/models/user.dart';
import 'package:app_state_inherited_notifier/widgets/user_notifier.dart';
import 'package:flutter/material.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user from the context (userNotifier)
    User user = UserNotifier.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('First Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            ListenableBuilder(
              listenable: user,
              builder: (context, child) {
                return Text('User name: ${user.firstName} ${user.lastName}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          user.firstName = 'Sigourney';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
