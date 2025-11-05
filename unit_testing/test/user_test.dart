import 'package:test/test.dart';

import 'package:unit_testing/models/user.dart';

void main() {
  group('User Model Tests', () {
    late User user;

    setUp(() {
      user = User(name: 'Malificent', email: 'dchaney@example.com');
    });

    test('User should have an accessible name and email', () {
      expect(user.name, 'Malificent');
      expect(user.email, 'dchaney@example.com');
    });

    test('User should override toString correctly', () {
      // Arrange
      // This is your setup stuff
      var expected = 'Name: Malificent, Email: dchaney@example.com';

      // Act
      var actual = user.toString();

      // Assert
      expect(actual, expected);
    });
  });
}
