import 'dart:io';

String promptForName() {
  stdout.writeln('What is your name?');
  return stdin.readLineSync() ?? '';
}

double promptForRadius() {
  stdout.writeln('What is the radius of your circle?');
  return double.parse(stdin.readLineSync() ?? '0');
}

double calculateCircleArea(double radius) {
  return 3.14 * radius * radius;
}
