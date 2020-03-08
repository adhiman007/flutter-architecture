import '../models/user.dart';

abstract class BaseRepository {
  Future<User> getUser({String email, String password});
}
