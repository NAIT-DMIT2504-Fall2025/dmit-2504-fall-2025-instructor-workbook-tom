import 'package:flutter/material.dart';
import 'package:app_state_inherited_notifier/models/user.dart';

class UserNotifier extends InheritedNotifier<User> {
  const UserNotifier({super.key, required User user, required Widget child})
    : super(notifier: user, child: child);

  static UserNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserNotifier>();
  }

  static User of(BuildContext context) {
    // Check if the user notifier exists in the widget tree
    final result = maybeOf(context);
    // If no throw error
    if (result == null || result.notifier == null) {
      throw StateError('No UserInheritedNotifier found in context');
    }

    // If yes return User
    return result.notifier!;
  }
}
