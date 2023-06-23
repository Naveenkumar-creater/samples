import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:suja_shoei_app_/screens/login/auth/screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Flutter Login Web',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
