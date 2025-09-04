import 'dart:io';

import 'package:function_problem_change_counter/change_helper.dart';

void main(List<String> arguments) {
  // Prompt the user for their coins
  var coins = promptForChange();

  // Calculate the total dollar value
  var total = calculateTotal(coinCounts: coins);

  // Output the change amount
  stdout.writeln('Your total change amount is \$${total / 100}');
}
