import 'package:flutter/material.dart';

import 'pages/home_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state/state/user_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: const MaterialApp(
        home: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
