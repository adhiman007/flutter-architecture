// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:architecture/core/engine/analytics.dart';
import 'package:architecture/core/repository/dev_repository.dart';
import 'package:architecture/core/repository/base_repository.dart';
import 'package:architecture/core/repository/prod_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<Analytics>(() => Analytics());

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerFactory<BaseRepository>(() => DevRepository());
  }

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerFactory<BaseRepository>(() => ProdRepository());
  }
}
