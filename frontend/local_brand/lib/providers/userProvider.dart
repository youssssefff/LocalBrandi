import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/user.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  bool addUser(User user) {
    // Assuming user authentication logic here
    // For simplicity, we'll just set the user as authenticated without checking credentials
    state = user;
    return true;
  }

  bool isLoggedIn() {
    return state != null;
  }

  void logout() {
    state = null;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});
