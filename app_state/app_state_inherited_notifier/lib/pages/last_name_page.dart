import 'package:flutter/material.dart';

import 'package:app_state_inherited_notifier/widgets/user_notifier.dart';
import 'package:app_state_inherited_notifier/models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = UserNotifier.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Last Name Page')),
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
        // Update our user last name here
        onPressed: () {
          user.lastName = 'Weaver';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
