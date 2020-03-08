import 'dart:async';

import 'package:architecture/core/repository/base_repository.dart';

import '../../../core/models/user.dart';
import '../../../core/provider/provider_model.dart';

class LoginProvider extends ProviderModel {
  final BaseRepository repository;
  StreamController<User> _userController = StreamController<User>();

  LoginProvider({this.repository});

  Stream<User> get user => _userController.stream;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    final user = await repository.getUser(email: email, password: password);
    _userController.add(user);
    isLoading = false;
    return true;
    // isLoading = true;
    // _userController.add(User(
    //   email: email,
    //   password: password,
    // ));
    // return Future.delayed(Duration(seconds: 3), () {
    //   isLoading = false;
    //   return true;
    // });
  }
}
