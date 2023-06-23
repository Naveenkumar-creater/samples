// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:suja_shoei_app_/constants/global_variable.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const GradientButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            GlobalVariables.gradient1,
            GlobalVariables.gradient2,
            GlobalVariables.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 40),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
