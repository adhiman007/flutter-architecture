import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/engine/app_theme.dart';
import 'core/engine/injection.dart';
import 'core/provider/provider_list.dart';
import 'core/provider/provider_view.dart';
import 'core/route/router.gr.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ProviderView<ThemeProvider>(
        builder: (context, provider, _) => MaterialApp(
          title: 'Flutter Architecture',
          theme: provider.theme,
          navigatorKey: Router.navigator.key,
          onGenerateRoute: Router.onGenerateRoute,
          initialRoute: Router.loginScreen,
        ),
      ),
    );
  }
}
