import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const prod = 'prod';
  static const dev = 'dev';
  static const test = 'test';
}
