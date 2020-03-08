import 'package:injectable/injectable.dart';

import '../engine/injection.dart';
import '../models/user.dart';
import 'base_repository.dart';

@RegisterAs(BaseRepository, env: Env.prod)
@injectable
class ProdRepository extends BaseRepository {
  @override
  Future<User> getUser({String email, String password}) async =>
      Future.delayed(Duration(seconds: 2), () {
        return User(
          userId: 1,
          name: 'Prod User',
          email: email,
        );
      });
}
