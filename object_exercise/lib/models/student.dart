class Student {
  // Properties
  late String _firstName; // The underscore makes it private
  late String _lastName;
  late int _idNumber;

  // Constructors
  Student({
    required String firstName,
    required String lastName,
    required int idNumber,
  }) {
    this.firstName = firstName;
    _lastName = lastName;
    _idNumber = idNumber;
  }

  Student.emptyStudent() {
    _firstName = '';
    _lastName = '';
    _idNumber = 0;
  }

  Student.copyFromStudent(Student other) {
    _firstName = other.firstName;
    _lastName = other.lastName;
    _idNumber = other._idNumber;
  }

  // Getters and Setters

  String get firstName {
    return _firstName;
  }

  set firstName(String value) {
    // Validate that it is at least 1 character
    if (value.isEmpty) {
      throw Exception('First name must be at least 1 character');
    }
    _firstName = value;
  }

  String get lastName {
    return _lastName;
  }

  int get idNumber {
    return _idNumber;
  }
}

// How you would create a student using the default constructor
// var tom = Student(firstName: 'Tom', lastName: 'Maurer', idNumber: 1);
// How you could create an empty student
// var emptyStudent = Student.emptyStudent();
// How you could copy a student
// var tom2 = Student.copyFromStudent(tom);
