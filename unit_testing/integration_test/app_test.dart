import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end app tests', () {
    testWidgets('tap on button, verify name and email disappear', (
      tester,
    ) async {
      // Load the app
      await tester.pumpWidget(MainApp());

      // Verify that the text is visible

      // Find the button

      // Tap on the button

      // Wait for rerenders

      // Verify the text has disappeared
    });
  });
}
