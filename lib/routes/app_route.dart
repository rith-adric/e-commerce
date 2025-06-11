import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/register_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String splashScreen = "";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String mainScreen = "mainScreen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return _buildRoute(routeSettings, SplashScreen());
      case loginScreen:
        return _buildRoute(routeSettings, LoginScreen());
      case registerScreen:
        return _buildRoute(routeSettings, RegisterScreen());
      case mainScreen:
        final args = routeSettings.arguments as String? ?? "Guest";
        return _buildRoute(routeSettings, MainScreen(username: args));
      default:
        throw RouteException("Route not found!");
    }
  }

  static Route<dynamic> _buildRoute(
    RouteSettings routeSettings,
    Widget newScreen,
  ) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) => newScreen,
    );
  }
}

class RouteException implements Exception {
  String message;

  RouteException(this.message);
}
