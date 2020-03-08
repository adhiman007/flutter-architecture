import 'dart:async';

import '../../../core/models/user.dart';
import '../../../core/provider/provider_model.dart';

class LoginProvider extends ProviderModel {
  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    _userController.add(User(
      email: email,
      password: password,
    ));
    return Future.delayed(Duration(seconds: 3), () {
      isLoading = false;
      return true;
    });
  }
}
