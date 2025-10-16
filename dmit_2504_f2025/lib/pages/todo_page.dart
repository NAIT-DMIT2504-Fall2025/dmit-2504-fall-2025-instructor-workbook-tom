import 'package:dmit_2504_f2025/app_state.dart';
import 'package:dmit_2504_f2025/models/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.appstate});

  final ApplicationState appstate;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    super.initState();

    // On load get the todos from the app state
    setState(() {
      _todoList = widget.appstate.todos!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todoList[index].description),
              trailing: Checkbox(
                value: _todoList[index].completed,
                onChanged: (value) {
                  // TODO: Update the todo item status
                },
              ),
            );
          },
          itemCount: _todoList.length,
        ),
      ),
    );
  }
}
