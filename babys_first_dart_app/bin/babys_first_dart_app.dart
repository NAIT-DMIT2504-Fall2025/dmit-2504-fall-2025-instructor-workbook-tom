import 'dart:io';

import 'package:babys_first_dart_app/prompt.dart' as prompt;

void main(List<String> arguments) {
  var x = prompt.promptForName();
  stdout.writeln('Hello $x!');

  var area = prompt.calculateCircleArea(prompt.promptForRadius());
  stdout.writeln('Your circle has an area of $area');
}
