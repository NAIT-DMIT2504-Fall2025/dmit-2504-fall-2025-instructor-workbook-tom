import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/models/user.dart';
import 'package:unit_testing/widgets/user_widget.dart';

void main() {
  late User user;
  late Widget app;

  setUp(() {
    user = User(name: "Tom Maurer", email: "tmaurer@nait.ca");

    app = MaterialApp(
      home: Scaffold(body: UserWidget(user: user)),
    );
  });

  testWidgets('UserWidget should display name and email on load', (
    tester,
  ) async {
    // Arrange
    await tester.pumpWidget(app);

    // Act (ish)
    final nameFinder = find.text(user.name);
    final emailFinder = find.text(user.email);
    final buttonFinder = find.byType(ElevatedButton);

    // Assert
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Should hide info when button pressed', (tester) async {
    // Arrange
    await tester.pumpWidget(app);

    // Act (ish)
    final nameFinder = find.text(user.name);
    final emailFinder = find.text(user.email);
    final buttonFinder = find.byType(ElevatedButton);

    // Assert
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);

    // Tap on the button
    await tester.tap(buttonFinder);

    // Wait for set state to finish
    // await tester.pump(Duration(seconds: 1));
    await tester.pumpAndSettle();

    // Assert again
    expect(nameFinder, findsNothing);
    expect(emailFinder, findsNothing);
  });
}
