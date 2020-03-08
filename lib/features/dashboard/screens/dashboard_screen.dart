import 'package:architecture/core/engine/analytics.dart';
import 'package:architecture/core/engine/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/models/user.dart';
import '../../../core/provider/consumer_provider_view.dart';
import '../provider/dashboard_provider.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return ConsumerProviderView<DashboardProvider>(
      provider: DashboardProvider(),
      onProviderReady: (provider) {
        print('onDashboardProviderReady');
        getIt<Analytics>().sendLog({'key':'myKey', 'value': 'myValue'});
      },
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard Screen'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Text('Email: ${user.email}\nPassword: ${user.password}'),
        ),
      ),
    );
  }
}
