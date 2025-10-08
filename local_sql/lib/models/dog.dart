class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  // Converts this class into a map that can be used by SQL (sqflite)
  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  // Factory constructor that takes a map from SQL (sqflite) and turns it into a dog
  factory Dog.fromMap(Map<String, Object?> dogMap) {
    return Dog(
      id: dogMap['id'] as int,
      name: dogMap['name'] as String,
      age: dogMap['age'] as int,
    );
  }
}
