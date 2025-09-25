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

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

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
            UsernameInput(usernameController: _usernameController),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'The password cannot be nothing';
                }
                if (value.length < 6) {
                  return 'The password must be at least 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(label: Text('Password')),
            ),
            TextButton(
              onPressed: () {
                // First we will validate the fields
                if (_formKey.currentState!.validate()) {
                  // If everything is valid we will "submit" the form
                  // Normally this is where you would make the API request etc.
                  // Instead we will show the username and password using the snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Username: ${_usernameController.text}, Password: ${_passwordController.text}',
                      ),
                    ),
                  );
                  // Then we reset the form
                  _formKey.currentState!.reset();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required TextEditingController usernameController,
    this.label = 'Username',
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      validator: (value) =>
          value == null || value.isEmpty ? 'Username cannot be empty' : null,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
