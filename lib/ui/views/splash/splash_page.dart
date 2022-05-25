import 'package:flutter/material.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundPage(),
        Scaffold(
          body: SafeArea(
            child: Center(),
          ),
        ),
      ],
    );
  }
}
