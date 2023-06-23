import 'package:flutter/material.dart';

import '../../../../constants/widget/custom_button.dart';

import '../services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  static const String routName = "/auth_screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  final AuthServices authservice = AuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void signInUser() {
    authservice.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: signinFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email or phone number';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter email or Phone number',
                filled: true,
                fillColor: Colors.blueGrey[50],
                labelStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                counterText: 'Forgot password?',
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.blueGrey[50],
                labelStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),
            CustomButton(
              text: "Sign In",
              onTap: () {
                if (signinFormKey.currentState?.validate() == true) {
                  signInUser();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
