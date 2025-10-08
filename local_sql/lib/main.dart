import 'package:flutter/material.dart';
import 'package:local_sql/models/dog.dart';
import 'package:local_sql/managers/dog_db_manager.dart';
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  final dogManager = DogDbManager.instance;
  final randomGenerator = Random();
  final randomNames = ['Quinn', 'Shinki', 'Crosby', 'Grover', 'Gromet', 'Joe'];

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Dog> dogs = [];
  int lastId = 0;

  @override
  void initState() {
    super.initState();
    // Load existing dogs
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    try {
      final dbDogs = await widget.dogManager.getDogs();

      setState(() {
        dogs = dbDogs;
        lastId = dbDogs.isNotEmpty ? dbDogs.last.id : 0;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _createRandomDog() async {
    try {
      final idx = widget.randomGenerator.nextInt(widget.randomNames.length - 1);
      final randomName = widget.randomNames[idx];

      final newDog = Dog(
        id: lastId + 1,
        name: randomName,
        age: widget.randomGenerator.nextInt(20),
      );

      await widget.dogManager.insertDog(newDog);

      // After we update the backend, make the frontend match it
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeDog(int id) async {
    try {
      await widget.dogManager.deleteDog(id);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${dogs[index].name} - ${dogs[index].age}'),
                onTap: () {
                  _removeDog(dogs[index].id);
                },
              );
            },
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemCount: dogs.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _createRandomDog();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
