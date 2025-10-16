import 'package:dmit_2504_f2025/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('Cannot set user to null');
    }
    _user = user;
  }

  List<Todo>? _todos;
  List<Todo>? get todos {
    if (user == null) {
      throw ArgumentError('Cannot get todos when user is null');
    }
    return _todos;
  }

  set todos(List<Todo> todos) {
    if (user == null) {
      throw ArgumentError('Cannot set todos when user is null');
    }
    _todos = todos;
  }

  void _fetchTodos() {
    if (user == null) {
      throw ArgumentError('Cannot fetch todos when user is null');
    }
    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .get()
        .then((collectionSnapshot) {
          todos = collectionSnapshot.docs
              .map((doc) => Todo.fromFirestore(doc))
              .toList();
        });
  }

  void updateTodo(Todo todo) {
    if (user == null) {
      throw ArgumentError('Cannot update todos when user is null');
    }

    // Update this doc to make backend todo match our frontend todo
    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .doc(todo.id)
        .update(todo.toMap());
  }

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
        // Store the logged in user in our state
        this.user = user;
        // Every time the user changes (most importantly on login)
        _fetchTodos();
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
