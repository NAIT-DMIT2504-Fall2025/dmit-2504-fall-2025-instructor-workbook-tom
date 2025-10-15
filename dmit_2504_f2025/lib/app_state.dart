import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  void init() async {
    // Connect to firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // set up our auth providers
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    // Bind a listener
    FirebaseAuth.instance.userChanges().listen((user) {
      // when the user changes check if null and update loggedIn accordingly
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
