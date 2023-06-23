import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suja_shoei_app_/constants/global_variable.dart';
import 'package:suja_shoei_app_/provider/user_provider.dart';
import 'package:suja_shoei_app_/screens/home/home_screen.dart';
import 'package:suja_shoei_app_/screens/login/auth/screen/auth_screen.dart';

import 'login/auth/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthCheckScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Suja Shoei",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}

class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({Key? key}) : super(key: key);

  @override
  _AuthCheckScreenState createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authService.getUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final userToken = user.token;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          // Use the Builder widget to access the nearest ScaffoldMessenger
          return userToken.isNotEmpty ? const HomeScreen() : const AuthScreen();
        },
      ),
    );
  }
}
