import 'package:app_state_provider/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the scaffold in a consumer to access the User App State
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('First Name Page')),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),

                // If I wanted to use Selector I would remove consumer above and wrap this
                Text('User name: ${user.firstName} ${user.lastName}'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Update our user firs name here
            onPressed: () {
              user.firstName = 'Michael';
            },
            child: const Icon(Icons.update),
          ),
        );
      },
    );
  }
}
