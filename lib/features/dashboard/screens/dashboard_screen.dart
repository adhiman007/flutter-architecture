import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/engine/analytics.dart';
import '../../../core/engine/app_theme.dart';
import '../../../core/engine/injection.dart';
import '../../../core/models/user.dart';
import '../../../core/provider/consumer_provider_view.dart';
import '../provider/dashboard_provider.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = Provider.of<User>(context);
    return ConsumerProviderView<DashboardProvider>(
      provider: DashboardProvider(),
      onProviderReady: (provider) {
        print('onDashboardProviderReady');
        getIt<Analytics>().sendLog({'key': 'myKey', 'value': 'myValue'});
      },
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard Screen'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.brightness_high),
                onPressed: () {
                  final theme =
                      Provider.of<ThemeProvider>(context, listen: false);
                  theme.appTheme = theme.appTheme == AppTheme.Light
                      ? AppTheme.Dark
                      : AppTheme.Light;
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Welcome: ', style: textTheme.title),
                  Text(
                    user.name,
                    style:
                        textTheme.title.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
