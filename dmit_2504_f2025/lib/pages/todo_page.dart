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
            final todo = _todoList[index];
            return Dismissible(
              key: UniqueKey(),
              child: ListTile(
                title: Text(todo.description),
                trailing: Checkbox(
                  value: todo.completed,
                  onChanged: (value) {
                    // Update frontend first
                    setState(() {
                      todo.completed = value!;
                      // Update backend next (We should handle failures but we won't in this example)
                      widget.appstate.updateTodo(todo);
                    });
                  },
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.appstate.deleteTodo(todo);
                  _todoList.removeAt(index);
                });
              },
            );
          },
          itemCount: _todoList.length,
        ),
      ),
    );
  }
}
