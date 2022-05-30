import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double heightContainer;

  const LogoApp({super.key, required this.heightContainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: heightContainer,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter)),
    );
  }
}
