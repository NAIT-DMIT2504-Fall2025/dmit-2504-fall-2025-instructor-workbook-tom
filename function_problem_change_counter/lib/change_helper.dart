import 'dart:io';

/// Prompts a user for their change counts
/// [Returns] ordered list of coins (pennies, nickels, dimes, quarters, loonies, toonies)
List<int> promptForChange() {
  List<int> output = [];

  List<String> coinTypes = [
    'pennies',
    'nickels',
    'dimes',
    'quarters',
    'loonies',
    'toonies',
  ];

  // Prompt for each type of coin
  for (var coinType in coinTypes) {
    stdout.writeln('How many $coinType do you have in your pocket?');
    late int coinCount;

    // Validate that input is a valid integer
    try {
      coinCount = int.parse(stdin.readLineSync()!);
    } catch (e) {
      throw Exception('User did not enter an integer');
    }

    if (coinCount < 0) {
      throw Exception('User enterd a negative number');
    }

    // store the value of the coins
    output.add(coinCount);
  }

  return output;
}

// TODO: Create a function that calculates change total

/// Calculates the total number of cents given an ordered list of coins (pennies, nickels, dimes, quarters, loonies, toonies)
/// [Returns] the total number of cents
int calculateTotal({required List<int> coinCounts}) {
  int total = 0;

  // TODO: Multiply each coin count by its value

  // TODO: sum coin counts

  return total;
}
