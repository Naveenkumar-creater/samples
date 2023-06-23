import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/error_handling.dart';
import '../../../../constants/global_variable.dart';
import '../../../../model/user.dart';
import '../../../../provider/user_provider.dart';
import '../../../home/home_screen.dart';
import '../screen/auth_screen.dart';

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required List<Machine> machines,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        machines: machines,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await pref.setString("auth-token", jsonDecode(res.body)["token"]);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logOutUSer(
    BuildContext context,
  ) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString("auth-token", "");

      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("auth-token");

      if (token == null) {
        pref.setString("auth-token", "");
      }

      var tokenRes = await http
          .post(Uri.parse("$uri/tokenValidate"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': token!,
      });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes =
            await http.get(Uri.parse("$uri/"), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        });

        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

void showSnackBar(BuildContext? context, String message) {
  if (context != null) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
