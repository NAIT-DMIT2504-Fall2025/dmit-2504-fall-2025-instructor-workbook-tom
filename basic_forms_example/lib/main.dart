import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: UserLoginForm())),
    );
  }
}

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({super.key});
  @override
  State<UserLoginForm> createState() => _UserLoginFormState();
}

class _UserLoginFormState extends State<UserLoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Form'),
            TextFormField(decoration: InputDecoration(label: Text('Username'))),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(label: Text('Password')),
            ),
            TextButton(onPressed: () {}, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
