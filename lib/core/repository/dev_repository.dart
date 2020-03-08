import 'package:injectable/injectable.dart';

import '../engine/injection.dart';
import '../models/user.dart';
import 'base_repository.dart';

@RegisterAs(BaseRepository, env: Env.dev)
@injectable
class DevRepository extends BaseRepository {
  @override
  Future<User> getUser({String email, String password}) async =>
      Future.delayed(Duration(seconds: 2), () {
        return User(
          userId: 10,
          name: 'Dev User',
          email: email,
        );
      });
}
