import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/login/provider/login_provider.dart';
import '../engine/app_theme.dart';
import '../models/user.dart';

final List<SingleChildWidget> providers = [
  ..._providers,
  ..._independentServices,
  ..._dependentServices,
];

final List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider(create: (context) => LoginProvider()),
];

final List<SingleChildWidget> _independentServices = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<LoginProvider>(context, listen: false).user,
  ),
];

final List<SingleChildWidget> _dependentServices = [];
