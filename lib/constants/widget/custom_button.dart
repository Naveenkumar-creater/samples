import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.shade100,
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
      child: ElevatedButton(
        child: Container(
            width: double.infinity,
            height: 50,
            child: Center(child: Text(text))),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
