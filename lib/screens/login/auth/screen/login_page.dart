import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suja_shoei_app_/constants/global_variable.dart';
import 'package:suja_shoei_app_/responsive/responsive.dart';
import 'package:suja_shoei_app_/screens/login/auth/screen/auth_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          children: const [LoginScreen()],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Responsive(
        tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.35),
            SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 450,
                  child: AuthScreen(),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          ],
        ),
        desktop: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: LoginScreenTopImage(),
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 450),
                        child: AuthScreen(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ],
            );
          },
        ),
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            Row(
              children: const [
                Expanded(
                  flex: 7,
                  child: AuthScreen(),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreenTopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Column(
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
