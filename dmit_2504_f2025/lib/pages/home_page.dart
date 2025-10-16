import 'package:dmit_2504_f2025/app_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.authAppState});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListenableBuilder(
          listenable: authAppState,
          builder: (context, _) {
            return authAppState.isLoggedIn
                ? Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: Text('go to profile'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/todos');
                        },
                        child: Text('Go to Todos Page'),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text("go to sign in"),
                  );
          },
        ),
      ),
    );
  }
}
