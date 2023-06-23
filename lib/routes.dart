import 'package:flutter/material.dart';
import 'package:suja_shoei_app_/screens/home/home_screen.dart';
import 'package:suja_shoei_app_/screens/login/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());

    case HomeScreen.routName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const Scaffold(
                body: Center(
                    child: Text("The Page 404 and the screen doesn't exit")),
              ));
  }
}
