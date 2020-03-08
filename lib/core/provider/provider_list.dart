import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/login/provider/login_provider.dart';
import '../engine/app_theme.dart';
import '../engine/injection.dart';
import '../models/user.dart';
import '../repository/base_repository.dart';

final List<SingleChildWidget> providers = [
  ..._independentServices,
  ..._providers,
  ..._dependentServices,
];

final List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider(
      create: (context) => LoginProvider(repository: getIt<BaseRepository>())),
];

final List<SingleChildWidget> _independentServices = [];

final List<SingleChildWidget> _dependentServices = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<LoginProvider>(context, listen: false).user,
  ),
];
