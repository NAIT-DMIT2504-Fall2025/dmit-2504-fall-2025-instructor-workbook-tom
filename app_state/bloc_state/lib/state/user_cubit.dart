import 'package:bloc_state/models/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Wrap our user in a user state
class UserState {
  User user;
  UserState(this.user);
}

class UserCubit extends Cubit<UserState> {
  // Initialize the cubit with a default user to start, it will be replaced below
  UserCubit() : super(UserState(User("Bobby", "Marlone")));

  // Public Method to emit new User States
  void updateUser(User user) {
    return emit(UserState(user));
  }
}
