import 'package:dmit_2504_f2025/app_state.dart';
import 'package:dmit_2504_f2025/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = ApplicationState();

  runApp(MainApp(appState: appState));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appState});

  final ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (context) {
        return HomePage(authAppState: appState);
      },
      '/sign-in': (context) {
        return SignInScreen(
          actions: [
            AuthStateChangeAction((context, authState) {
              // Auth state has changed, find out what happened and handle it
              final user = switch (authState) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null,
              };

              // If the user is null (logout case) do nothing
              if (user == null) {
                return;
              }

              // User is not null so go to the home page
              Navigator.of(context).pop();

              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        );
      },
      '/profile': (context) {
        return ProfileScreen();
      },
    };

    return MaterialApp(routes: routes);
  }
}
