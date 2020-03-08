import 'package:flutter/material.dart';

import '../provider/provider_model.dart';

class ThemeProvider extends ProviderModel {
  AppTheme _theme = AppTheme.Light;

  ThemeData get theme => themeData[_theme];

  ThemeData get darkTheme => themeData[AppTheme.Dark];

  AppTheme get appTheme => _theme;

  set appTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }
}

enum AppTheme {
  Light,
  Dark,
}

class _ThemeData {
  static const PRIMARY_COLOR = Colors.green;
  static const SECONDARY_COLOR = Colors.green;
  static const ACCENT_COLOR = Colors.greenAccent;

  static const PRIMARY_COLOR_LIGHT = PRIMARY_COLOR;
  static const PRIMARY_COLOR_DARK = PRIMARY_COLOR;
  static const SECONDARY_COLOR_LIGHT = SECONDARY_COLOR;
  static const SECONDARY_COLOR_DARK = SECONDARY_COLOR;
  static const ACCENT_COLOR_LIGHT = ACCENT_COLOR;
  static const ACCENT_COLOR_DARK = ACCENT_COLOR;
  static const FONT_FAMILY = 'Comfortaa';
}

final themeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: _ThemeData.PRIMARY_COLOR_LIGHT,
    accentColor: _ThemeData.ACCENT_COLOR_LIGHT,
    primarySwatch: _ThemeData.SECONDARY_COLOR_LIGHT,
    fontFamily: _ThemeData.FONT_FAMILY,
    buttonTheme: ButtonThemeData(
      buttonColor: _ThemeData.PRIMARY_COLOR_LIGHT,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    primaryIconTheme: IconThemeData(color: Colors.black),
    primaryTextTheme: TextTheme(
      body1: TextStyle(color: Colors.black),
      body2: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),
      caption: TextStyle(color: Colors.black),
      display1: TextStyle(color: Colors.black),
      display2: TextStyle(color: Colors.black),
      display3: TextStyle(color: Colors.black),
      display4: TextStyle(color: Colors.black),
      headline: TextStyle(color: Colors.black),
      overline: TextStyle(color: Colors.black),
      subhead: TextStyle(color: Colors.black),
      subtitle: TextStyle(color: Colors.black),
      title: TextStyle(color: Colors.black),
    ),
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.black),
      body2: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),
      caption: TextStyle(color: Colors.black),
      display1: TextStyle(color: Colors.black),
      display2: TextStyle(color: Colors.black),
      display3: TextStyle(color: Colors.black),
      display4: TextStyle(color: Colors.black),
      headline: TextStyle(color: Colors.black),
      overline: TextStyle(color: Colors.black),
      subhead: TextStyle(color: Colors.black),
      subtitle: TextStyle(color: Colors.black),
      title: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: _ThemeData.PRIMARY_COLOR_DARK,
    accentColor: _ThemeData.ACCENT_COLOR_DARK,
    primarySwatch: _ThemeData.SECONDARY_COLOR_DARK,
    fontFamily: _ThemeData.FONT_FAMILY,
    buttonTheme: ButtonThemeData(
      buttonColor: _ThemeData.PRIMARY_COLOR_LIGHT,
      textTheme: ButtonTextTheme.primary,
    ),
    primaryIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    primaryTextTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      display1: TextStyle(color: Colors.white),
      display2: TextStyle(color: Colors.white),
      display3: TextStyle(color: Colors.white),
      display4: TextStyle(color: Colors.white),
      headline: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Colors.white),
      title: TextStyle(color: Colors.white),
    ),
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      display1: TextStyle(color: Colors.white),
      display2: TextStyle(color: Colors.white),
      display3: TextStyle(color: Colors.white),
      display4: TextStyle(color: Colors.white),
      headline: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Colors.white),
      title: TextStyle(color: Colors.white),
    ),
  ),
};
