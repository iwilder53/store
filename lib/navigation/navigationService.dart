// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wildersmerch/screens/auth/login_screen.dart';
import 'package:wildersmerch/screens/auth/register.dart';
import 'package:wildersmerch/screens/homepage.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NamedRoute.homeScreen:
      return _getPageRoute(const HomeScreen());

    case NamedRoute.loginScreen:
      return _getPageRoute(LoginScreen());

    case NamedRoute.registerScreen:
      return _getPageRoute(RegisterScreen());

    default:
      return _getPageRoute(const HomeScreen());
  }
}

PageRoute _getPageRoute(Widget screen) {
  return MaterialPageRoute(builder: (context) => screen);
}
