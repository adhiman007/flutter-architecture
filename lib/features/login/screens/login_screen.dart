import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/engine/app_theme.dart';
import '../../../core/provider/provider_view.dart';
import '../../../core/route/router.gr.dart';
import '../provider/login_provider.dart';

class LoginScreen extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final showPassword = useState(false);
    final autoValidate = useState(false);
    final appBar = AppBar(
      title: Text('Login Screen'),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.brightness_high),
            onPressed: () {
              final theme = Provider.of<ThemeProvider>(context, listen: false);
              theme.appTheme = theme.appTheme == AppTheme.Light
                  ? AppTheme.Dark
                  : AppTheme.Light;
            })
      ],
    );
    return ProviderView<LoginProvider>(
      onProviderReady: (provider) {
        print('onLoginProviderReady');
      },
      child: Form(
        key: _formKey,
        autovalidate: autoValidate.value,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => emailController.clear(),
                ),
                hintText: 'abc@xyz.com',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value.isEmpty ? 'Need your email' : null,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(showPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => showPassword.value = !showPassword.value,
                ),
                hintText: '*********',
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: !showPassword.value,
              validator: (value) => value.isEmpty ? 'Need your email' : null,
            ),
          ],
        ),
      ),
      builder: (context, provider, child) => Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(size: 8.0 * 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      child,
                      SizedBox(height: 16.0),
                      provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : RaisedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  final result = await provider.login(
                                      emailController.text,
                                      passwordController.text);
                                  if (result)
                                    Router.navigator
                                        .pushNamed(Router.dashboardScreen);
                                } else
                                  autoValidate.value = true;
                              },
                              child: Text('SUBMIT'),
                            ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Flutter Architecture Tutorial'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
