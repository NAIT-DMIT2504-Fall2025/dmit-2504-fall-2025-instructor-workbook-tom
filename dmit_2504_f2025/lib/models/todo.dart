import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String description;
  bool completed;
  String? id;

  Todo({required this.description, required this.completed, this.id});

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Todo(
      completed: data['completed'],
      description: data['description'],
      // Use the document id for the todo id
      id: snapshot.id,
    );
  }
}
