import 'package:flutter/material.dart';

class FontRegistry extends StatelessWidget {
  final String heading;
  final String? subheading;

  const FontRegistry(
      {super.key, required this.heading, required this.subheading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: heading),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            children: [
              TextSpan(text: subheading),
            ],
          ),
        ),
      ],
    );
  }
}

class Headings extends StatelessWidget {
  final heading;
  final subHeading;
  const Headings({
    @required this.heading,
    @required this.subHeading,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading,
          style: TextStyle(fontSize: 22, color: Colors.grey.shade500),
        ),
        Text(
          subHeading,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Colors.grey.shade500),
        ),
      ],
    );
  }
}

class Texts extends StatelessWidget {
  final text;
  final subText;
  const Texts({@required this.text, @required this.subText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        Text(subText,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.grey.shade500))
      ],
    );
  }
}
